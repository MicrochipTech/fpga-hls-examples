/***************************************************************************//**
 * (c) Copyright 2009 Actel Corporation.  All rights reserved.
 * 
 *  MICRON_1G_SPI_FLASH_ SPI flash driver API.
 *
 * SVN $Revision:$
 * SVN $Date:$
 */

#include "micron1gflash.h"
#include "../CoreSPI/core_spi.h"
#include "../../hw_platform.h"
//#include "../mss_pdma/mss_pdma.h"

#define READ_ARRAY_OPCODE   0x03
#define DEVICE_ID_READ      0x9F


#define WRITE_ENABLE_CMD    0x06
#define WRITE_DISABLE_CMD   0x04
#define PROGRAM_PAGE_CMD    0x02
#define WRITE_STATUS1_OPCODE    0x01
#define DIE_256MB_ERASE_OPCODE   0xC4
#define ERASE_4K_BLOCK_OPCODE   0x20
#define ERASE_64K_BLOCK_OPCODE  0xD8
#define READ_STATUS         0x05
#define ADDRESS_MODE_4BYTE    0xB7
#define READ_FLAG_STATUS_REGISTER 0x70
#define ERASE_4K_BLOCK  0
#define ERASE_64K_BLOCK  1
#define READY_BIT_MASK      0x01

#define UNPROTECT_SECTOR_OPCODE     0x39

#define DONT_CARE       0x00u

#define NB_BYTES_PER_PAGE   256
spi_instance_t g_flash_core_spi;
#define SPI_INSTANCE            &g_flash_core_spi
#define SPI_SLAVE               0
/*******************************************************************************
 * Local functions
 */
//static void wait_ready( void );
static void wait_program_or_erase_controller_ready(void  );
static void write_enable();
static void enter_4byte_address_mode();
static void write_cmd_data
(
		 spi_instance_t * this_spi,
    const uint8_t * cmd_buffer,
    uint16_t cmd_byte_size,
    uint8_t * data_buffer,
    uint16_t data_byte_size
);
/*******************************************************************************
 *
 */
void FLASH_init( void )
{
    /*--------------------------------------------------------------------------
     * Configure SPI.
     */
	 SPI_init( SPI_INSTANCE, CORESPI_BASE_ADDR, 32 );
	 SPI_configure_master_mode( SPI_INSTANCE );

    /*--------------------------------------------------------------------------
     * Configure DMA channel used as part of this SPI Flash driver.
     */
/*
    PDMA_init();
    PDMA_configure
        (
            PDMA_CHANNEL_0,
            PDMA_TO_SPI_1,
            PDMA_LOW_PRIORITY | PDMA_BYTE_TRANSFER | PDMA_INC_SRC_ONE_BYTE,
            PDMA_DEFAULT_WRITE_ADJ
        );
*/
}

/*******************************************************************************
 *
 */
void FLASH_read_device_id
(
    uint8_t * manufacturer_id,
    uint8_t * device_id
)
{
	uint8_t read_device_id_cmd = DEVICE_ID_READ;
	    uint8_t read_buffer[3];

	    SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);
	    SPI_transfer_block(SPI_INSTANCE, &read_device_id_cmd, 1, read_buffer, sizeof(read_buffer));
	    SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);

	    *manufacturer_id = read_buffer[0];
	    *device_id = read_buffer[1];
}

/*******************************************************************************
 *
 */
void FLASH_read
(
    uint32_t address,
    uint8_t * rx_buffer,
    size_t size_in_bytes
)
{
    uint8_t cmd_buffer[5];

    write_enable();
    enter_4byte_address_mode();

    cmd_buffer[0] = READ_ARRAY_OPCODE;
    cmd_buffer[1] = (uint8_t)((address >> 24) & 0xFF);
    cmd_buffer[2] = (uint8_t)((address >> 16) & 0xFF);
    cmd_buffer[3] = (uint8_t)((address >> 8) & 0xFF);
    cmd_buffer[4] = (uint8_t)(address & 0xFF);
    SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);
    //wait_ready();
    SPI_transfer_block(SPI_INSTANCE, cmd_buffer, 5, rx_buffer, size_in_bytes);
    //MSS_SPI_transfer_block( &g_mss_spi0, cmd_buffer, 5, rx_buffer, size_in_bytes );
    //wait_ready();
    SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);


}

/*******************************************************************************
 *
 */
void FLASH_global_unprotect( void )
{
    uint8_t cmd_buffer[2];
    write_enable();
    cmd_buffer[0] = WRITE_STATUS1_OPCODE;
    cmd_buffer[1] = 0;
    SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);
       SPI_transfer_block(SPI_INSTANCE, cmd_buffer, 2, 0, 0);
       wait_program_or_erase_controller_ready();
       SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);

}

/*******************************************************************************
 *
 */

/*******************************************************************************
 *
 *address : starting address to erase the flash
 *xk_block : 0 to erase 4K block, 1 to erase 64K block
 */
void FLASH_erase_64k_block
(
    uint32_t address
)
{

	 uint8_t cmd_buffer[5];
	    /* Send Write Enable command */

	   write_enable();
	   enter_4byte_address_mode();
	   write_enable();


	   SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);
	    /* Send Chip Erase command */

	    	cmd_buffer[0] = ERASE_64K_BLOCK_OPCODE;

	    cmd_buffer[1] = (uint8_t)((address >> 24) & 0xFF);
		cmd_buffer[2] = (uint8_t)((address >> 16) & 0xFF);
		cmd_buffer[3] = (uint8_t)((address >> 8) & 0xFF);
		cmd_buffer[4] = (uint8_t)(address & 0xFF);
	    //wait_ready();
		 SPI_transfer_block(SPI_INSTANCE, cmd_buffer,5, 0, 0 );
	    //wait_ready();
	    wait_program_or_erase_controller_ready();
	    SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);



}


