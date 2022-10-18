/*******************************************************************************
 * (c) Copyright 2013-2018 Microsemi SoC Products Group. All rights reserved.
 *
 * CoreSPI bare metal driver implementation for CoreSPI.
 *
 * This Core SPI driver provides functions for implementing SPI master or
 * SPI slave operations with the CoreSPI version 4.2.xxx It is not compatible
 * with CoreSPI version 3.0.xxx.
 *
 * SVN $Revision: 9667 $
 * SVN $Date: 2018-01-16 16:43:50 +0530 (Tue, 16 Jan 2018) $
 */

#include "core_spi.h"

#include "../../hal/hal.h"
#include "../../hal/hal_assert.h"
#include <string.h>
#include "corespi_regs.h"

/*******************************************************************************
 * Null parameters with appropriate type definitions
 */
#define NULL_ADDR              ( ( addr_t ) 0u )
#define NULL_INSTANCE          ( ( spi_instance_t * ) 0u )
#define NULL_BUFF              ( ( uint8_t * ) 0u )
#define NULL_FRAME_HANDLER     ( ( spi_frame_rx_handler_t ) 0u )
#define NULL_BLOCK_HANDLER     ( ( spi_block_rx_handler_t ) 0u )
#define NULL_SLAVE_TX_UPDATE_HANDLER ( ( spi_slave_frame_tx_handler_t ) 0u )
#define NULL_SLAVE_CMD_HANDLER  NULL_BLOCK_HANDLER

#define SPI_ALL_INTS (0xFFu) /* For clearing all active interrupts */

/*******************************************************************************
 * Possible states for different register bit fields
 */

#define    DISABLE 0u
#define    ENABLE  1u


/*******************************************************************************
 * Function return values
 */
enum {
    FAILURE = 0u,
    SUCCESS = 1u
};

/*******************************************************************************
 * Local function declarations
 */
static void fill_slave_tx_fifo( spi_instance_t * this_spi );
static void read_slave_rx_fifo( spi_instance_t * this_spi );
static void recover_from_rx_overflow( const spi_instance_t * this_spi );

/*******************************************************************************
 * SPI_init()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_init
(
    spi_instance_t * this_spi,
    addr_t base_addr,
    uint16_t fifo_depth
)
{
    HAL_ASSERT( NULL_INSTANCE != this_spi );
    HAL_ASSERT( NULL_ADDR != base_addr );
    HAL_ASSERT( SPI_MAX_FIFO_DEPTH  >= fifo_depth );
    HAL_ASSERT( SPI_MIN_FIFO_DEPTH  <= fifo_depth );

    if( ( NULL_INSTANCE != this_spi ) && ( base_addr != NULL_ADDR ) )
    {
        /*
         * Initialize all transmit / receive buffers and handlers
         *
         * Relies on the fact that byte filling with 0x00 will equate
         * to 0 for any non byte sized items too.
         */

        /* First fill struct with 0s */
        memset( this_spi, 0, sizeof(spi_instance_t) );

        /* Configure CoreSPI instance attributes */
        this_spi->base_addr = (addr_t)base_addr;

        /* Store FIFO depth or fall back to minimum if out of range */
        if( ( SPI_MAX_FIFO_DEPTH  >= fifo_depth ) && ( SPI_MIN_FIFO_DEPTH  <= fifo_depth ) )
        {
            this_spi->fifo_depth = fifo_depth;
        }
        else
        {
            this_spi->fifo_depth = SPI_MIN_FIFO_DEPTH;
        }
        /* Make sure the CoreSPI is disabled while we configure it */
        HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, DISABLE );

        /* Ensure all slaves are deselected */
        HAL_set_8bit_reg( this_spi->base_addr, SSEL, 0u );

        /* Flush the receive and transmit FIFOs*/
        HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK );

        /* Clear all interrupts */
        HAL_set_8bit_reg( this_spi->base_addr, INTCLR, SPI_ALL_INTS );

        /* Ensure RXAVAIL, TXRFM, SSEND and CMDINT are disabled */
        HAL_set_8bit_reg( this_spi->base_addr, CTRL2, 0u );
        /*
         * Enable the CoreSPI in the reset default of master mode
         * with TXUNDERRUN, RXOVFLOW and TXDONE interrupts disabled.
         * The driver does not currently use interrupts in master mode.
         */
        HAL_set_8bit_reg( this_spi->base_addr, CTRL1,  ENABLE | CTRL1_MASTER_MASK );
    }
}

/***************************************************************************//**
 * SPI_configure_slave_mode()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_configure_slave_mode
(
    spi_instance_t * this_spi
)
{
    HAL_ASSERT( NULL_INSTANCE != this_spi );

    if( NULL_INSTANCE != this_spi )
        {
        /* Don't yet know what slave transfer mode will be used */
        this_spi->slave_xfer_mode = SPI_SLAVE_XFER_NONE;

        /* Make sure the CoreSPI is disabled while we configure it */
        HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, DISABLE );

        /* Flush the receive and transmit FIFOs*/
        HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK );

        /* Clear all interrupts */
        HAL_set_8bit_reg( this_spi->base_addr, INTCLR, SPI_ALL_INTS );

        /* Ensure RXAVAIL, TXRFM, SSEND and CMDINT are disabled */
        HAL_set_8bit_reg( this_spi->base_addr, CTRL2, 0u );
        /*
         * Enable the CoreSPI in slave mode with TXUNDERRUN, RXOVFLOW and TXDONE
         * interrupts disabled. The appropriate interrupts will be enabled later
         * on when the transfer mode is configured.
         */
        HAL_set_8bit_reg( this_spi->base_addr, CTRL1, ENABLE );
    }
}

