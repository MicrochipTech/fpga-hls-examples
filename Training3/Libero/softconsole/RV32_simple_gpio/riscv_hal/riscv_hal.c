/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * @file riscv_hal.c
 * @author Microchip FPGA Embedded Systems Solutions
 * @brief Implementation of Hardware Abstraction Layer for Mi-V soft processors
 *
 * SVN $Revision: 12759 $
 * SVN $Date: 2020-05-14 19:43:19 +0530 (Thu, 14 May 2020) $
 */
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

#include "riscv_hal.h"
#include "hw_platform.h"

#ifdef __cplusplus
extern "C" {
#endif

/*For RV32IMC cores this value is configurable in the IP core.
 *Please make sure that this value matches the configured value in the core.
*/
#define SUCCESS                         0U
#define ERROR                           1U

#define A_EXTENSION_MASK                0x00000001u
#define MTVEC_MODE_BIT_MASK             0x00000001u

extern void Software_IRQHandler(void);

#ifndef MIV_RV32IMC
#define MTIME_PRESCALER                 100UL
/*------------------------------------------------------------------------------
 *
 */
uint8_t Invalid_IRQHandler(void);
uint8_t External_1_IRQHandler(void);
uint8_t External_2_IRQHandler(void);
uint8_t External_3_IRQHandler(void);
uint8_t External_4_IRQHandler(void);
uint8_t External_5_IRQHandler(void);
uint8_t External_6_IRQHandler(void);
uint8_t External_7_IRQHandler(void);
uint8_t External_8_IRQHandler(void);
uint8_t External_9_IRQHandler(void);
uint8_t External_10_IRQHandler(void);
uint8_t External_11_IRQHandler(void);
uint8_t External_12_IRQHandler(void);
uint8_t External_13_IRQHandler(void);
uint8_t External_14_IRQHandler(void);
uint8_t External_15_IRQHandler(void);
uint8_t External_16_IRQHandler(void);
uint8_t External_17_IRQHandler(void);
uint8_t External_18_IRQHandler(void);
uint8_t External_19_IRQHandler(void);
uint8_t External_20_IRQHandler(void);
uint8_t External_21_IRQHandler(void);
uint8_t External_22_IRQHandler(void);
uint8_t External_23_IRQHandler(void);
uint8_t External_24_IRQHandler(void);
uint8_t External_25_IRQHandler(void);
uint8_t External_26_IRQHandler(void);
uint8_t External_27_IRQHandler(void);
uint8_t External_28_IRQHandler(void);
uint8_t External_29_IRQHandler(void);
uint8_t External_30_IRQHandler(void);
uint8_t External_31_IRQHandler(void);


/*------------------------------------------------------------------------------
 * RISC-V interrupt handler for external interrupts.
 */
uint8_t (* const ext_irq_handler_table[32])(void) =
{
    Invalid_IRQHandler,
    External_1_IRQHandler,
    External_2_IRQHandler,
    External_3_IRQHandler,
    External_4_IRQHandler,
    External_5_IRQHandler,
    External_6_IRQHandler,
    External_7_IRQHandler,
    External_8_IRQHandler,
    External_9_IRQHandler,
    External_10_IRQHandler,
    External_11_IRQHandler,
    External_12_IRQHandler,
    External_13_IRQHandler,
    External_14_IRQHandler,
    External_15_IRQHandler,
    External_16_IRQHandler,
    External_17_IRQHandler,
    External_18_IRQHandler,
    External_19_IRQHandler,
    External_20_IRQHandler,
    External_21_IRQHandler,
    External_22_IRQHandler,
    External_23_IRQHandler,
    External_24_IRQHandler,
    External_25_IRQHandler,
    External_26_IRQHandler,
    External_27_IRQHandler,
    External_28_IRQHandler,
    External_29_IRQHandler,
    External_30_IRQHandler,
    External_31_IRQHandler
};

#else
/*------------------------------------------------------------------------------
 *
 */
extern void MGEUI_IRQHandler(void);
extern void MGECI_IRQHandler(void);
extern void MSYS_E10_IRQHandler(void);
extern void MSYS_E11_IRQHandler(void);
extern void MSYS_E12_IRQHandler(void);
extern void MSYS_E13_IRQHandler(void);
extern void MSYS_E14_IRQHandler(void);
extern void MSYS_E15_IRQHandler(void);
extern void OPSRV_REG_IRQHandler(void);
extern void External_IRQHandler(void);
#endif

/*------------------------------------------------------------------------------
 * Increment value for the mtimecmp register in order to achieve a system tick
 * interrupt as specified through the SysTick_Config() function.
 */
static uint64_t g_systick_increment = 0U;

/*------------------------------------------------------------------------------
 * Disable all interrupts.
 */
void __disable_irq(void)
{
    clear_csr(mstatus, MSTATUS_MPIE);
    clear_csr(mstatus, MSTATUS_MIE);
}

/*------------------------------------------------------------------------------
 * Enabler all interrupts.
 */
void __enable_irq(void)
{
    set_csr(mstatus, MSTATUS_MIE);
    /*Confirmation required if the MSTATUS_MIE bit also covers for the OPSRV
     * interrupts*/
}

/*------------------------------------------------------------------------------
 * Configure the machine timer to generate an interrupt.
 */
uint32_t SysTick_Config(uint32_t ticks)
{
    uint32_t ret_val = ERROR;

    g_systick_increment = (uint64_t)(ticks) / MTIME_PRESCALER;

    if (g_systick_increment > 0U)
    {
#ifndef MIV_RV32IMC_EXT_TIMECMP
        MTIMECMP = MTIME + g_systick_increment;
#endif
        set_csr(mie, MIP_MTIP);

        __enable_irq();

        ret_val = SUCCESS;
    }

    return ret_val;
}

/*------------------------------------------------------------------------------
 * RISC-V interrupt handler for machine timer interrupts.
 */
void handle_m_timer_interrupt(void)
{
    clear_csr(mie, MIP_MTIP);
    SysTick_Handler();
#ifndef MIV_RV32IMC_EXT_TIMECMP
    MTIMECMP = MTIME + g_systick_increment;
#endif
    set_csr(mie, MIP_MTIP);
}

/*------------------------------------------------------------------------------
 *
 */
#ifndef MIV_RV32IMC
void handle_m_ext_interrupt(void)
{
    uint32_t int_num  = PLIC_ClaimIRQ();
    uint8_t disable = EXT_IRQ_KEEP_ENABLED;
    disable = ext_irq_handler_table[int_num]();

    PLIC_CompleteIRQ(int_num);

    if(EXT_IRQ_DISABLE == disable)
    {
        PLIC_DisableIRQ((IRQn_Type)int_num);
    }
}
#endif

void handle_m_soft_interrupt(void)
{
    Software_IRQHandler();

    /*Clear software interrupt*/
    clear_soft_interrupt();
}

/*------------------------------------------------------------------------------
 * Trap/Interrupt handler
 */
void handle_trap(uintptr_t mcause, uintptr_t mepc)
{
    if ((mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == IRQ_M_EXT))
    {
#ifndef MIV_RV32IMC
        handle_m_ext_interrupt();
#else
        External_IRQHandler();
#endif
    }
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == IRQ_M_SOFT))
    {
        handle_m_soft_interrupt();
    }
    else if ((mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == IRQ_M_TIMER))
    {
        handle_m_timer_interrupt();
    }