/*******************************************************************************
 *
 */
static void write_cmd_data
(
		 spi_instance_t * this_spi,
    const uint8_t * cmd_buffer,
    uint16_t cmd_byte_size,
    uint8_t * data_buffer,
    uint16_t data_byte_size
)
{
#if 0
    uint32_t transfer_size;
    
    transfer_size = cmd_byte_size + data_byte_size;
    
    MSS_SPI_disable( this_spi );
    MSS_SPI_set_transfer_byte_count( this_spi, transfer_size );

    PDMA_start
        (
            PDMA_CHANNEL_0,         /* channel_id */
            (uint32_t)cmd_buffer,   /* src_addr */
            PDMA_SPI0_TX_REGISTER,  /* dest_addr */
            cmd_byte_size           /* transfer_count */
        );
    
    PDMA_load_next_buffer
        (
            PDMA_CHANNEL_0,         /* channel_id */
            (uint32_t)data_buffer,  /* src_addr */
            PDMA_SPI0_TX_REGISTER,  /* dest_addr */
            data_byte_size          /* transfer_count */
        );

    MSS_SPI_enable( this_spi );
#else

    uint8_t tx_buffer[520];
    uint16_t transfer_size;
    uint16_t idx = 0;
    
    transfer_size = cmd_byte_size + data_byte_size;
    
    for(idx = 0; idx < cmd_byte_size; ++idx)
    {
        tx_buffer[idx] = cmd_buffer[idx];
    }

    for(idx = 0; idx < data_byte_size; ++idx)
    {
        tx_buffer[cmd_byte_size + idx] = data_buffer[idx];
    }
    
    SPI_transfer_block(SPI_INSTANCE, tx_buffer, transfer_size, 0, 0);
    
#endif    

}
static void write_enable()
{
	uint8_t cmd_buffer;
	SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);
   /* Send Write Enable command */
   cmd_buffer = WRITE_ENABLE_CMD;
   //wait_ready();
   SPI_transfer_block(SPI_INSTANCE, &cmd_buffer, 1, 0, 0 );
  // wait_ready();
   SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);
}
static void enter_4byte_address_mode()
{
	uint8_t cmd_buffer;
	SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);
   cmd_buffer = ADDRESS_MODE_4BYTE;
   //wait_ready();
   SPI_transfer_block(SPI_INSTANCE, &cmd_buffer, 1, 0, 0 );
   //wait_ready();
   SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);
}
/*******************************************************************************
 *
 */
void FLASH_program
(
    uint32_t address,
    uint8_t * write_buffer,
    size_t size_in_bytes
)
{
    uint8_t cmd_buffer[5];
    
    uint32_t in_buffer_idx;
    uint32_t nb_bytes_to_write;
    uint32_t target_addr;


    write_enable();
    enter_4byte_address_mode();
    
    in_buffer_idx = 0;
    nb_bytes_to_write = size_in_bytes;
    target_addr = address;
    
    while ( in_buffer_idx < size_in_bytes )
    {
        uint32_t size_left;
        nb_bytes_to_write = 0x100 - (target_addr & 0xFF);   /* adjust max possible size to page boundary. */
        size_left = size_in_bytes - in_buffer_idx;
        if ( size_left < nb_bytes_to_write )
        {
            nb_bytes_to_write = size_left;
        }
        
        write_enable();
		enter_4byte_address_mode();
        write_enable();
        /* Program page */


        cmd_buffer[0] = PROGRAM_PAGE_CMD;
        cmd_buffer[1] = (uint8_t)((target_addr >> 24) & 0xFF);
		cmd_buffer[2] = (uint8_t)((target_addr >> 16) & 0xFF);
		cmd_buffer[3] = (uint8_t)((target_addr >> 8) & 0xFF);
		cmd_buffer[4] = (uint8_t)(target_addr & 0xFF);
		SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);
        //wait_ready();
        write_cmd_data
          (
        	SPI_INSTANCE,
            cmd_buffer,
            sizeof(cmd_buffer),
            &write_buffer[in_buffer_idx],
            nb_bytes_to_write
          );
       // wait_ready();
        wait_program_or_erase_controller_ready();
        SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);
        target_addr += nb_bytes_to_write;
        in_buffer_idx += nb_bytes_to_write;
    }
    
    /* Send Write Disable command. */
    SPI_set_slave_select(SPI_INSTANCE, SPI_SLAVE);
    cmd_buffer[0] = WRITE_DISABLE_CMD;
    //wait_ready();
    SPI_transfer_block(SPI_INSTANCE, cmd_buffer, 1, 0, 0 );
    //wait_ready();
    SPI_clear_slave_select(SPI_INSTANCE, SPI_SLAVE);
}


 static void wait_program_or_erase_controller_ready(void  )
{
    uint8_t ready_bit;
    uint8_t command = READ_FLAG_STATUS_REGISTER;
    //MSS_SPI_set_slave_select( &g_mss_spi0, MSS_SPI_SLAVE_0 );
    do {

    	 SPI_transfer_block(SPI_INSTANCE, &command, 1, &ready_bit, sizeof(ready_bit) );
        ready_bit = ready_bit & 0x80;

     } while( ready_bit == 0 );
    //MSS_SPI_clear_slave_select( &g_mss_spi0, MSS_SPI_SLAVE_0 );
}