/***************************************************************************//**
 * SPI_configure_master_mode()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_configure_master_mode
(
    spi_instance_t * this_spi
)
{
    HAL_ASSERT( NULL_INSTANCE != this_spi );
    
    if( NULL_INSTANCE != this_spi )
    {
        /* Disable the CoreSPI for a little while, while we configure the CoreSPI */
        HAL_set_8bit_reg_field(this_spi->base_addr, CTRL1_ENABLE, DISABLE);

        /* Reset slave transfer mode to unknown in case it has been set previously */
        this_spi->slave_xfer_mode = SPI_SLAVE_XFER_NONE;

        /* Flush the receive and transmit FIFOs*/
        HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK );

        /* Clear all interrupts */
        HAL_set_8bit_reg( this_spi->base_addr, INTCLR, SPI_ALL_INTS );

        /* Ensure RXAVAIL, TXRFM, SSEND and CMDINT are disabled */
        HAL_set_8bit_reg( this_spi->base_addr, CTRL2, 0u );

        /* Enable the CoreSPI in master mode with TXUNDERRUN, RXOVFLOW and TXDONE interrupts disabled */
        HAL_set_8bit_reg( this_spi->base_addr, CTRL1, ENABLE | CTRL1_MASTER_MASK );
    }
}

/***************************************************************************//**
 * SPI_set_slave_select()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_set_slave_select
(
    spi_instance_t * this_spi,
    spi_slave_t slave
)
{
    spi_slave_t temp = (spi_slave_t)(0x00u) ;

    HAL_ASSERT( NULL_INSTANCE != this_spi );
    HAL_ASSERT( SPI_MAX_NB_OF_SLAVES > slave );
    
    if( ( NULL_INSTANCE != this_spi ) && ( SPI_MAX_NB_OF_SLAVES > slave ) )
    {
        /* This function is only intended to be used with an SPI master */
        if( DISABLE != HAL_get_8bit_reg_field(this_spi->base_addr, CTRL1_MASTER ) )
        {
            /* Recover from receiver overflow because of previous slave */
            if( ENABLE == HAL_get_8bit_reg_field(this_spi->base_addr, STATUS_RXOVFLOW ) )
            {
                 recover_from_rx_overflow( this_spi );
            }
            /* Set the correct slave select bit */
            temp = (spi_slave_t)( HAL_get_8bit_reg( this_spi->base_addr, SSEL ) | ((uint32_t)1u << (uint32_t)slave) );
            HAL_set_8bit_reg( this_spi->base_addr, SSEL, (uint_fast8_t)temp );
        }
    }
}

/***************************************************************************//**
 * SPI_clear_slave_select()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_clear_slave_select
(
    spi_instance_t * this_spi,
    spi_slave_t slave
)
{
    spi_slave_t temp = (spi_slave_t) (0x00u) ;

    HAL_ASSERT( NULL_INSTANCE != this_spi );
    HAL_ASSERT( SPI_MAX_NB_OF_SLAVES > slave );
    
    if( ( NULL_INSTANCE != this_spi ) && ( SPI_MAX_NB_OF_SLAVES > slave ) )
    {
        /* This function is only intended to be used with an SPI master. */
        if( DISABLE != HAL_get_8bit_reg_field(this_spi->base_addr, CTRL1_MASTER ) )
        {
            /* Recover from receiver overflow because of previous slave */
            if( ENABLE == HAL_get_8bit_reg_field(this_spi->base_addr, STATUS_RXOVFLOW) )
            {
                 recover_from_rx_overflow( this_spi );
            }
            /* Clear the correct slave select bit */
            temp = (spi_slave_t)( HAL_get_8bit_reg( this_spi->base_addr, SSEL ) & ~((uint32_t)1u << (uint32_t)slave) );
            HAL_set_8bit_reg( this_spi->base_addr, SSEL, (uint_fast8_t)temp ) ;
        }
    }
}

/***************************************************************************//**
 * SPI_transfer_frame()
 * See "core_spi.h" for details of how to use this function.
 */
uint32_t SPI_transfer_frame
(
    spi_instance_t * this_spi,
    uint32_t tx_bits
)
{
    volatile uint32_t rx_data = 0u; /* Ensure consistent return value if in slave mode */

    HAL_ASSERT( NULL_INSTANCE != this_spi );

    if( NULL_INSTANCE != this_spi )
    {
        /* This function is only intended to be used with an SPI master. */
        if( DISABLE != HAL_get_8bit_reg_field(this_spi->base_addr, CTRL1_MASTER ) )
        {
            /* Flush the receive and transmit FIFOs by resetting both */
            HAL_set_8bit_reg(this_spi->base_addr, CMD, CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK);

            /* Send frame. */
            HAL_set_32bit_reg( this_spi->base_addr, TXLAST, tx_bits );

            /* Wait for frame Tx to complete. */
            while ( ENABLE != HAL_get_8bit_reg_field(this_spi->base_addr, STATUS_DONE ) )
            {
                ;
            }

            /* Read received frame. */
            rx_data = HAL_get_32bit_reg( this_spi->base_addr, RXDATA );
        }
    }

    /* Finally, return the frame we received from the slave or 0 */
    return( rx_data );
}


