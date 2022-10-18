/***************************************************************************//**
 * (c) Copyright 2009 Actel Corporation.  All rights reserved.
 * 
 *  MICRON_1G_SPI_FLASH_ SPI flash driver API.
 *
 * SVN $Revision:$
 * SVN $Date:$
 */

#ifndef __MICRON_1G_SPI_FLASH_H_
#define __MICRON_1G_SPI_FLASH_H_

#include <stdint.h>
#include <stdlib.h>

#define DIE_ERASE_0_256MB 0
#define DIE_ERASE_256MB_512MB 1
#define DIE_ERASE_512MB_768MB 2
#define DIE_ERASE_768MB_1GB 3

#define ERASE_4K_BLOCK  0
#define ERASE_64K_BLOCK  1


void FLASH_init( void );

void FLASH_read_device_id
(
    uint8_t * manufacturer_id,
    uint8_t * device_id
);

void FLASH_read
(
    uint32_t address,
    uint8_t * rx_buffer,
    size_t size_in_bytes
);

void FLASH_global_unprotect( void );
/* call this function 4 times as follows to erase the entire chip
 * FLASH_die_256MB_erase(DIE_ERASE_0_256MB);
 * FLASH_die_256MB_erase(DIE_ERASE_256MB_512MB)
 * FLASH_die_256MB_erase(DIE_ERASE_512MB_768MB)
 * FLASH_die_256MB_erase(DIE_ERASE_768MB_1GB)
 *
 *  */
void FLASH_die_256MB_erase( uint8_t );

void FLASH_erase_64k_block
(
    uint32_t address
);


void FLASH_program
(
    uint32_t address,
    uint8_t * write_buffer,
    size_t size_in_bytes
);

#endif
