/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 *
 *
 * @file riscv_hal.h
 * @author Microchip FPGA Embedded Systems Solutions
 * @brief Hardware Abstraction Layer functions for Mi-V soft processors
 *
 * SVN $Revision: 12759 $
 * SVN $Date: 2020-05-14 19:43:19 +0530 (Thu, 14 May 2020) $
 */

#ifndef RISCV_HAL_H
#define RISCV_HAL_H

#include "riscv_plic.h"

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Return value from External IRQ handler. This will be used to disable the
 * External interrupt.
 */
#define EXT_IRQ_KEEP_ENABLED                0U
#define EXT_IRQ_DISABLE                     1U

/*------------------------------------------------------------------------------
 * Interrupt enable/disable.
 */
void __disable_irq(void);
void __enable_irq(void);

/*------------------------------------------------------------------------------
 * System tick handler. This handler function gets called when the Machine
 * timer interrupt asserts. An implementation of this function should be
 * provided by the application to implement the application specific machine
 * timer interrupt handling. If application does not provide such implementation
 * the weakly linked handler stub function implemented in riscv_hal_stubs.c gets
 * linked.
 */
void SysTick_Handler(void);

/*------------------------------------------------------------------------------
 * System tick configuration.
 * Configures the machine timer to generate a system tick interrupt at regular
 * intervals.
 * Takes the number of system clock ticks between interrupts.
 *
 * Returns 0 if successful.
 * Returns 1 if the interrupt interval cannot be achieved.
 */
uint32_t SysTick_Config(uint32_t ticks);

/*------------------------------------------------------------------------------
 * Enable external interrupt bit in MIE register.
 * Note that the RV32IMC cores have only one machine external interrupt, so
 * invoking only this API is enough to enable it.
 * On RV32IMA (AHB and AXI) cores there are 31 external interrupts. So you must
 * also configure and Use PLIC APIs to handle the external interrupts on these
 * cores. On these cores this configuration is done as part of PLIC_init() API.
 */
static inline void __enable_external_irq(void)
{
    set_csr(mie, MIP_MEIP);
}

/*------------------------------------------------------------------------------
 * Disable external interrupt bit in MIE register.
 */
static inline void __disable_external_irq(void)
{
    clear_csr(mie, MIP_MEIP);
}


#ifndef MIV_RV32IMC
#define MSIP                                    (*(uint32_t*)0x44000000UL)
#define MTIMECMP                                (*(uint64_t*)0x44004000UL)
#define MTIME                                   (*(uint64_t*)0x4400BFF8UL)



#else
/*TCM ECC correctable err irq en mask value*/
#define OPSRV_TCM_ECC_CE_IRQ                    0x01u

/*TCMECC uncorrectable err irq en*/
#define OPSRV_TCM_ECC_UCE_IRQ                   0x02u

/*AXI write response err irq en*/
#define OPSRV_AXI_WR_RESP_IRQ                   0x10u

#define OPSRV_BASE_ADDR                         0x00006000UL

typedef struct
{
    volatile uint32_t cfg;
    volatile uint32_t reserved0[3];
    volatile uint32_t irq_en;//10
    volatile uint32_t irq_pend; //14
    volatile uint32_t reserved1[2];
    volatile uint32_t soft_reg; //20
} OPSRV_Type;

#define EXT_INTR_SOURCES                1

#define OPSRV                           ((OPSRV_Type *)OPSRV_BASE_ADDR)

#define MTIMECMP                        (*(uint64_t*)0x02004000UL)
#define MTIME_PRESCALER                 100 //(*(uint32_t*)0x02005000UL)  //until the crash is resolved

#ifndef MIV_RV32IMC_EXT_TIMER
#define MTIME                           (*(uint64_t*)0x0200BFF8UL)
#else
#define MTIME                               HAL_ASSERT(0);
#endif

