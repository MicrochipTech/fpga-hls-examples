/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * @file entry.S
 * @author Microchip FPGA Embedded Systems Solutions
 * @brief Mi-V soft processor vectors, trap handling and startup code.
 *
 * SVN $Revision: 12759 $
 * SVN $Date: 2020-05-14 19:43:19 +0530 (Thu, 14 May 2020) $
 */
#ifndef ENTRY_S
#define ENTRY_S

#include "encoding.h"

#define A_EXTENSION_MASK                0x00000001u
#define MTVEC_MODE_BIT_MASK             0x00000003u

#define MTVEC_VECTORED_MODE_VAL         0x00000001u

#if __riscv_xlen == 64
# define LREG ld
# define SREG sd
# define REGBYTES 8
#else
# define LREG lw
# define SREG sw
# define REGBYTES 4
#endif

  .section      .entry, "ax"
  .globl _start

_start:
  csrwi mstatus, 0
  csrwi mie, 0

  csrr t0, misa
  andi t0, t0, A_EXTENSION_MASK
  bnez t0, ima_cores_vector_setup        /*Go to IMA handling at ima_cores*/

/*For IMC cores the mtvec exceptio base address and mode bits are set by IP Core
  configurator. For IMC cores mtvec is read-only in vectored mode.
  Check the mode bits*/
  csrr t0, mtvec
  andi t0, t0, MTVEC_MODE_BIT_MASK
  li t1, MTVEC_VECTORED_MODE_VAL
  bne t0, t1, ima_cores_vector_setup        /*goto non_vectored_handling*/

  /*When mode = 1 => this is vectored mode on IMC cores.
    Verify that the trap_handler address is matching the configuration in MTVEC*/
  csrr t0, mtvec
  andi t0, t0, 0xFFFFFFFC
  la t1, trap_entry
  bne t0, t1, vector_address_not_matching
  j generic_reset_handling

ima_cores_vector_setup:
  la t0, trap_entry
#ifdef MiV_RV32IMA_VECTORED_INTERRUPTS
  addi t0, t0, 0x01 /*set the mode bit for IMA cores for IMC cores this is done by configurator*/
#endif
  csrw mtvec, t0

generic_reset_handling:

/*Floating point support configuration*/
#ifdef __riscv_flen
  csrr t0, mstatus
  lui t1, 0xffffa
  addi t1, t1, -1
  and t0, t0, t1
  lui t1, 0x4
  or t1, t0, t1
  csrw mstatus, t1

  lui t0, 0x0
  fscsr t0
#endif

.option push

# Ensure the instruction is not optimized, since gp is not yet set

.option norelax
  # initialize global pointer
  la gp, __global_pointer$

.option pop

  # initialize stack pointer
  la sp, __stack_top

  # perform the rest of initialization in C
  j _init


nmi_vector:
  j nmi_vector

trap_vector:
  j trap_entry

/*Error: trap_entry is not at the expected address of reset_vector+mtvec offset
as configured in the IMC core vectored mode*/
vector_address_not_matching:
  ebreak

.section      .trap_e, "ax"
trap_entry:
  j generic_trap_handler
#ifdef __riscv_compressed
  .2byte 0
#endif
  .word 0
  .word 0

sw_trap_entry:
  j vector_sw_trap_handler      //3
#ifdef __riscv_compressed
  .2byte 0
#endif
  .word 0
  .word 0
  .word 0

tmr_trap_entry:
  j vector_tmr_trap_handler     //7
#ifdef __riscv_compressed
  .2byte 0
#endif
  .word 0
  .word 0
  .word 0

ext_trap_entry:
  j vector_ext_trap_handler     //11
#ifdef __riscv_compressed
  .2byte 0
#endif
  .word 0
  .word 0
  .word 0
  .word 0

#ifdef MIV_RV32IMC
MGEUI_trap_entry:
  j vector_MGEUI_trap_handler            //16
#ifdef __riscv_compressed
  .2byte 0
#endif

MGECI_trap_entry:
  j vector_MGECI_trap_handler            //17
#ifdef __riscv_compressed
  .2byte 0
#endif
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0

MSYS_E10_trap_entry:
  j vector_MSYS_E10_trap_handler       //24
#ifdef __riscv_compressed
  .2byte 0
#endif

MSYS_E11_trap_entry:
  j vector_MSYS_E11_trap_handler       //25
#ifdef __riscv_compressed
  .2byte 0
#endif

MSYS_E12_trap_entry:
  j vector_MSYS_E12_trap_handler       //26
#ifdef __riscv_compressed
  .2byte 0
#endif

MSYS_E13_trap_entry:
  j vector_MSYS_E13_trap_handler       //27
#ifdef __riscv_compressed
  .2byte 0
#endif

MSYS_E14_trap_entry:
  j vector_MSYS_E14_trap_handler       //28
#ifdef __riscv_compressed
  .2byte 0
#endif

MSYS_E15_trap_entry:
  j vector_MSYS_E15_trap_handler       //29
#ifdef __riscv_compressed
  .2byte 0
#endif

#ifdef __riscv_compressed
  .2byte 0
#endif

OPSRV_trap_entry:
  j vector_OPSRV_REG_IRQHandler        //30