/***************************************************************************//**
 * SPI_transfer_block()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_transfer_block
(
    spi_instance_t * this_spi,
    const uint8_t * cmd_buffer,
    uint16_t cmd_byte_size,
    uint8_t * rx_buffer,
    uint16_t rx_byte_size
)
{
    uint32_t transfer_size = 0U;   /* Total number of bytes to  transfer. */
    uint16_t transfer_idx = 0U;    /* Number of bytes transferred so far */
    uint16_t tx_idx = 0u;          /* Number of valid data bytes sent */
    uint16_t rx_idx = 0u;          /* Number of valid response bytes received */
    uint16_t transit = 0U;         /* Number of bytes "in flight" to avoid FIFO errors */

    HAL_ASSERT( NULL_INSTANCE != this_spi );

    if( NULL_INSTANCE != this_spi )
    {
        /* This function is only intended to be used with an SPI master. */
        if( ( DISABLE != HAL_get_8bit_reg_field(this_spi->base_addr, CTRL1_MASTER ) ) &&
            /* Check for empty transfer as well */
            ( 0u != ( (uint32_t)cmd_byte_size + (uint32_t)rx_byte_size ) ) )
        {
            /*
             * tansfer_size is one less than the real amount as we have to write
             * the last frame separately to trigger the slave deselect in case
             * the SPS option is in place.
             */
            transfer_size = ( (uint32_t)cmd_byte_size + (uint32_t)rx_byte_size ) - 1u;
            /* Flush the receive and transmit FIFOs */
            HAL_set_8bit_reg(this_spi->base_addr, CMD, (uint32_t)(CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK ));

            /* Recover from receiver overflow because of previous slave */
            if( ENABLE == HAL_get_8bit_reg_field(this_spi->base_addr, STATUS_RXOVFLOW) )
            {
                 recover_from_rx_overflow( this_spi );
            }

            /* Disable the Core SPI for a little bit, while we load the TX FIFO */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, DISABLE );

            while( ( tx_idx < transfer_size ) && ( tx_idx < this_spi->fifo_depth ) )
            {
                if( tx_idx < cmd_byte_size )
                {
                    /* Push out valid data */
                    HAL_set_32bit_reg( this_spi->base_addr, TXDATA, (uint32_t)cmd_buffer[tx_idx] );
                }
                else
                {
                    /* Push out 0s to get data back from slave */
                    HAL_set_32bit_reg( this_spi->base_addr, TXDATA, 0U );
                }
                ++transit;
                ++tx_idx;
            }

            /* If room left to put last frame in before the off, then do it */
            if( ( tx_idx == transfer_size ) && ( tx_idx < this_spi->fifo_depth ) )
            {
                if( tx_idx < cmd_byte_size )
                {
                    /* Push out valid data, not expecting any reply this time */
                    HAL_set_32bit_reg( this_spi->base_addr, TXLAST, (uint32_t)cmd_buffer[tx_idx] );
                }
                else
                {
                    /* Push out last 0 to get data back from slave */
                    HAL_set_32bit_reg( this_spi->base_addr, TXLAST, 0U );
                }

                ++transit;
                ++tx_idx;
            }

            /* FIFO is all loaded up so enable Core SPI to start transfer */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, ENABLE );

            /* Perform the remainder of the transfer by sending a byte every time a byte
             * has been received. This should ensure that no Rx overflow can happen in
             * case of an interrupt occurring during this function.
             *
             * We break the transfer down into stages to minimise the processing in
             * each loop as the SPI interface is very demanding at higher clock rates.
             * This works well with FIFOs but might be less efficient if there is only
             * a single frame buffer.
             *
             * First stage transfers remaining command bytes (if any).
             * At this stage anything in the RX FIFO can be discarded as it is
             * not part of a valid response.
             */
            while( tx_idx < cmd_byte_size )
            {
                if( transit < this_spi->fifo_depth )
                {
                    /* Send another byte. */
                    if( tx_idx == transfer_size ) /* Last frame is special... */
                    {
                        HAL_set_32bit_reg( this_spi->base_addr, TXLAST, (uint32_t)cmd_buffer[tx_idx] );
                    }
                    else
                    {
                        HAL_set_32bit_reg( this_spi->base_addr, TXDATA, (uint32_t)cmd_buffer[tx_idx] );
                    }
                    ++tx_idx;
                    ++transit;
                }
                if( !HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_RXEMPTY ) )
                {
                    /* Read and discard. */
                    HAL_get_32bit_reg( this_spi->base_addr, RXDATA );
                    ++transfer_idx;
                    --transit;
                }
            }
            /*
             * Now, we are writing dummy bytes to push through the response from
             * the slave but we still have to keep discarding any read data that
             * corresponds with one of our command bytes.
             */
            while( transfer_idx < cmd_byte_size )
            {
                if( transit < this_spi->fifo_depth )
                {
                    if( tx_idx < transfer_size )
                    {
                        HAL_set_32bit_reg( this_spi->base_addr, TXDATA, 0U );
                        ++tx_idx;
                        ++transit;
                    }
                }
                if( !HAL_get_8bit_reg_field(this_spi->base_addr, STATUS_RXEMPTY ) )
                {
                    /* Read and discard. */
                    HAL_get_32bit_reg( this_spi->base_addr, RXDATA );
                    ++transfer_idx;
                    --transit;
                }
            }
            /*
             * Now we are now only sending dummy data to push through the
             * valid response data which we store in the response buffer.
             */
            while( tx_idx < transfer_size )
            {
                if( transit < this_spi->fifo_depth )
                {
                    HAL_set_32bit_reg( this_spi->base_addr, TXDATA, 0U );
                    ++tx_idx;
                    ++transit;
                }
                if( !HAL_get_8bit_reg_field(this_spi->base_addr, STATUS_RXEMPTY ) )
                {
                    /* Process received byte. */
                    rx_buffer[rx_idx] = (uint8_t)HAL_get_32bit_reg( this_spi->base_addr, RXDATA );
                    ++rx_idx;
                    ++transfer_idx;
                    --transit;
                }
            }
            /* If we still need to send the last frame */
            while( tx_idx == transfer_size )
            {
                if( transit < this_spi->fifo_depth )
                {
                    HAL_set_32bit_reg( this_spi->base_addr, TXLAST, 0U );
                    ++tx_idx;
                    ++transit;
                }
                if( !HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_RXEMPTY ) )
                {
                    /* Process received byte. */
                    rx_buffer[rx_idx] = (uint8_t)HAL_get_32bit_reg( this_spi->base_addr, RXDATA );
                    ++rx_idx;
                    ++transfer_idx;
                    --transit;
                }
            }
            /*
             * Finally, we are now finished sending data and are only reading
             * valid response data which we store in the response buffer.
             */
            while( transfer_idx <= transfer_size )
            {
                if( !HAL_get_8bit_reg_field(this_spi->base_addr, STATUS_RXEMPTY ) )
                {
                    /* Process received byte. */
                    rx_buffer[rx_idx] = (uint8_t)HAL_get_32bit_reg( this_spi->base_addr, RXDATA );
                    ++rx_idx;
                    ++transfer_idx;
                }
            }
        }
    }
}