#define SYS_EI_0        0x0u
#define SYS_EI_1        0x1u
#define SYS_EI_2        0x2u
#define SYS_EI_3        0x3u
#define SYS_EI_4        0x4u
#define SYS_EI_5        0x5u

/*------------------------------------------------------------------------------
 * Enable system external interrupt bit in the MIE register
 * There are 6 system external registers available on the RC32IMC cores.
 * system external interrupts [5:0] correspond to bit 29:24 in MIE/P registers.
 * This API is applicable only on the RV32IMC cores.
 */
static inline void __enable_sys_ext_irq(uint8_t sys_ei_num)
{
    volatile uint32_t reg = (0x01ul << (24u + sys_ei_num));
    set_csr(mie, reg);

    reg = read_csr(mie);
}

/*------------------------------------------------------------------------------
 * Disable system external interrupt bit in the MIE register
 * There are 6 system external registers available on the RC32IMC cores.
 * system external interrupts [5:0] correspond to bit 29:24 in MIE/P registers.
 * This API is applicable only on the RV32IMC cores.
 */
static inline void __disable_sys_ext_irq(uint8_t sys_ei_num)
{
    clear_csr(mie, (0x01ul << (24u + sys_ei_num)));
}

/*
    Enable OPSRV interrupt. Parameter takes logical OR of following values
    #define OPSRV_TCM_ECC_CE_IRQ                    0x01u
    #define OPSRV_TCM_ECC_UCE_IRQ                   0x02u
    #define OPSRV_AXI_WR_RESP_IRQ                   0x10u
 */
static inline void OPSRV_irq_enable(uint32_t irq_mask)
{
    OPSRV->irq_en = irq_mask;
}

/*
    Disable OPSRV interrupt. Parameter takes logical OR of following values
    #define OPSRV_TCM_ECC_CE_IRQ                    0x01u
    #define OPSRV_TCM_ECC_UCE_IRQ                   0x02u
    #define OPSRV_AXI_WR_RESP_IRQ                   0x10u
 */
static inline void OPSRV_irq_disable(uint32_t irq_mask)
{
    OPSRV->cfg &= ~irq_mask;
}

/*
    Disable OPSRV interrupt. Parameter takes logical OR of following values
    #define OPSRV_TCM_ECC_CE_IRQ                    0x01u
    #define OPSRV_TCM_ECC_UCE_IRQ                   0x02u
    #define OPSRV_AXI_WR_RESP_IRQ                   0x10u
 */
static inline void OPSRV_irq_clear(uint32_t irq_mask)
{
    OPSRV->irq_pend |= irq_mask;
}
#endif

/*==============================================================================
 * The function raise_soft_interrupt() raises a synchronous software interrupt
 * by writing into the MSIP register.
 */
static inline void raise_soft_interrupt()
{
    set_csr(mie, MIP_MSIP);       /*Enable software interrupt bit */

#ifndef MIV_RV32IMC
    /*You need to make sure that the global interrupt is enabled*/
    MSIP = 0x01;   /*raise soft interrupt for hart0*/
#else
    /*Raise soft IRQ on RV32IMC processor*/
    OPSRV->soft_reg |= (1u << 1u);

#endif
}

/*==============================================================================
 * The function clear_soft_interrupt() clears a synchronous software interrupt
 * by clearing the MSIP register.
 */
static inline void clear_soft_interrupt()
{
#ifndef MIV_RV32IMC
    unsigned long hart_id = read_csr(mhartid);
    MSIP = 0x00;   /*clear soft interrupt for hart0*/
#else
    /*Clear soft IRQ on RV32IMC processor*/
    OPSRV->soft_reg &= ~(1u << 1u);
#endif
}

static inline uint64_t MTIME_read()
{
#ifndef MIV_RV32IMC_EXT_TIMER
    return(MTIME);
#endif
}

#ifdef __cplusplus
}
#endif

#endif  /* RISCV_HAL_H */