#endif  // MIV_RV32IMC

.align 4
generic_trap_handler:
  addi sp, sp, -32*REGBYTES
.align 4
  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  csrr a0, mcause               //first param
  csrr a1, mepc                 //second param
  jal handle_trap
  j generic_restore

vector_sw_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal handle_m_soft_interrupt
  j generic_restore

vector_tmr_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal handle_m_timer_interrupt
  j generic_restore

vector_ext_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

#ifndef MIV_RV32IMC
  jal handle_m_ext_interrupt
#else
  jal External_IRQHandler
#endif //MIV_RV32IMC
  j generic_restore

#ifdef MIV_RV32IMC
vector_MGEUI_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal MGEUI_IRQHandler
  j generic_restore

vector_MGECI_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal MGECI_IRQHandler
  j generic_restore

vector_MSYS_E10_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal MSYS_E10_IRQHandler
  j generic_restore

vector_MSYS_E11_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal MSYS_E11_IRQHandler
  j generic_restore

vector_MSYS_E12_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal MSYS_E12_IRQHandler
  j generic_restore

vector_MSYS_E13_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal MSYS_E13_IRQHandler
  j generic_restore

vector_MSYS_E14_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal MSYS_E14_IRQHandler
  j generic_restore

vector_MSYS_E15_trap_handler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal MSYS_E15_IRQHandler
  j generic_restore

vector_OPSRV_REG_IRQHandler:
  addi sp, sp, -32*REGBYTES

  SREG x1, 0 * REGBYTES(sp)
  SREG x2, 1 * REGBYTES(sp)
  SREG x3, 2 * REGBYTES(sp)
  SREG x4, 3 * REGBYTES(sp)
  SREG x5, 4 * REGBYTES(sp)
  SREG x6, 5 * REGBYTES(sp)
  SREG x7, 6 * REGBYTES(sp)
  SREG x8, 7 * REGBYTES(sp)
  SREG x9, 8 * REGBYTES(sp)
  SREG x10, 9 * REGBYTES(sp)
  SREG x11, 10 * REGBYTES(sp)
  SREG x12, 11 * REGBYTES(sp)
  SREG x13, 12 * REGBYTES(sp)
  SREG x14, 13 * REGBYTES(sp)
  SREG x15, 14 * REGBYTES(sp)
  SREG x16, 15 * REGBYTES(sp)
  SREG x17, 16 * REGBYTES(sp)
  SREG x18, 17 * REGBYTES(sp)
  SREG x19, 18 * REGBYTES(sp)
  SREG x20, 19 * REGBYTES(sp)
  SREG x21, 20 * REGBYTES(sp)
  SREG x22, 21 * REGBYTES(sp)
  SREG x23, 22 * REGBYTES(sp)
  SREG x24, 23 * REGBYTES(sp)
  SREG x25, 24 * REGBYTES(sp)
  SREG x26, 25 * REGBYTES(sp)
  SREG x27, 26 * REGBYTES(sp)
  SREG x28, 27 * REGBYTES(sp)
  SREG x29, 28 * REGBYTES(sp)
  SREG x30, 29 * REGBYTES(sp)
  SREG x31, 30 * REGBYTES(sp)

  jal OPSRV_REG_IRQHandler
  j generic_restore
#endif //MIV_RV32IMC

generic_restore:
  # Remain in M-mode after mret
  li t0, MSTATUS_MPP
  csrs mstatus, t0

  LREG x1, 0 * REGBYTES(sp)
  LREG x2, 1 * REGBYTES(sp)
  LREG x3, 2 * REGBYTES(sp)
  LREG x4, 3 * REGBYTES(sp)
  LREG x5, 4 * REGBYTES(sp)
  LREG x6, 5 * REGBYTES(sp)
  LREG x7, 6 * REGBYTES(sp)
  LREG x8, 7 * REGBYTES(sp)
  LREG x9, 8 * REGBYTES(sp)
  LREG x10, 9 * REGBYTES(sp)
  LREG x11, 10 * REGBYTES(sp)
  LREG x12, 11 * REGBYTES(sp)
  LREG x13, 12 * REGBYTES(sp)
  LREG x14, 13 * REGBYTES(sp)
  LREG x15, 14 * REGBYTES(sp)
  LREG x16, 15 * REGBYTES(sp)
  LREG x17, 16 * REGBYTES(sp)
  LREG x18, 17 * REGBYTES(sp)
  LREG x19, 18 * REGBYTES(sp)
  LREG x20, 19 * REGBYTES(sp)
  LREG x21, 20 * REGBYTES(sp)
  LREG x22, 21 * REGBYTES(sp)
  LREG x23, 22 * REGBYTES(sp)
  LREG x24, 23 * REGBYTES(sp)
  LREG x25, 24 * REGBYTES(sp)
  LREG x26, 25 * REGBYTES(sp)
  LREG x27, 26 * REGBYTES(sp)
  LREG x28, 27 * REGBYTES(sp)
  LREG x29, 28 * REGBYTES(sp)
  LREG x30, 29 * REGBYTES(sp)
  LREG x31, 30 * REGBYTES(sp)

  addi sp, sp, 32*REGBYTES
  mret

#endif /*ENTRY_S*/