/***************************************************************************//**
 * SPI_set_frame_rx_handler()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_set_frame_rx_handler
(
    spi_instance_t * this_spi,
    spi_frame_rx_handler_t rx_handler
)
{
    HAL_ASSERT( NULL_INSTANCE != this_spi );

    if(NULL_INSTANCE != this_spi)
    {
        /* This function is only intended to be used with an SPI slave. */
        if(DISABLE == HAL_get_8bit_reg_field(this_spi->base_addr, CTRL1_MASTER))
        {
            /* Disable the Core SPI while we configure */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, DISABLE );

            /* Clear all interrupts */
            HAL_set_8bit_reg( this_spi->base_addr, INTCLR, SPI_ALL_INTS );

            /* Disable SSEND and CMD interrupts as we are not doing block transfers */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTSSEND, DISABLE );
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTCMD,   DISABLE );

            /* Disable block Rx handler as they are mutually exclusive. */
            this_spi->block_rx_handler = 0U;

            /* Keep a copy of the pointer to the Rx handler function. */
            this_spi->frame_rx_handler = rx_handler;

            if( SPI_SLAVE_XFER_FRAME != this_spi->slave_xfer_mode )
            {
                /*
                 * Either just coming from init or were previously in block mode
                 * so no tx frame handler is set at this point in time...
                 *
                 * Don't allow TXDONE interrupts.
                 */
                HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_INTTXDONE, DISABLE );
            }

            /* Flush the receive and transmit FIFOs*/
            HAL_set_8bit_reg(this_spi->base_addr, CMD, CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK);

            /* Enable Rx and FIFO error interrupts */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_INTRXOVFLOW, ENABLE );
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_INTTXURUN,   ENABLE );
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTRXDATA,   ENABLE );

            /* Make sure correct mode is selected */
            this_spi->slave_xfer_mode = SPI_SLAVE_XFER_FRAME;

            /* Finally re-enable the CoreSPI */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, ENABLE );
        }
    }
}

