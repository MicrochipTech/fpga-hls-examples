/***************************************************************************//**
 * (c) Copyright 2013-2018 Microsemi SoC Products Group. All rights reserved.
 *
 * Core SPI bare metal software driver public API.
 *
 * This Core SPI driver provides functions for implementing SPI master or
 * SPI slave operations with the CoreSPI version 4.2.xxx It is not compatible
 * with CoreSPI version 3.0.xxx.
 *
 * The Core SPI driver supports two classes of data transfer operation:
 * SPI frame operation or SPI block transfer operations.
 *
 * Frame operations allow transferring individual SPI frames from 4 to 32 bits
 * in length. Block operations allow transferring blocks of data organized as
 * 8 bit frames.
 *
 * SVN $Revision: 9667 $
 * SVN $Date: 2018-01-16 16:43:50 +0530 (Tue, 16 Jan 2018) $
 */
/*=========================================================================*//**
  @mainpage Core SPI Bare Metal Driver.

  @section intro_sec Introduction
  CoreSPI is an IP component that implements a full-duplex, synchronous, and
  configurable serial peripheral interface (SPI) with frame sizes from 4 to 32
  bits and bus interface sizes of 8-, 16-, or 32-bit . Each CoreSPI instance
  can communicate with up to 8 slave devices.

  This driver provides a set of functions for controlling CoreSPI as part of
  the bare metal system where no operating system is available. These drivers
  can be adapted to be used as a part of an operating system, but the
  implementation of the adaptation layer between driver and the operating
  system's driver model is outside the scope of this User�s Guide.

  @section driver_configuration Driver Configuration
  Your application software should configure the CoreSPI driver through calls
  to the SPI_init() function for each CoreSPI instance in the hardware design.
  This function configures a default set of parameters that include a CoreSPI
  hardware instance base address and the depth of the FIFOs for this instance.

  The CoreSPI instance is configured at the time of instantiation in hardware
  design for APB width, frame size, FIFO depth, serial clock speed, serial
  clock polarity, serial clock phase and slave select state parameters.

  CoreSPI can communicate with up to 8 different slave devices that match
  the CoreSPI configuration done at the time of hardware instantiation.

  The functions SPI_configure_slave_mode() and SPI_configure_master_mode() are
  used to configure the CoreSPI instance as a master or as a slave as required by
  the application.

  When CoreSPI wishes to communicate with a specific slave device, the
  function SPI_set_slave_select() is called with the slave number as an
  argument. This function selects the slave device. A previously selected
  slave can be unselected by calling the function SPI_clear_slave_select().
  
  @section theory_op Theory of Operation
  The CoreSPI driver functions are grouped into the following categories:
    �   Initialization
    �   Configuration for either master or slave operations
    �   SPI master frame transfer control
    �   SPI master block transfer control
    �   SPI slave frame transfer control
    �   SPI slave block transfer control
  Frame transfers allow CoreSPI to write or read up to 32 bits of data in a
  single SPI transaction. For example, a frame transfer of 12 bits might be used
  to read the result of an ADC conversion from a SPI analog to digital converter.

  Block transfers allow CoreSPI to write and/or read a number of bytes in a single
  SPI transaction. With the driver as is, block transfer transactions allow data
  transfers in multiples of 8 bits (8, 16, 24, 32, 40�) and the CoreSPI instance
  has to be configured for 8 bit frames. For other frame sizes, the
  SPI_transfer_block() code can act as a template for developing a frame block
  transfer function.
  Block transfers are typically used with byte oriented devices like SPI
  FLASH devices.

  Note: The CoreSPI instance in the hardware design must be configured for
  the frame size required by the application; configuration by driver is
  not possible.

  Initialization
  The CoreSPI driver is initialized through a call to the SPI_init() function.
  The SPI_init() function takes a pointer to the global CoreSPI instance data
  structure of type spi_instance_t and the base address of the CoreSPI instance
  as defined by the hardware design. The CoreSPI instance global data structure
  is used by the driver to store state information for each CoreSPI instance.
  A pointer to these data structures is also used as the first parameter to
  any of the driver functions to identify which CoreSPI will be used by the
  called function. It is the responsibility of the application programmer to
  create and maintain these global CoreSPI instance data structures. Any call
  to a CoreSPI driver function should be of the form SPI_function_name
  ( &g_core_spi0, ... ).
  The SPI_init() function resets the transmit and receives FIFOs of CoreSPI
  instance being initialized.
  The SPI_init() function must be called before any other CoreSPI driver
  functions can be called.

  Configuration
  A CoreSPI instance can operate either as a master or as a slave SPI device.
  There are two distinct functions for configuring a CoreSPI instance for
  master or slave operations.

    Master configuration
    The SPI_configure_master_mode() function configures the specified CoreSPI
    block for operations as a SPI master. This function must be called once
    before the CoreSPI block communicates with a SPI slave device.

    Slave configuration
    The SPI_configure_slave_mode() function configures the specified CoreSPI
    block for operations as a SPI slave. This function must be called after
    SPI_init() call to configure the CoreSPI instance referred by this_spi
    parameter to operate in slave mode.

  SPI master frame transfer control
  The following functions are used as a part of the SPI master frame transfers:
    �   SPI_set_slave_select()
    �   SPI_transfer_frame()
    �   SPI_clear_slave_select()
  The master must first select the target slave or slaves to be addressed through
  a call to SPI_set_slave_select(). This causes the relevant select line(s) to
  become asserted while data is clocked out onto the SPI data line.
  
  A function call is then made to SPI_transfer_frame() specifying the value
  of the data frame to be sent and returning the value read.
  
  The function SPI_clear_slave_select() can be used after the transfer is
  complete to prevent this slave select line from being asserted during
  subsequent SPI transactions. A call to this function is required only if
  the master is communicating with multiple slave devices.

  SPI master block transfer control
  The following functions are used as a part of the SPI master block transfers:
    �   SPI_set_slave_select()
    �   SPI_transfer_block()
    �   SPI_clear_slave_select()
  The master must first select the target slave or slaves through a call to
  SPI_set_slave_select(). This causes the relevant slave select line(s) to 
  become asserted while data is clocked out onto the SPI data line.
  Alternatively, a general purpose input/output (GPIO) can be used to control
  the state of the target slave device�s chip select signal.
  
  A call is then made to the SPI_transfer_block() function. The parameters of
  this function specify the following:
    �   The number of bytes to be transmitted
    �   A pointer to the buffer containing the data to be transmitted
    �   The number of bytes to be received
    �   A pointer to the buffer where received data will be stored
   
  The number of bytes to be transmitted can be set to zero to indicate that the
  transfer is purely a block read transfer. The number of bytes to be received
  can be set to zero to specify that the transfer is purely a block write
  transfer. 
  
  Block mode transfers as implemented by the driver are effectively half duplex
  as we do not store the values received from the slave device whilst we are
  transmitting. If full duplex operation is required the driver 
  SPI_transfer_block() function can serve as a starting point for implementing
  full duplex block transfers.
  
  The SPI_clear_slave_select() function can be used after the transfer is
  complete to prevent this slave select line from being asserted during
  subsequent SPI transactions. A call to this function is only required if
  the master is communicating with multiple slave devices.

  SPI slave frame transfer control
  The following functions are used as a part of the SPI slave frame transfers:
    �   SPI_set_frame_rx_handler()
    �   SPI_set_slave_tx_frame()
   
  The SPI_set_frame_rx_handler() function specifies the receive handler
  function that will be called when a frame of data has been received by the
  SPI when it is configured as a slave. The receive handler function specified
  through this call processes the frame data written over the SPI bus to the
  SPI slave by the remote SPI master. The receive handler function must be
  implemented as part of the application. It is only required if the SPI slave
  is the target of SPI frame write transactions.
  
  The SPI_set_slave_tx_frame() function specifies the frame data that will be
  returned to the SPI master. The frame data specified through this function
  is the value that will be read over the SPI bus by the remote SPI master,
  when it initiates a transaction. A call to SPI_set_slave_tx_frame() is only
  required if the SPI slave is the target of SPI read transactions, i.e., if
  data is meant to be read over CoreSPI.
  
  If both frame handlers are required, the call to SPI_set_frame_rx_handler()
  should be made first otherwise the initial TX frame will be discarded when
  SPI_set_frame_rx_handler() clears the FIFOs as part of its initialization.

  SPI slave block transfer control
  The following functions are used as a part of the SPI slave block transfers:
    �   SPI_set_slave_block_buffers()
    �   SPI_set_cmd_handler()
    �   SPI_set_cmd_response()
   
  The SPI_set_slave_block_buffers() function is used to configure an SPI slave
  for block transfer operations. It specifies the following:
    �   The buffer containing the data that will be returned to the remote SPI
        master
    �   The buffer where data received from the remote SPI master will be
       stored
    �   The optional handler function that will be called after the receive
        buffer is filled.
      
  The SPI_set_cmd_handler() function specifies a command handler function that
  will be called by the driver once a specific number of frames have been
  received after the SPI chip select signal becoming active. The number of
  bytes making up the command part of the transaction is specified as part of
  the parameters to the SPI_set_cmd_handler() function. The command handler
  function is implemented as a part of the application making use of the SPI
  driver and typically calls the SPI_set_cmd_response() function.
  
  The SPI_set_cmd_response() function specifies the data that will be returned
  to the master. Typically, the SPI_set_slave_block_buffers() function is
  called as a part of the system initialisation to specify the data sent to
  the master while the command bytes are being received. The transmit buffer
  specified though the call to the SPI_set_slave_block_buffers() function
  would also typically include one or more bytes allowing the turn around time
  for the command handler function to execute and call the
  SPI_set_cmd_response() function.

 *//*=========================================================================*/
