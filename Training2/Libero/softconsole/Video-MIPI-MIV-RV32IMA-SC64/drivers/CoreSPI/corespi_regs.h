/*******************************************************************************
 * (c) Copyright 2011-2018 Microsemi SoC Products Group. All rights reserved.
 * 
 * CoreSPI hardware registers definitions.
 *
 * SVN $Revision: 9667 $
 * SVN $Date: 2018-01-16 16:43:50 +0530 (Tue, 16 Jan 2018) $
 */
#ifndef CORESPI_REGS_H_
#define CORESPI_REGS_H_

/*******************************************************************************
 * Control register 1:
 *------------------------------------------------------------------------------
 */
#define CTRL1_REG_OFFSET            0x00u

#define CTRL1_ENABLE_OFFSET         0x00u
#define CTRL1_ENABLE_MASK           0x01u
#define CTRL1_ENABLE_SHIFT          0x00

#define CTRL1_MASTER_OFFSET         0x00u
#define CTRL1_MASTER_MASK           0x02u
#define CTRL1_MASTER_SHIFT          0x01

#define CTRL1_INTRXDATA_OFFSET      0x00u
#define CTRL1_INTRXDATA_MASK        0x04u
#define CTRL1_INTRXDATA_SHIFT       0x02

#define CTRL1_INTTXDONE_OFFSET      0x00u
#define CTRL1_INTTXDONE_MASK        0x08u
#define CTRL1_INTTXDONE_SHIFT       0x03

#define CTRL1_INTRXOVFLOW_OFFSET    0x00u
#define CTRL1_INTRXOVFLOW_MASK      0x10u
#define CTRL1_INTRXOVFLOW_SHIFT     0x04

#define CTRL1_INTTXURUN_OFFSET      0x00u
#define CTRL1_INTTXURUN_MASK        0x20u
#define CTRL1_INTTXURUN_SHIFT       0x05

#define CTRL1_FRAMEURUN_OFFSET      0x00u
#define CTRL1_FRAMEURUN_MASK        0x40u
#define CTRL1_FRAMEURUN_SHIFT       0x06

#define CTRL1_OENOFF_OFFSET         0x00u
#define CTRL1_OENOFF_MASK           0x80u
#define CTRL1_OENOFF_SHIFT          0x07

/*******************************************************************************
 * Interrupt clear register:
 *------------------------------------------------------------------------------
 */
#define INTCLR_REG_OFFSET           0x04u

#define INTCLR_TXDONE_OFFSET        0x04u
#define INTCLR_TXDONE_MASK          0x01u
#define INTCLR_TXDONE_SHIFT         0x00

#define INTCLR_RXDONE_OFFSET        0x04u
#define INTCLR_RXDONE_MASK          0x02u
#define INTCLR_RXDONE_SHIFT         0x01

#define INTCLR_RXOVERFLOW_OFFSET    0x04u
#define INTCLR_RXOVERFLOW_MASK      0x04u
#define INTCLR_RXOVERFLOW_SHIFT     0x02

#define INTCLR_TXUNDERRUN_OFFSET    0x04u
#define INTCLR_TXUNDERRUN_MASK      0x08u
#define INTCLR_TXUNDERRUN_SHIFT     0x03

#define INTCLR_CMDINT_OFFSET        0x04u
#define INTCLR_CMDINT_MASK          0x10u
#define INTCLR_CMDINT_SHIFT         0x04

#define INTCLR_SSEND_OFFSET         0x04u
#define INTCLR_SSEND_MASK           0x20u
#define INTCLR_SSEND_SHIFT          0x05

#define INTCLR_RXDATA_OFFSET        0x04u
#define INTCLR_RXDATA_MASK          0x40u
#define INTCLR_RXDATA_SHIFT         0x06

#define INTCLR_TXDATA_OFFSET        0x04u
#define INTCLR_TXDATA_MASK          0x80u
#define INTCLR_TXDATA_SHIFT         0x07

/*******************************************************************************
 * Receive data register:
 *------------------------------------------------------------------------------
 */
#define RXDATA_REG_OFFSET           0x08u

/*******************************************************************************
 * Transmit data register:
 *------------------------------------------------------------------------------
 */
#define TXDATA_REG_OFFSET           0x0Cu

/*******************************************************************************
 * Masked interrupt status register:
 *------------------------------------------------------------------------------
 */
#define INTMASK_REG_OFFSET          0x10u

#define INTMASK_TXDONE_OFFSET       0x10u
#define INTMASK_TXDONE_MASK         0x01u
#define INTMASK_TXDONE_SHIFT        0x00

#define INTMASK_RXDONE_OFFSET       0x10u
#define INTMASK_RXDONE_MASK         0x02u
#define INTMASK_RXDONE_SHIFT        0x01

#define INTMASK_RXOVERFLOW_OFFSET   0x10u
#define INTMASK_RXOVERFLOW_MASK     0x04u
#define INTMASK_RXOVERFLOW_SHIFT    0x02

#define INTMASK_TXUNDERRUN_OFFSET   0x10u
#define INTMASK_TXUNDERRUN_MASK     0x08u
#define INTMASK_TXUNDERRUN_SHIFT    0x03

#define INTMASK_CMDINT_OFFSET       0x10u
#define INTMASK_CMDINT_MASK         0x10u
#define INTMASK_CMDINT_SHIFT        0x04

#define INTMASK_SSEND_OFFSET        0x10u
#define INTMASK_SSEND_MASK          0x20u
#define INTMASK_SSEND_SHIFT         0x05

