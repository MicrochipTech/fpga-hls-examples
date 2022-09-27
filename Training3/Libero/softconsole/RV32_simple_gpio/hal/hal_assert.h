/*******************************************************************************
 * (c) Copyright 2018-2019 Microsemi-PRO Embedded Systems Solutions. 
 * All rights reserved.
 * 
 * SVN $Revision: 11278 $
 * SVN $Date: 2019-05-16 20:39:56 +0530 (Thu, 16 May 2019) $
 */
#ifndef HAL_ASSERT_HEADER
#define HAL_ASSERT_HEADER

#define NDEBUG 1

#if defined(NDEBUG)
/***************************************************************************//**
 * HAL_ASSERT() is defined out when the NDEBUG symbol is used.
 ******************************************************************************/
#define HAL_ASSERT(CHECK)

#else
/***************************************************************************//**
 * Default behaviour for HAL_ASSERT() macro:
 *------------------------------------------------------------------------------
  The behaviour is toolchain specific and project setting specific.
 ******************************************************************************/
#define HAL_ASSERT(CHECK)     ASSERT(CHECK);

#endif  /* NDEBUG */

#endif  /* HAL_ASSERT_HEADER */