/***************************************************************************//**
 * SPI_set_slave_tx_frame()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_set_slave_tx_frame
(
    spi_instance_t * this_spi,
    uint32_t frame_value,
    spi_slave_frame_tx_handler_t slave_tx_frame_handler
)
{
    HAL_ASSERT( NULL_INSTANCE != this_spi );

    if( NULL_INSTANCE != this_spi )
    {
        /* This function is only intended to be used with an SPI slave. */
        if( DISABLE == HAL_get_8bit_reg_field(this_spi->base_addr, CTRL1_MASTER ) )
        {
            /* Disable the Core SPI while we configure */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, DISABLE );

            /* Clear all interrupts */
            HAL_set_8bit_reg( this_spi->base_addr, INTCLR, SPI_ALL_INTS );

            /* Disable SSEND and CMD interrupts as we are not doing block transfers */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTSSEND, DISABLE );
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTCMD,   DISABLE );

            if( SPI_SLAVE_XFER_FRAME != this_spi->slave_xfer_mode )
            {
                /*
                 * Either just coming from init or were previously in block mode
                 * so no rx frame handler is set at this point in time...
                 *
                 * Don't allow RXDATA interrupts.
                 */
                HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTRXDATA, DISABLE );
            }

            /* Disable slave block tx buffer as it is mutually exclusive with frame
             * level handling. */
            this_spi->slave_tx_buffer = NULL_BUFF;
            this_spi->slave_tx_size = 0U;
            this_spi->slave_tx_idx = 0U;

            /* Flush the receive and transmit FIFOs*/
            HAL_set_8bit_reg(this_spi->base_addr, CMD, CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK);

            /* Assign the slave frame update handler - NULL_SLAVE_TX_UPDATE_HANDLER for none */
            this_spi->slave_tx_frame_handler = slave_tx_frame_handler;

            /* Keep a copy of the slave Tx frame value. */
            this_spi->slave_tx_frame = frame_value;

            /* Load one frame into Tx data register. */
            HAL_set_32bit_reg( this_spi->base_addr, TXLAST, this_spi->slave_tx_frame );

            /* Enable Tx Done interrupt in order to reload the slave Tx frame after each
             * time it has been sent. */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_INTTXDONE, ENABLE );

            /* Make sure correct mode is selected */
            this_spi->slave_xfer_mode = SPI_SLAVE_XFER_FRAME;

            /* Ready to go so enable CoreSPI */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, ENABLE );
        }
    }
}

/***************************************************************************//**
 * SPI_set_slave_block_buffers()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_set_slave_block_buffers
(
    spi_instance_t * this_spi,
    const uint8_t * tx_buffer,
    uint32_t tx_buff_size,
    uint8_t * rx_buffer,
    uint32_t rx_buff_size,
    spi_block_rx_handler_t block_rx_handler
)
{
    HAL_ASSERT( NULL_INSTANCE != this_spi );

    if( NULL_INSTANCE != this_spi )
    {
        /* This function is only intended to be used with an SPI slave. */
        if( DISABLE == HAL_get_8bit_reg_field(this_spi->base_addr, CTRL1_MASTER ) )
        {
            /* Disable the Core SPI while we configure */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, DISABLE );

            /* Make sure correct mode is selected */
            this_spi->slave_xfer_mode = SPI_SLAVE_XFER_BLOCK;
            /*
             * No command handler should be setup at this stage so fake this
             * to ensure 0 padding works.
             */
            this_spi->cmd_done = 1u;

            /* Disable frame handlers as they are mutually exclusive with block Rx handler. */
            this_spi->frame_rx_handler = NULL_FRAME_HANDLER;
            this_spi->slave_tx_frame_handler = NULL_SLAVE_TX_UPDATE_HANDLER;

            /* Keep a copy of the pointer to the block Rx handler function. */
            this_spi->block_rx_handler = block_rx_handler;

            /* Assign slave receive buffer */
            this_spi->slave_rx_buffer = rx_buffer;
            this_spi->slave_rx_size = rx_buff_size;
            this_spi->slave_rx_idx = 0U;

            /* Assign slave transmit buffer*/
            this_spi->slave_tx_buffer = tx_buffer;
            this_spi->slave_tx_size = tx_buff_size;
            this_spi->slave_tx_idx = 0U;

            /* Flush the receive and transmit FIFOs */
            HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK );

            /* Clear all interrupts */
            HAL_set_8bit_reg( this_spi->base_addr, INTCLR, SPI_ALL_INTS );

            /* Preload the transmit FIFO. */
            while( !(HAL_get_8bit_reg_field(this_spi->base_addr, STATUS_TXFULL)) &&
                     ( this_spi->slave_tx_idx < this_spi->slave_tx_size ) )
            {
                HAL_set_32bit_reg( this_spi->base_addr, TXDATA, (uint32_t)this_spi->slave_tx_buffer[this_spi->slave_tx_idx] );
                ++this_spi->slave_tx_idx;
            }
            /*
             * Disable TXDATA interrupt as we will look after transmission in rx handling
             * because we know that once we have read a frame it is safe to send another one.
             */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTTXDATA,  DISABLE );

            /* Enable Rx, FIFO error  and SSEND interrupts */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_INTRXOVFLOW, ENABLE );
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_INTTXURUN,   ENABLE );
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTRXDATA,   ENABLE );
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTSSEND,    ENABLE );

            /* Disable command handler until it is set explicitly */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTCMD,      DISABLE );

            /* Now enable the CoreSPI */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, ENABLE );
        }
    }
}