#define INTMASK_RXDATA_OFFSET       0x10u
#define INTMASK_RXDATA_MASK         0x40u
#define INTMASK_RXDATA_SHIFT        0x06

#define INTMASK_TXDATA_OFFSET       0x10u
#define INTMASK_TXDATA_MASK         0x80u
#define INTMASK_TXDATA_SHIFT        0x07

/*******************************************************************************
 * Raw interrupt status register:
 *------------------------------------------------------------------------------
 */
#define INTRAW_REG_OFFSET           0x14u

#define INTRAW_TXDONE_OFFSET        0x14u
#define INTRAW_TXDONE_MASK          0x01u
#define INTRAW_TXDONE_SHIFT         0x00

#define INTRAW_RXDONE_OFFSET        0x14u
#define INTRAW_RXDONE_MASK          0x02u
#define INTRAW_RXDONE_SHIFT         0x01

#define INTRAW_RXOVERFLOW_OFFSET    0x14u
#define INTRAW_RXOVERFLOW_MASK      0x04u
#define INTRAW_RXOVERFLOW_SHIFT     0x02

#define INTRAW_TXUNDERRUN_OFFSET    0x14u
#define INTRAW_TXUNDERRUN_MASK      0x08u
#define INTRAW_TXUNDERRUN_SHIFT     0x03

#define INTRAW_CMDINT_OFFSET        0x14u
#define INTRAW_CMDINT_MASK          0x10u
#define INTRAW_CMDINT_SHIFT         0x04

#define INTRAW_SSEND_OFFSET         0x14u
#define INTRAW_SSEND_MASK           0x20u
#define INTRAW_SSEND_SHIFT          0x05

#define INTRAW_RXDATA_OFFSET        0x14u
#define INTRAW_RXDATA_MASK          0x40u
#define INTRAW_RXDATA_SHIFT         0x06

#define INTRAW_TXDATA_OFFSET        0x14u
#define INTRAW_TXDATA_MASK          0x80u
#define INTRAW_TXDATA_SHIFT         0x07

/*******************************************************************************
 * Control register 2:
 *------------------------------------------------------------------------------
 */
#define CTRL2_REG_OFFSET            0x18u

#define CTRL2_CMDSIZE_OFFSET        0x18u
#define CTRL2_CMDSIZE_MASK          0x07u
#define CTRL2_CMDSIZE_SHIFT         0x00

#define CTRL2_INTCMD_OFFSET         0x18u
#define CTRL2_INTCMD_MASK           0x10u
#define CTRL2_INTCMD_SHIFT          0x04

#define CTRL2_INTSSEND_OFFSET       0x18u
#define CTRL2_INTSSEND_MASK         0x20u
#define CTRL2_INTSSEND_SHIFT        0x05

#define CTRL2_INTRXDATA_OFFSET      0x18u
#define CTRL2_INTRXDATA_MASK        0x40u
#define CTRL2_INTRXDATA_SHIFT       0x06

#define CTRL2_INTTXDATA_OFFSET      0x18u
#define CTRL2_INTTXDATA_MASK        0x80u
#define CTRL2_INTTXDATA_SHIFT       0x07

/*******************************************************************************
 * Command register:
 *------------------------------------------------------------------------------
 */
#define CMD_REG_OFFSET              0x1Cu

#define CMD_RXFIFORST_OFFSET        0x1Cu
#define CMD_RXFIFORST_MASK          0x01u
#define CMD_RXFIFORST_SHIFT         0x00

#define CMD_TXFIFORST_OFFSET        0x1Cu
#define CMD_TXFIFORST_MASK          0x02u
#define CMD_TXFIFORST_SHIFT         0x01

/*******************************************************************************
 * Status register:
 *------------------------------------------------------------------------------
 */
#define STATUS_REG_OFFSET           0x20u

#define STATUS_FIRSTFRAME_OFFSET    0x20u
#define STATUS_FIRSTFRAME_MASK      0x01u
#define STATUS_FIRSTFRAME_SHIFT     0x00

#define STATUS_DONE_OFFSET          0x20u
#define STATUS_DONE_MASK            0x02u
#define STATUS_DONE_SHIFT           0x01

#define STATUS_RXEMPTY_OFFSET       0x20u
#define STATUS_RXEMPTY_MASK         0x04u
#define STATUS_RXEMPTY_SHIFT        0x02

#define STATUS_TXFULL_OFFSET        0x20u
#define STATUS_TXFULL_MASK          0x08u
#define STATUS_TXFULL_SHIFT         0x03

#define STATUS_RXOVFLOW_OFFSET      0x20u
#define STATUS_RXOVFLOW_MASK        0x10u
#define STATUS_RXOVFLOW_SHIFT       0x04

#define STATUS_TXUNDERRUN_OFFSET    0x20u
#define STATUS_TXUNDERRUN_MASK      0x20u
#define STATUS_TXUNDERRUN_SHIFT     0x05

#define STATUS_SSEL_OFFSET          0x20u
#define STATUS_SSEL_MASK            0x40u
#define STATUS_SSEL_SHIFT           0x06

#define STATUS_ACTIVE_OFFSET        0x20u
#define STATUS_ACTIVE_MASK          0x80u
#define STATUS_ACTIVE_SHIFT         0x07

/*******************************************************************************
 * Slave select register:
 *------------------------------------------------------------------------------
 */
#define SSEL_REG_OFFSET             0x24u

/*******************************************************************************
 * Transmit data last register:
 *------------------------------------------------------------------------------
 */
#define TXLAST_REG_OFFSET           0x28u


#endif /*CORESPI_REGS_H_*/
