/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * @file init.c
 * @author Microchip FPGA Embedded Systems Solutions
 * @brief Mi-V soft processor memory section initializations and start-up code.
 *
 * SVN $Revision: 12759 $
 * SVN $Date: 2020-05-14 19:43:19 +0530 (Thu, 14 May 2020) $
 */

#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

#include "encoding.h"

#ifdef __cplusplus
extern "C" {
#endif

extern uint32_t     __sdata_load;
extern uint32_t     __sdata_start;
extern uint32_t     __sdata_end;

extern uint32_t     __data_load;
extern uint32_t     __data_start;
extern uint32_t     __data_end;

extern uint32_t     __sbss_start;
extern uint32_t     __sbss_end;
extern uint32_t     __bss_start;
extern uint32_t     __bss_end;


static void copy_section(uint32_t * p_load, uint32_t * p_vma, uint32_t * p_vma_end)
{
    while(p_vma <= p_vma_end)
    {
        *p_vma = *p_load;
        ++p_load;
        ++p_vma;
    }
}

static void zero_section(uint32_t * start, uint32_t * end)
{
    uint32_t * p_zero = start;
    
    while(p_zero <= end)
    {
        *p_zero = 0;
        ++p_zero;
    }
}

void _init(void)
{
    extern int main(int, char**);
    const char *argv0 = "hello";
    char *argv[] = {(char *)argv0, NULL, NULL};

    if(&__sdata_load != &__sdata_start)
    {
        copy_section(&__sdata_load, &__sdata_start, &__sdata_end);
    }

    if(&__data_load != &__data_start)
    {
        copy_section(&__data_load, &__data_start, &__data_end);
    }

    zero_section(&__sbss_start, &__sbss_end);
    zero_section(&__bss_start, &__bss_end);
    
    main(1, argv);
}

/* Function called after main() finishes */
void
_fini()
{
}

#ifdef __cplusplus
}
#endif