/***************************************************************************//**
 * SPI_set_cmd_handler()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_set_cmd_handler
(
    spi_instance_t * this_spi,
    spi_block_rx_handler_t cmd_handler,
    uint32_t cmd_size
)
{
    uint32_t ctrl2 = 0u;

    HAL_ASSERT( NULL_INSTANCE != this_spi );
    HAL_ASSERT( NULL_SLAVE_CMD_HANDLER != cmd_handler );
    HAL_ASSERT( 0u < cmd_size );

    if( ( NULL_INSTANCE != this_spi ) && ( 0u < cmd_size ) &&
        ( NULL_SLAVE_CMD_HANDLER != cmd_handler ) )
    {
        /* Disable the Core SPI while we configure */
        HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, DISABLE );
        /*
         * Note we don't flush the FIFOs as this has been done already when
         * block mode was configured.
         *
         * Clear this flag so zero padding is disabled until command response
         * has been taken care of.
         */
        this_spi->cmd_done = 0u;

        /* Assign user handler for Command received interrupt */
        this_spi->cmd_handler = cmd_handler;

        /* Configure the command size and Enable Command received interrupt */
        ctrl2  = HAL_get_8bit_reg( this_spi->base_addr, CTRL2 );

        /* First clear the count field then insert count and int enables */
        ctrl2 &= ~(uint32_t)CTRL2_CMDSIZE_MASK;
        ctrl2 |= (uint32_t)((cmd_size & CTRL2_CMDSIZE_MASK) | CTRL2_INTCMD_MASK | CTRL2_INTRXDATA_MASK);
        HAL_set_8bit_reg( this_spi->base_addr, CTRL2, ctrl2 );

        /* Now enable the CoreSPI */
        HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, ENABLE );
    }
}

/***************************************************************************//**
 * SPI_set_cmd_response()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_set_cmd_response
(
    spi_instance_t * this_spi,
    const uint8_t * resp_tx_buffer,
    uint32_t resp_buff_size
)
{
    HAL_ASSERT( NULL_INSTANCE != this_spi );
    HAL_ASSERT( NULL_BUFF != resp_tx_buffer );
    HAL_ASSERT( 0u < resp_buff_size );

    if( ( NULL_INSTANCE != this_spi ) && ( 0u < resp_buff_size ) &&
        ( NULL_BUFF != resp_tx_buffer ) )
    {
        this_spi->resp_tx_buffer = resp_tx_buffer;
        this_spi->resp_buff_size = resp_buff_size;
        this_spi->resp_buff_tx_idx = 0u;

        fill_slave_tx_fifo(this_spi);
    }
}


/***************************************************************************//**
 * SPI_enable()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_enable
(
    spi_instance_t * this_spi
)
{
    HAL_ASSERT( NULL_INSTANCE != this_spi );

    if( NULL_INSTANCE != this_spi )
    {
        /* Disable the Core SPI while we configure */
        HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, ENABLE );
    }
}


/***************************************************************************//**
 * SPI_disable()
 * See "core_spi.h" for details of how to use this function.
 */
void SPI_disable
(
    spi_instance_t * this_spi
)
{
    HAL_ASSERT( NULL_INSTANCE != this_spi );

    if( NULL_INSTANCE != this_spi )
    {
        /* Disable the Core SPI while we configure */
        HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, DISABLE );
    }
}


/***************************************************************************//**
 * SPI interrupt service routine.
 */