#ifndef CORE_SPI_H_
#define CORE_SPI_H_

#include "../../hal/cpu_types.h"

#ifdef __cplusplus
extern "C" {
#endif

/***************************************************************************//**
 These constants define the maximum and minimum FIFO depths allowed for the
 CoreSPI instance. User need to inform the driver of the FIFO depth for each
 CoreSPI instance to ensure that the FIFOs are managed correctly.
 */
#define SPI_MAX_FIFO_DEPTH               32u
#define SPI_MIN_FIFO_DEPTH               1u

/***************************************************************************//**
 Instances of this structure are used to identify specific CoreSPI hardware
 instances. A pointer to an instance of the spi_instance_t structure is passed
 as the first parameter to the CoreSPI driver functions to identify which SPI
 performs the requested operation.
 */
typedef struct spi_instance spi_instance_t;

/***************************************************************************//**
 This function pointer type is to assign a callback function for TX interrupt
 when slave wants send the next updated frame.

 Declaring and Implementing Slave Frame Receive Handler Functions:
    Slave transmit frame update handler functions should follow the following
    prototype:
        void slave_txframe_update_handler ( spi_instance_t * this_spi );
    The actual name of the receive handler is unimportant. You can use any name
    of your choice for the frame update handler.

    A common handler may be used for more than one slave instance as the particular
    slave device currently requiring service is indicated.
 */
typedef void (*spi_slave_frame_tx_handler_t)( spi_instance_t * this_spi );

/***************************************************************************//**
  This defines the function prototype that must be followed by the SPI slave
  frame receive handler functions. These functions are registered with the SPI
  driver through the SPI_set_frame_rx_handler() function.

  Declaring and Implementing the Slave Frame Receive Handler Functions:
     The Slave frame receive handler functions should follow the following
     prototype:
         void slave_frame_receive_handler(uint32_t rx_frame);
     The actual name of the receive handler is unimportant. You can use any name
     of your choice for the receive frame handler. The rx_frame parameter will
     contain the value of the received frame.
    
     Separate handler functions are required for each slave instance as there is
     no indication of the slave requiring service passed to the handler.

 */
typedef void (*spi_frame_rx_handler_t)( uint32_t rx_frame );

/***************************************************************************//**
  This defines the function prototype that must be followed by SPI slave
  block receive handler functions. These functions are registered with the
  SPI driver through the SPI_set_slave_block_buffers() function.

  Declaring and Implementing Slave Block Receive Handler Functions
     Slave block receive handler functions should follow the following prototype:
         void spi_block_rx_handler ( uint8_t * rx_buff, uint16_t rx_size );
     The actual name of the receive handler is unimportant. You can use any name
     of your choice for the receive frame handler. The rx_buff parameter will
     contain a pointer to the start of the received block. The rx_size parameter
     will contain the number of bytes of the received block.
    
     Separate handler functions are required for each slave instance as there is
     no indication of the slave requiring service passed to the handler.

 */
typedef void (*spi_block_rx_handler_t)( uint8_t * rx_buff, uint32_t rx_size );

/***************************************************************************//**
 This enumeration is used to select a specific SPI slave device (0 to 7). It is
 used as a parameter to the SPI_configure_master_mode(), SPI_set_slave_select(),
 and SPI_clear_slave_select() functions.
 */
typedef enum __spi_slave_t
{
    SPI_SLAVE_0     = 0,
    SPI_SLAVE_1     = 1,
    SPI_SLAVE_2     = 2,
    SPI_SLAVE_3     = 3,
    SPI_SLAVE_4     = 4,
    SPI_SLAVE_5     = 5,
    SPI_SLAVE_6     = 6,
    SPI_SLAVE_7     = 7,
    SPI_MAX_NB_OF_SLAVES = 8
} spi_slave_t;

/***************************************************************************//**
 This enumeration is used to indicate the current slave mode transfer type so
 that we are not relying on buffer comparisons to dictate the logic of the driver.
 */
typedef enum __spi_sxfer_mode_t
{
    SPI_SLAVE_XFER_NONE  = 0, /* Not configured yet */
    SPI_SLAVE_XFER_BLOCK = 1, /* Block transfers, with SSEND delimiting end of block */
    SPI_SLAVE_XFER_FRAME = 2  /* Single frame transfers */
} spi_sxfer_mode_t;

/***************************************************************************//**
  There is one instance of this structure for each of the core SPIs. Instances
  of this structure are used to identify a specific SPI. A pointer to an
  instance of the spi_instance_t structure is passed as
  the first parameter to SPI driver functions to identify which SPI should
  perform the requested operation.
 */
struct spi_instance{

    /** Base address in the processor's memory map for the
     * registers of the CoreSPI instance being initialized. */
    addr_t base_addr;                   /*!< Base address of SPI hardware instance. */

    uint32_t rx_frame;                  /*!< received data */

    /* Internal transmit state: */
    const uint8_t * slave_tx_buffer;    /*!< Pointer to slave transmit buffer. */
    uint32_t slave_tx_size;             /*!< Size of slave transmit buffer. */
    uint32_t slave_tx_idx;              /*!< Current index into slave transmit buffer. */

    /* Slave command response buffer: */
    const uint8_t * resp_tx_buffer;
    uint32_t resp_buff_size;
    uint32_t resp_buff_tx_idx;
    spi_block_rx_handler_t cmd_handler;
    uint32_t cmd_done;                  /*!< Flag which indicates response has been set up and
                                             it is safe to pad with 0s once the response is sent. */

    /* Internal receive state: */
    uint8_t * slave_rx_buffer;          /*!< Pointer to buffer where data received by a slave will be stored. */
    uint32_t slave_rx_size;             /*!< Slave receive buffer size. */
    uint32_t slave_rx_idx;              /*!< Current index into slave receive buffer. */

    /** Slave received frame handler: */
    spi_frame_rx_handler_t frame_rx_handler;    /*!< Pointer to function that will be called when a frame
                                                     is received when the SPI block is configured as slave. */
    /** Slave transmitted frame handler: */
    uint32_t slave_tx_frame;                    /*!< Value of the data frame that will be transmitted
                                                     when the SPI block is configured as slave. */
    spi_slave_frame_tx_handler_t slave_tx_frame_handler; /*!< Callback function pointer to update slave_tx_frame */

    /* Slave block rx handler: */
    spi_block_rx_handler_t block_rx_handler;    /*!< Pointer to the function that will be called when a data block has been received. */

    /* Per instance specific hardware information that the driver needs to know */
    uint16_t fifo_depth;                 /*!< Depth of RX and TX FIFOs in frames. */

    /* How we are expecting to deal with slave transfers */
    spi_sxfer_mode_t slave_xfer_mode;    /*!< Current slave mode transfer configuration. */
};

/*==============================================================================
 * Public functions
 *============================================================================*/

/***************************************************************************//**
  The SPI_init() function initializes the hardware and data structures of a
  CoreSPI instance referenced by this_spi parameter. This function must be
  called for each CoreSPI instance with a unique this_spi and base_addr
  parameter combination. The SPI_init() function must be called before any
  other CoreSPI driver functions are called.
  
  After SPI_init() has been called, the CoreSPI will be configured as a master,
  all interrupt sources will be masked and all slaves deselected.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to be initialized. This parameter must point to
  the g_core_spi global data structure defined within the application code.

  @param base_addr
  The base_addr parameter is the base address in the processor's memory map for
  the registers of the CoreSPI instance being initialized. It is assumed that
  any non NULL value passed in here points to a valid instance of a CoreSPI as
  the driver has no way of verifying this. Failure to pass in a valid address
  can result in system instability.

  @param fifo_depth
  The fifo_depth parameter specifies the number of frames in the receive
  and transmit FIFOs of the CoreSPI instance being initialized.

  @return
  This function does not return any value.

  Example:
  @code
    #define SPI0_BASE_ADDR 0xC2000000

    spi_instance_t g_spi0;
    SPI_init( &g_spi0, SPI0_BASE_ADDR, 8 );
  @endcode
 */
void SPI_init
(
    spi_instance_t * this_spi,
    addr_t base_addr,
    uint16_t fifo_depth
);

/***************************************************************************//**
  The SPI_configure_slave_mode() function is used when a CoreSPI instance is
  to be configured as a SPI slave.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to be configured. This parameter must point to
  the g_core_spi global data structure defined within the application code.

  @return
  This function does not return any value.

  Example:
  @code
     #define SPI0_BASE_ADDR 0xC2000000

     spi_instance_t g_spi0;

     int main(void)
     {
        SPI_init( &g_spi0, SPI0_BASE_ADDR, 8 );
        SPI_configure_slave_mode ( &g _spi0 );
     }
  @endcode
 */
void SPI_configure_slave_mode
(
    spi_instance_t * this_spi
);

/***************************************************************************//**
  The SPI_configure_master_mode() function is used when a CoreSPI instance is
  to be configured as a SPI master.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to be configured. This parameter must point to
  a g_core_spi global data structure defined within the application code.

  @return
  This function does not return any value.

  Example:
  @code
  #define SPI0_BASE_ADDR 0xC2000000

  spi_instance_t g_spi0;

  int main(void)
  {
    SPI_init( &g_spi0, SPI0_BASE_ADDR, 8 );
    SPI_configure_master_mode ( &g _spi0 );
  }
  @endcode
 */
void SPI_configure_master_mode
(
    spi_instance_t * this_spi
);

/***************************************************************************//**
  The SPI_set_slave_select() function is used by a CoreSPI master to select a
  specific slave. This function causes the relevant slave select signal to be
  asserted while data is clocked out onto the SPI data line.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  a g_core_spi global data structure defined within the application code.

  @param slave
  The slave parameter is one of the spi_slave_t enumerated constants
  identifying a slave.

  @return
  This function does not return any value.

  Example:
  @code
  #define SPI0_BASE_ADDR 0xC2000000

  spi_instance_t g_spi0;
  const uint32_t master_tx_frame = 0x0100A0E1;

  SPI_init( &g_spi0, SPI0_BASE_ADDR, 1 );
  SPI_configure_master_mode( &g_spi0 );

  SPI_set_slave_select( &g_spi0, SPI_SLAVE_0 );
  SPI_transfer_frame( &g_spi0, master_tx_frame );
  SPI_clear_slave_select( &g_spi0, SPI_SLAVE_0 );

  @endcode
 */
void SPI_set_slave_select
(
    spi_instance_t * this_spi,
    spi_slave_t slave
);

/***************************************************************************//**
  The SPI_clear_slave_select() function is used by a CoreSPI master to
  deselect a specific slave. This function causes the relevant slave select
  signal to be de-asserted. 

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  a g_core_spi global data structure defined within the application code.

  @param slave
  The slave parameter is one of the spi_slave_t enumerated constants
  identifying a slave.

  @return
  This function does not return any value.

  Example:
  @code
  #define SPI0_BASE_ADDR 0xC2000000

  spi_instance_t g_spi0;
  const uint32_t master_tx_frame = 0x0100A0E1;

  SPI_init( &g_spi0, SPI0_BASE_ADDR, 1 );
  SPI_configure_master_mode( &g_spi0 );

  SPI_set_slave_select( &g_spi0, SPI_SLAVE_0 );
  SPI_transfer_frame( &g_spi0, master_tx_frame );
  SPI_clear_slave_select( &g_spi0, SPI_SLAVE_0 );
  @endcode
 */
void SPI_clear_slave_select
(
    spi_instance_t * this_spi,
    spi_slave_t slave
);

/***************************************************************************//**
  The SPI_transfer_frame() function is used by a SPI master to transmit and
  receive a single frame of the size that has been configured at the time of
  CoreSPI hardware instantiation. This function is typically used for
  transactions with a SPI slave where the number of transmit and receive bits
  are not divisible by 8 or where full duplex exchange of frames is required.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  a g_core_spi global data structure defined within the application code.

  @param tx_bits
  The tx_bits parameter is a 32-bit word containing the value that will be
  transmitted. If the frame size configured for the CoreSPI in question is
  less that 32 bits, the upper bits will be ignored.
  Note:     The bit length of the value to be transmitted to the slave is
  set when the CoreSPI is instantiated in the hardware design.

  @return
  This function returns a 32-bit word containing the value that is received
  from the slave. If the frame size configured for the CoreSPI in question is
  less that 32 bits, the upper bits will be 0.

  Example:
  @code
  #define SPI0_BASE_ADDR 0xC2000000

  spi_instance_t g_spi0 ;
  const uint32_t master_tx_frame = 0x0100A0E1;
  uint32_t master_rx;

  SPI_init(&g_spi0, SPI0_BASE_ADDR, 1 );
  SPI_configure_master_mode( &g_spi0 );
  SPI_set_slave_select( &g_spi0, SPI_SLAVE_0 );
  master_rx = SPI_transfer_frame( &g_spi0, master_tx_frame );
  SPI_clear_slave_select( &g_spi0, SPI_SLAVE_0 );
  @endcode
 */
uint32_t SPI_transfer_frame
(
    spi_instance_t * this_spi,
    uint32_t tx_bits
);

/***************************************************************************//**
  The SPI_transfer_block() function is used by the SPI master to transmit and
  receive blocks of data organized as a specified number of 8 bit frames. It
  can be used for the following:
    �    Writing a data block to a slave
    �    Reading a data block from a slave
    �    Sending a command to a slave followed by reading the outcome of
        the command in a single SPI transaction.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  a g_core_spi global data structure defined within the application code.

  @param cmd_buffer
  The cmd_buffer parameter is a pointer to the buffer containing the data that
  will be sent by the master from the beginning of the transfer. This pointer
  can be null (0) if the master does not need to send a command before reading
  data.

  @param cmd_byte_size
  The cmd_byte_size parameter specifies the number of bytes contained in
  cmd_buffer that will be sent. A value �0� indicates that no data needs
  to be sent to the slave.

  @param rx_buffer
  The rx_buffer parameter is a pointer to the buffer where the data received
  from the slave after the command has been sent will be stored. This pointer
  can be null (0) if the master does not need to receive any data from the
  slave.

  @param rx_byte_size
  The rx_byte_size parameter specifies the number of bytes to be received from
  the slave and stored in the rx_buffer. A value �0� indicates that no data is
  to be read from the slave.

  @return
  This function does not return any value.

  Example:
  @code
    Polled write transfer example
      #define SPI0_BASE_ADDR 0xC2000000

      spi_instance_t g_spi0 ;

      uint8_t master_tx_buffer[MASTER_TX_BUFFER] =
      {
          0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A
      };
      SPI_init( &g_spi0, SPI0_BASE_ADDR, 8 );

      SPI_configure_master_mode( &g_spi0 );

      SPI_set_slave_select( &g_spi0, SPI_SLAVE_0) ;
      SPI_transfer_block
        (
            &g_spi0,
            master_tx_buffer,
            sizeof(master_tx_buffer),
            0,
            0
        );
      SPI_clear_slave_select(&g_spi0, SPI_SLAVE_0 );
  @endcode
 */
void SPI_transfer_block
(
    spi_instance_t * this_spi,
    const uint8_t * tx_buffer,
    uint16_t tx_byte_size,
    uint8_t * rx_buffer,
    uint16_t rx_byte_size
);

/***************************************************************************//**
  The SPI_set_frame_rx_handler() function is used by the SPI slaves to specify
  the receive handler function that will be called by the SPI driver interrupt
  handler when a frame of data is received by the SPI slave.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  a g_core_spi global data structure defined within the application code.

  @param rx_handler
  The rx_handler parameter is a pointer to the frame receive handler that must
  be called when a frame is received by the CoreSPI slave. Passing in a NULL
  pointer disables the receive handler but does enable the receive interrupt to
  ensure the RX FIFO is emptied each time a frame is received.

  @return
  This function does not return any value.

  Example:
  @code
    #define SPI0_BASE_ADDR 0xC2000000

    uint32_t g_slave_rx_frame = 0;
    spi_instance_t g_spi0;

    void slave_frame_handler(uint32_t rx_frame)
    {
        g_slave_rx_frame = rx_frame;
    }
    int setup_slave( void )
    {
       SPI_init( &g_spi0, SPI0_BASE_ADDR, 1 );
       SPI_configure_slave_mode( &g_spi0 );
       SPI_set_frame_rx_handler( &g_spi0, slave_frame_handler );
    }
  @endcode
 */
void SPI_set_frame_rx_handler
(
    spi_instance_t * this_spi,
    spi_frame_rx_handler_t rx_handler
);

/***************************************************************************//**
  The SPI_set_slave_tx_frame() function is used by the SPI slaves to specify
  the frame that will be transmitted, when a transaction is initiated by
  the SPI master. This function allows you to assign a slave_tx_frame_handler
  function which will be executed upon transmit interrupt when the SPI is
  in slave mode.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  a g_core_spi global data structure defined within the application code.

  @param frame_value
  The frame_value parameter contains the value of the frame to be sent to the
  master.
  Note: The bit length of the value to be transmitted to the master is
  set when the CoreSPI is instantiated in the hardware design.

  @param slave_tx_frame_handler
  The slave_tx_frame_handler function pointer will be executed upon occurrence of
  transmit interrupt when CoreSPI is operating in slave mode. This parameter
  is optional and if set to NULL it is assumed that the frame value is static or
  updated asynchronously.

  @return
  This function does not return any value.

  Example:
  @code
  #define SPI0_BASE_ADDR 0xC2000000

  spi_instance_t g_spi0 ;
  const uint32_t slave_tx_frame[2] = { 0x0110F761, 0x0110F671 };
  uint32_t master_rx;
  uint32_t slave_frame_idx = 0 ;

  slave_frame_update( spi_instance_t * this_spi )
  {
     this_spi->slave_tx_frame = slave_tx_frame[slave_frame_idx++];
     if( slave_frame_idx > 2 )
         slave_frame_idx = 0;
  }
  main()
  {
       SPI_init( &g_spi0, SPI0_BASE_ADDR, 1 );
     SPI_configure_master_mode( &g_spi0 ) ;
     SPI_set_slave_tx_frame( &g_spi0, slave_tx_frame[slave_frame_idx++],
                         &slave_frame_update );
  }
  @endcode
 */
void SPI_set_slave_tx_frame
(
    spi_instance_t * this_spi,
    uint32_t frame_value,
    spi_slave_frame_tx_handler_t slave_tx_frame_handler
);

/***************************************************************************//**
  The SPI_set_slave_block_buffers() function is used to configure an SPI slave
  for block transfer operations. It specifies one or more of the following:
    �   The data that will be transmitted when accessed by a master.
    �   The buffer where the data received from a master will be stored.
    �   The handler function that must be called after the receive buffer has
        been filled.
    �   The number of bytes that must be received from the master before the
        receive handler function is called.
    These parameters allow the following use cases:
    �   Slave performing an action after receiving a block of data from a
        master containing a command. This action will be performed by the
        receive handler based on the content of the receive data buffer.
    �   Slave returning a block of data to the master. The type of information
        is always the same but the actual values change over time. For example,
        returning the voltage of a predefined set of analog inputs.
    �   Slave returning data based on a command contained in the first part of
        the SPI transaction. For example, reading the voltage of the analog
        input specified by the first data byte by the master. This is achieved
        by using the SPI_set_slave_block_buffers() function in conjunction with
        functions SPI_set_cmd_handler() and SPI_set_cmd_response().
        
        Refer to the SPI_set_cmd_handler() function description for details of
        this use case.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  a g_core_spi global data structure defined within the application code.

  @param tx_buffer
  The tx_buffer parameter is a pointer to a buffer containing the data that
  will be sent to the master. This parameter can be set to �0� if the SPI
  slave is not intended to be the target of SPI read transactions.

  @param tx_buff_size
  The tx_buff_size parameter specifies the number of bytes that will be
  transmitted by the SPI slave. It is the number of bytes contained in the
  tx_buffer. This parameter can be set to �0� if the SPI slave is not
  intended to be the target of SPI read transactions. The driver returns 0s
  to the master if there is no buffer specified or the master reads beyond the
  end of the buffer.
  Note. If SPI_transfer_block() is used to read from this slave and there
  is no command handler involved, the buffer size here must be at least the
  combined length of the command and response specified by the master and the 
  bytes at the start corresponding to the command will be discarded by the
  master.

  @param rx_buffer
  The rx_buffer parameter is a pointer to the buffer where data received
  from the master will be stored. This parameter can be set to �0� if the
  SPI slave is not intended to be the target of SPI write or write-read
  transactions.

  @param rx_buff_size
  The rx_buff_size parameter specifies the size of the receive buffer. It is
  also the number of bytes that must be received before the receive handler
  is called, if a receive handler is specified using the block_rx_handler
  parameter. Any bytes received in excess of this are discarded.
  This parameter can be set to �0� if the SPI slave is not intended
  to be the target of SPI write or write-read transactions.

  @param block_rx_handler
  The block_rx_handler parameter is a pointer to a function that will be called
  when receive buffer has been filled or the slave select has been de-asserted.
  This parameter can be set to �0� if the SPI slave is not intended to be the
  target of SPI write or write-read transactions.

  @return
  This function does not return any value.

  Example:
  @code
    Slave Performing Operation Based on Master Command:
    In this example the SPI slave is configured to receive 10 bytes of data
    or command from the SPI slave, and process the data received from the master.

    #define SPI0_BASE_ADDR 0xC2000000

    uint32_t nb_of_rx_handler_calls = 0;
     spi_instance_t g_spi0;

     void spi1_block_rx_handler_b
     (
         uint8_t * rx_buff,
         uint16_t rx_size
     )
     {
         ++nb_of_rx_handler_calls;
     }

     void setup_slave( void )
     {
         uint8_t slave_rx_buffer[10] =
         {
             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
         };

         SPI_init( &g_spi0, SPI0_BASE_ADDR, 8 );
         SPI_configure_slave_mode( &g_spi0 );

         SPI_set_slave_block_buffers
             (
                 &g_spi0,
                 0,
                 0,
                 slave_rx_buffer,
                 sizeof( master_tx_buffer ),
                 spi1_block_rx_handler_b
             );
     }
  @endcode
 */
void SPI_set_slave_block_buffers
(
    spi_instance_t * this_spi,
    const uint8_t * tx_buffer,
    uint32_t tx_buff_size,
    uint8_t * rx_buffer,
    uint32_t rx_buff_size,
    spi_block_rx_handler_t block_rx_handler
);

/***************************************************************************//**
  The SPI_isr() function is the top level interrupt handler function for the
  CoreSPI driver. You must call SPI_isr() from the system level
  (CoreInterrupt and NVIC level) interrupt handler assigned to the interrupt
  triggered by the CoreSPI SPIINT signal. Your system level interrupt handler
  must also clear the system level interrupt triggered by the CoreSPI SPIINT
  signal before returning, to prevent a re-assertion of the same interrupt.

  This function supports all types of interrupt triggered by CoreSPI. It is not
  a complete interrupt handler by itself; rather, it is a top level wrapper that
  abstracts CoreSPI command interrupt and slave mode transmit interrupt handling
  by calling lower level handler functions specific to each type of CoreSPI
  interrupt. You must create the lower level handler functions to suit your
  application and register them with the driver through calls to the
  SPI_set_cmd_handler(), SPI_set_cmd_response() and SPI_set_slave_tx_frame()
  functions.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  the g_core_spi global data structure defined within the application code.

  @return
  This function does not return any value.

  Example:
  @code

  Example of configuring a CoreInterrupt connected to the Fabric Interrupt on a
  SmartFusion device to handle CoreSPI interrupt.

  #define #define SPI1_INT_IRQ_NB 0
  spi_instance_t g_spi0;

  Void CIC_irq1_handler(void)
  {
      SPI_isr( &g_spi0 );
  }

  void Fabric_IRQHandler( void )
  {
      // Call the CoreInterrupt driver ISR to determine the source of the
      // interrupt and call the relevant ISR registered to it.
      CIC_irq_handler();

      // Clear NVIC interrupt status to allow further interrupts
      NVIC_ClearPendingIRQ( Fabric_IRQn );
  }

  main()
  {
      ...

      CIC_init( CIC_BASE_ADDR );

      // Install handler for SPI IRQ
      CIC_set_irq_handler( SPI0_INT_IRQ_NB, CIC_irq1_handler );

      NVIC_ClearPendingIRQ( Fabric_IRQn );
      NVIC_EnableIRQ( Fabric_IRQn );

      CIC_enable_irq( SPI1_INT_IRQ_NB );

      ...
  }
  @endcode
 */
void SPI_isr
(
    spi_instance_t * this_spi
);

/***************************************************************************//**
  The SPI_set_cmd_handler() function specifies a command handler function that
  will be called when the number of bytes received reaches the command size
  specified as parameter cmd_size.
  
  This function is used by the SPI slaves performing block transfers. Its 
  purpose is to allow a SPI slave to decide the data that will be returned to
  the master while a SPI transaction is taking place. Typically, one or more
  command bytes are sent by the master to request some specific data. The slave
  interprets the command byte(s) while one or more turn-around bytes are 
  transmitted. The slave adjusts its transmit data buffer based on the command
  during the turn around time.

  The diagram below provides an example of the use of this function where the
  SPI slave returns data bytes D0 to D6 based on the value of a command. The
  3 bytes long command is made up of a command opcode byte followed by an 
  address byte followed by a size byte. The cmd_handler() function specified 
  through an earlier call to SPI_set_cmd_handler() is called by the CoreSPI
  driver once the third byte is received. The cmd_handler() function 
  interprets the command bytes and calls SPI_set_cmd_response() to set the SPI
  slave's response transmit buffer with the data to be transmitted after the
  turnaround bytes (T0 to T3). The number of turnaround bytes must be 
  sufficient to give enough time for the cmd_handler() to execute. The number
  of turnaround bytes is specified by the protocol used on top of the SPI
  transport layer so that master and slave agree on the number of turn around
  bytes.

    t0          t1       t2         t3                                 t4
    |           |        |          |                                  |
    |------------------------------------------------------------------|
    |  COMMAND  |    TURN-AROUND    |               DATA               |
    |------------------------------------------------------------------|
    | C | A | S | T0 | T1 | T2 | T3 | D0 | D1 | D2 | D3 | D4 | D5 | D6 |
    |------------------------------------------------------------------|
                |
                |
                --> cmd_handler() called here.
                         |
                         |
                         --> SPI_set_cmd_response() called here by
                             implementation of cmd_handler() to set the data
                             that will be transmitted by the SPI slave.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  the g_core_spi global data structure defined within the application code.

  @param cmd_handler
  The cmd_handler parameter is a pointer to a function with the prototype:
      void cmd_handler(uint8_t * rx_buff, uint32_t rx_size);
  It specifies the function that will be called when the number of bytes
  specified by the parameter cmd_size has been received.

  @param cmd_size
  The cmd_size parameter specifies the number of bytes that must be received
  before the command handler function specified by cmd_handler is called. The
  CoreSPI supports cmd_size values in the range 1 to 7.

  @return
  This function does not return any value.

  Example:
  @code
  The following example demonstrates how to configure CoreSPI to implement
  the protocol given as an example above. The configure_slave() function
  configures CoreSPI. It sets receive and transmit buffers. The transmit
  buffer specified through the call to SPI_set_slave_block_buffers() function
  specifies the data that will be returned to the master in bytes between
  t0 and t3. These bytes will be sent to the master while the master transmits
  the command and dummy bytes. The spi_slave_cmd_handler() function will be
  called by the driver at time t1 after the 3 command bytes have been received.
  The spi_block_rx_handler() function will be called by the driver at time t4,
  when the transaction completes and the slave select signal becomes
  de-asserted.

    #define SPI0_BASE_ADDR          0xC2000000
    #define COMMAND_SIZE            3
    #define NB_OF_DUMMY_BYTES       4
    #define MAX_TRANSACTION_SIZE    16

    spi_instance_t g_spi0;
    uint8_t slave_tx_buffer[COMMAND_SIZE + NB_OF_DUMMY_BYTES];
    uint8_t slave_rx_buffer[MAX_TRANSACTION_SIZE];

    void configure_slave( void )
    {
        SPI_init( &g_spi0, SPI0_BASE_ADDR, 8 );
        SPI_configure_slave_mode( &g_spi0 );
        SPI_set_slave_block_buffers
            (
                &g_spi0,
                slave_tx_buffer,
                COMMAND_SIZE + NB_OF_DUMMY_BYTES,
                slave_rx_buffer,
                sizeof(slave_rx_buffer),
                spi_block_rx_handler
            );

        SPI_set_cmd_handler
            (
                &g_spi0,
                spi_slave_cmd_handler,
                COMMAND_SIZE
            );
    }

    void spi_slave_cmd_handler
    (
        uint8_t * rx_buff,
        uint32_t rx_size
    )
    {
        uint8_t command;
        uint8_t address;
        uint8_t size;
        uint8_t * p_response;
        uint32_t response_size;

        command = rx_buff[0];
        address = rx_buff[1];
        size = rx_buff[2];

        p_response = get_response_data( command, address, size, &response_size );
        SPI_set_cmd_response( &g_spi0, p_response, response_size );
    }

    void spi_block_rx_handler
    (
        uint8_t * rx_buff,
        uint32_t rx_size
    )
    {
        process_rx_data( rx_buff, rx_size );
    }
  @endcode
 */
void SPI_set_cmd_handler
(
    spi_instance_t * this_spi,
    spi_block_rx_handler_t cmd_handler,
    uint32_t cmd_size
);

/***************************************************************************//**
  The SPI_set_cmd_response() function specifies the data that will be returned
  to the master. See the description of SPI_set_cmd_handler() for details.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  a g_core_spi global data structure defined within the application code.

  @param resp_tx_buffer
  The resp_tx_buffer parameter is a pointer to the buffer containing the data
  that must be returned to the host in the data phase of a SPI transaction.

  @param resp_buff_size
  The resp_buff_size parameter specifies the size of the buffer pointed to
  by the resp_tx_buffer parameter.

  @return
  This function does not return any value.
 */
void SPI_set_cmd_response
(
    spi_instance_t * this_spi,
    const uint8_t * resp_tx_buffer,
    uint32_t resp_buff_size
);

/***************************************************************************//**
  The SPI_enable() function enables the CoreSPI and allows it respond to external
  signals. It is usually called to re-enable a CoreSPI instance which has been
  disabled previously via a call to SPI_disable() as the normal state of a CoreSPI
  after initialization is enabled.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  the g_core_spi global data structure defined within the application code.

  @return
  This function does not return any value.
 */
void SPI_enable
(
    spi_instance_t * this_spi
);

/***************************************************************************//**
  The SPI_disable() function disables the CoreSPI and stops it responding to
  external signals.

  @param this_spi
  The this_spi parameter is a pointer to a spi_instance_t structure identifying
  the CoreSPI hardware block to operate on. This parameter must point to
  the g_core_spi global data structure defined within the application code.

  @return
  This function does not return any value.
 */
void SPI_disable
(
    spi_instance_t * this_spi
);

#ifdef __cplusplus
}
#endif

#endif /* CORE_SPI_H_*/