#ifdef MIV_RV32IMC
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == MSYS_E10))
    {
        MSYS_E10_IRQHandler();
    }
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == MSYS_E11))
    {
        MSYS_E11_IRQHandler();
    }
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == MSYS_E12))
    {
        MSYS_E12_IRQHandler();
    }
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == MSYS_E13))
    {
        MSYS_E13_IRQHandler();
    }
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == MSYS_E14))
    {
        MSYS_E14_IRQHandler();
    }
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == MSYS_E15))
    {
        MSYS_E15_IRQHandler();
    }
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == OPSRV_REG))
    {
        OPSRV_REG_IRQHandler();
    }
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == MGEUI))
    {
        MGEUI_IRQHandler();
    }
    else if ( (mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == MGECI))
    {
        MGECI_IRQHandler();
    }
#endif

    else
    {
#ifndef NDEBUG
        /*
         Arguments supplied to this function are mcause, mepc (exception PC) and
         stack pointer based on privileged-isa specification
         mcause values and meanings are:
         0 Instruction address misaligned (mtval/mbadaddr is the address)
         1 Instruction access fault       (mtval/mbadaddr is the address)
         2 Illegal instruction            (mtval/mbadaddr contains the
                                                   offending instruction opcode)
         3 Breakpoint
         4 Load address misaligned        (mtval/mbadaddr is the address)
         5 Load address fault             (mtval/mbadaddr is the address)
         6 Store/AMO address fault        (mtval/mbadaddr is the address)
         7 Store/AMO access fault         (mtval/mbadaddr is the address)
         8 Environment call from U-mode
         9 Environment call from S-mode
         A Environment call from M-mode
         B Instruction page fault
         C Load page fault                (mtval/mbadaddr is the address)
         E Store page fault               (mtval/mbadaddr is the address)
        */

        /* interrupt pending */
         uintptr_t mip      = read_csr(mip);

         /* additional info and meaning depends on mcause */
         uintptr_t mbadaddr = read_csr(mbadaddr);

         /* trap vector */
         uintptr_t mtvec    = read_csr(mtvec);

         /* temporary, sometimes might hold temporary value of a0 */
         uintptr_t mscratch = read_csr(mscratch);

         /* status contains many smaller fields: */
         uintptr_t mstatus  = read_csr(mstatus);

        /* breakpoint*/
        __asm("ebreak");
#else
        _exit(1 + mcause);
#endif
    }

}

#ifdef __cplusplus
}
#endif