void SPI_isr
(
    spi_instance_t * this_spi
)
{
    uint32_t rx_frame;
    int32_t  guard;

/*
 * The assert and the NULL check here can be commented out to reduce the interrupt
 * latency once you are sure the interrupt vector code is correct.
 */
    HAL_ASSERT( NULL_INSTANCE != this_spi );
    if( NULL_INSTANCE != this_spi )
    {
        /* Handle receive. */
        if( ENABLE == HAL_get_8bit_reg_field( this_spi->base_addr, INTMASK_RXDATA ) )
        {
            /*
             * Service receive data according to transfer mode in operation.
             *
             * We check block mode first as this is most likely to have back to back
             * transfers with multiple bytes.
             *
             * Note the order of the checks here will effect interrupt latency and
             * for critical timing the mode you are using most often should probably be
             * be the first checked.
             */
            if( SPI_SLAVE_XFER_BLOCK == this_spi->slave_xfer_mode ) /* Block handling mode. */
            {
                while( 0u == HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_RXEMPTY ) )
                {
                    /* Read irrespective to clear the RX IRQ */
                    rx_frame = HAL_get_32bit_reg( this_spi->base_addr, RXDATA );
                    if( this_spi->slave_rx_idx < this_spi->slave_rx_size )
                    {
                        this_spi->slave_rx_buffer[this_spi->slave_rx_idx] = (uint8_t)rx_frame;
                    }
                    ++this_spi->slave_rx_idx;
                }
                /*
                 * Now handle updating of tx FIFO to keep the data flowing.
                 * First see if there is anything in slave_tx_buffer to send.
                 */
                while( ( this_spi->slave_tx_idx < this_spi->slave_tx_size )
                    && ( 0u == HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_TXFULL ) ) )
                {
                       HAL_set_32bit_reg( this_spi->base_addr, TXDATA, (uint32_t)this_spi->slave_tx_buffer[this_spi->slave_tx_idx] );
                       ++this_spi->slave_tx_idx;
                   }
                /*
                 * Next see if there is anything in resp_tx_buffer to send.
                 */
                if( this_spi->slave_tx_idx >= this_spi->slave_tx_size )
                {
                    while( ( this_spi->resp_buff_tx_idx < this_spi->resp_buff_size )
                        && ( 0u == HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_TXFULL ) ) )
                    {
                           HAL_set_32bit_reg( this_spi->base_addr, TXDATA, (uint32_t)this_spi->resp_tx_buffer[this_spi->resp_buff_tx_idx] );
                           ++this_spi->resp_buff_tx_idx;
                    }
                }
                /*
                 * Lastly, see if we are ready to pad with 0s .
                 */
                if( this_spi->cmd_done && ( this_spi->slave_tx_idx >= this_spi->slave_tx_size ) &&
                  ( this_spi->resp_buff_tx_idx >= this_spi->resp_buff_size ) )
                {
                    guard = 1 + ((int32_t)this_spi->fifo_depth / 4);
                    while( ( 0u == HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_TXFULL ) )
                        && ( 0 != guard ) )
                    {
                        /*
                         * Pad TX FIFO with 0s for consistent behaviour if the master
                         * tries to transfer more than we expected.
                         */
                        HAL_set_32bit_reg(this_spi->base_addr, TXDATA, 0x00u);
                        /*
                         * We use the guard count to cover the event that we are never
                         * seeing the TX FIFO full because the data is being pulled
                         * out as fast as we can stuff it in. In this case we never spend
                         * more than our allocated time spinning here.
                         */
                        guard--;
                    }
                }
            }
            else if( SPI_SLAVE_XFER_FRAME == this_spi->slave_xfer_mode ) /* Single frame handling mode. */
            {
                while( 0u == HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_RXEMPTY ) )
                {
                    rx_frame = HAL_get_32bit_reg( this_spi->base_addr, RXDATA );
                    if( NULL_FRAME_HANDLER != this_spi->frame_rx_handler )
                    {
                        this_spi->frame_rx_handler( rx_frame );
                    }
                }
            }
            else /* Slave transfer mode not set up so discard anything in RX FIFO */
            {
                HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_RXFIFORST_MASK );
            }

            HAL_set_8bit_reg_field( this_spi->base_addr, INTCLR_RXDATA, ENABLE );
        }

        /* Handle transmit. */
        if( ENABLE == HAL_get_8bit_reg_field( this_spi->base_addr, INTMASK_TXDONE ) )
        {
            /*
             * Note, the driver only currently uses the txdone interrupt when
             * in frame transmit mode. In block mode all TX handling is done by the
             * receive interrupt handling code as we know that for every frame received
             * a frame must be placed in the TX FIFO.
             */
            if( SPI_SLAVE_XFER_FRAME == this_spi->slave_xfer_mode )
            {
                /* Execute the user callback to update the slave_tx_frame */
                if( NULL_SLAVE_TX_UPDATE_HANDLER != this_spi->slave_tx_frame_handler )
                {
                    this_spi->slave_tx_frame_handler ( this_spi );
                }

                /* Reload slave tx frame into Tx data register. */
                HAL_set_32bit_reg( this_spi->base_addr, TXLAST, this_spi->slave_tx_frame );
            }
            else if( SPI_SLAVE_XFER_BLOCK != this_spi->slave_xfer_mode )
            {
                /* Slave transfer mode not set up so discard anything in TX FIFO */
                HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_TXFIFORST_MASK );
            }
            else
            {
                /* Nothing to do, no slave mode configured */
            }

            HAL_set_8bit_reg_field( this_spi->base_addr, INTCLR_TXDONE, ENABLE );
        }


        /* Handle receive overflow. */
        if( ENABLE == HAL_get_8bit_reg_field(this_spi->base_addr, INTMASK_RXOVERFLOW))
        {
            HAL_set_8bit_reg(this_spi->base_addr, CMD, CMD_RXFIFORST_MASK);
            HAL_set_8bit_reg_field(this_spi->base_addr, INTCLR_RXOVERFLOW, ENABLE);
        }

        /* Handle transmit under run. */
        if( ENABLE == HAL_get_8bit_reg_field( this_spi->base_addr, INTMASK_TXUNDERRUN ) )
        {
            HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_TXFIFORST_MASK );
            HAL_set_8bit_reg_field( this_spi->base_addr, INTCLR_TXUNDERRUN, ENABLE );
        }

        /* Handle command interrupt. */
        if( ENABLE == HAL_get_8bit_reg_field( this_spi->base_addr, INTMASK_CMDINT ) )
        {
            read_slave_rx_fifo( this_spi );

            /*
             * Call the command handler if one exists.
             */
            if( NULL_SLAVE_CMD_HANDLER != this_spi->cmd_handler )
            {
                this_spi->cmd_handler( this_spi->slave_rx_buffer, this_spi->slave_rx_idx );
            }
            this_spi->cmd_done = 1u;
            /* Disable command interrupt until slave select becomes de-asserted to avoid retriggering. */
            HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTCMD, DISABLE );
            HAL_set_8bit_reg_field( this_spi->base_addr, INTCLR_CMDINT, ENABLE );
        }

        /* Handle slave select becoming de-asserted. */
        if( ENABLE == HAL_get_8bit_reg_field( this_spi->base_addr, INTMASK_SSEND) )
        {
            /* Only supposed to do all this if transferring blocks... */
            if(SPI_SLAVE_XFER_BLOCK == this_spi->slave_xfer_mode)
            {
                uint32_t rx_size;

                /* Empty any remaining bytes in RX FIFO */
                read_slave_rx_fifo( this_spi );
                rx_size = this_spi->slave_rx_idx;
                /*
                 * Re-enable command interrupt if required. 
                 * Must be done before re loading FIFO to ensure stale response
                 * data is not pushed into the FIFO.
                 */
                if(NULL_SLAVE_CMD_HANDLER != this_spi->cmd_handler)
                {
                    this_spi->cmd_done = 0u;
                    this_spi->resp_tx_buffer = 0u;
                    this_spi->resp_buff_size = 0u;
                    this_spi->resp_buff_tx_idx = 0u;
                    HAL_set_8bit_reg_field( this_spi->base_addr, INTCLR_CMDINT, ENABLE );
                    HAL_set_8bit_reg_field( this_spi->base_addr, CTRL2_INTCMD, ENABLE );
                }
                /*
                 * Reset the transmit index to 0 to restart transmit at the start of the
                 * transmit buffer in the next transaction. This also requires flushing
                 * the Tx FIFO and refilling it with the start of Tx data buffer.
                 */
                this_spi->slave_tx_idx = 0u;
                HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK );
                fill_slave_tx_fifo( this_spi );

                /* Prepare to receive next packet. */
                this_spi->slave_rx_idx = 0u;
                /*
                 * Call the receive handler if one exists.
                 */
                if( NULL_BLOCK_HANDLER != this_spi->block_rx_handler )
                {
                    this_spi->block_rx_handler( this_spi->slave_rx_buffer, rx_size );
                }

                HAL_set_8bit_reg_field( this_spi->base_addr, INTCLR_RXDATA, ENABLE );
            }

            HAL_set_8bit_reg_field( this_spi->base_addr, INTCLR_SSEND, ENABLE );
        }
    }
}

/*******************************************************************************
 * Local function definitions
 */

/***************************************************************************//**
 * Fill the transmit FIFO (used for slave block transfers).
 */
static void fill_slave_tx_fifo
(
    spi_instance_t * this_spi
)
{
    /* First see if slave_tx_buffer needs transmitting */
    while( ( this_spi->slave_tx_idx < this_spi->slave_tx_size ) &&
            !HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_TXFULL ) )
    {
        HAL_set_32bit_reg( this_spi->base_addr, TXDATA, (uint32_t)this_spi->slave_tx_buffer[this_spi->slave_tx_idx] );
        ++this_spi->slave_tx_idx;
    }

    /* Then see if it is safe to look at putting resp_tx_buffer in FIFO? */
    if( this_spi->slave_tx_idx >= this_spi->slave_tx_size )
    {
        while( ( this_spi->resp_buff_tx_idx < this_spi->resp_buff_size ) &&
                !HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_TXFULL ) )
        {
            HAL_set_32bit_reg( this_spi->base_addr, TXDATA, (uint32_t)this_spi->resp_tx_buffer[this_spi->resp_buff_tx_idx] );
            ++this_spi->resp_buff_tx_idx;
        }
    }
}

/***************************************************************************//**
 * 
 */
static void read_slave_rx_fifo
(
    spi_instance_t * this_spi
)
{
    uint32_t rx_frame;
    
    if( SPI_SLAVE_XFER_BLOCK == this_spi->slave_xfer_mode ) /* Block handling mode. */
    {
        while( !HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_RXEMPTY ) )
        {
            rx_frame = HAL_get_32bit_reg( this_spi->base_addr, RXDATA ); /* Read irresepective to clear the RX IRQ */
            if( this_spi->slave_rx_idx < this_spi->slave_rx_size )
            {
                this_spi->slave_rx_buffer[this_spi->slave_rx_idx] = (uint8_t)rx_frame;
            }
            ++this_spi->slave_rx_idx;
        }
    }
    else if( SPI_SLAVE_XFER_FRAME == this_spi->slave_xfer_mode ) /* Frame handling mode */
    {
        while( !HAL_get_8bit_reg_field( this_spi->base_addr, STATUS_RXEMPTY ) )
        {
            /* Single frame handling mode. */
            rx_frame = HAL_get_32bit_reg( this_spi->base_addr, RXDATA );
            if( NULL_FRAME_HANDLER != this_spi->frame_rx_handler )
            {
                this_spi->frame_rx_handler( rx_frame );
            }
        }
    }
    else /* Slave transfer mode not set up so discard anything in RX FIFO */
    {
        HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_RXFIFORST_MASK );
    }
}

/***************************************************************************//**
 * This function is to recover the CoreSPI from receiver overflow.
 * It temporarily disables the CoreSPI from interacting with external world, flushes
 * the transmit and receiver FIFOs, clears all interrupts and then re-enables
 * the CoreSPI instance referred by this_spi parameter.
 */
static void recover_from_rx_overflow
(
    const spi_instance_t * this_spi
)
{
    /* Disable CoreSPI */
    HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, DISABLE );

    /* Reset TX and RX FIFOs */
    HAL_set_8bit_reg( this_spi->base_addr, CMD, CMD_TXFIFORST_MASK | CMD_RXFIFORST_MASK );

    /* Clear all interrupts */
    HAL_set_8bit_reg( this_spi->base_addr, INTCLR, SPI_ALL_INTS );

    /* Enable CoreSPI */
    HAL_set_8bit_reg_field( this_spi->base_addr, CTRL1_ENABLE, ENABLE );
}


