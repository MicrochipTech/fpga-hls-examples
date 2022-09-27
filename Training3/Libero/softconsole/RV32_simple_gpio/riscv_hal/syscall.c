/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * @file syscall.c
 * @author Microchip FPGA Embedded Systems Solutions
 * @brief Stubs for system calls.
 *
 * SVN $Revision: 12759 $
 * SVN $Date: 2020-05-14 19:43:19 +0530 (Thu, 14 May 2020) $
 */
#include <unistd.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/times.h>
#include <stdio.h>


#include "encoding.h"

#ifdef MSCC_STDIO_THRU_CORE_UART_APB

#include "core_uart_apb.h"
#include "hw_platform.h"

#endif  /*MSCC_STDIO_THRU_CORE_UART_APB*/

#ifdef __cplusplus
extern "C" {
#endif

#ifdef MSCC_STDIO_THRU_CORE_UART_APB

/*------------------------------------------------------------------------------
 * CoreUARTapb instance data for the CoreUARTapb instance used for standard
 * output.
 */
static UART_instance_t g_stdio_uart;

/*==============================================================================
 * Flag used to indicate if the UART driver needs to be initialized.
 */
static int g_stdio_uart_init_done = 0;

/*
 * Disable semihosting apis
 */
#pragma import(__use_no_semihosting_swi)

/*==============================================================================
 * sendchar()
 */
int sendchar(int ch)
{
    /*--------------------------------------------------------------------------
    * Initialize the UART driver if it is the first time this function is
    * called.
    */
    if ( !g_stdio_uart_init_done )
    {
        /******************************************************************************
         * Baud value:
         * This value is calculated using the following equation:
         *      BAUD_VALUE = (CLOCK / (16 * BAUD_RATE)) - 1
         *****************************************************************************/
        UART_init( &g_stdio_uart,
                   MSCC_STDIO_UART_BASE_ADDR,
                   ((SYS_CLK_FREQ/(16 * MSCC_STDIO_BAUD_VALUE))-1),
                   (DATA_8_BITS | NO_PARITY));

        g_stdio_uart_init_done = 1;
    }

    /*--------------------------------------------------------------------------
    * Output text to the UART.
    */
    UART_send( &g_stdio_uart, (uint8_t *)&ch, 1 );

    return (ch);
}

/*==============================================================================
 * getachar()
 */
int getachar(void)
{
    uint8_t rx_size;
    uint8_t rx_byte;

    if ( !g_stdio_uart_init_done )
    {
        /******************************************************************************
         * Baud value:
         * This value is calculated using the following equation:
         *      BAUD_VALUE = (CLOCK / (16 * BAUD_RATE)) - 1
         *****************************************************************************/
        UART_init( &g_stdio_uart,
                   MSCC_STDIO_UART_BASE_ADDR,
                   ((SYS_CLK_FREQ/(16 * MSCC_STDIO_BAUD_VALUE))-1),
                   (DATA_8_BITS | NO_PARITY));

        g_stdio_uart_init_done = 1;
    }

    do
    {
        rx_size = UART_get_rx(&g_stdio_uart, &rx_byte, 1);
    } while(0u == rx_size);

    return rx_byte;
}

#endif /*MSCC_STDIO_THRU_CORE_UART_APB*/

#undef errno
int errno;

char *__env[1] = { 0 };
char **environ = __env;

void write_hex(int fd, uint32_t hex)
{
    uint8_t ii;
    uint8_t jj;
    char towrite;
    uint8_t digit;

    write( fd , "0x", 2 );

    for (ii = 8 ; ii > 0; ii--)
    {
        jj = ii-1;
        digit = ((hex & (0xF << (jj*4))) >> (jj*4));
        towrite = digit < 0xA ? ('0' + digit) : ('A' +  (digit - 0xA));
        write( fd, &towrite, 1);
    }
}

               
#ifdef GDB_TESTING
void __attribute__((optimize("O0"))) _exit(int code)
#else
void _exit(int code)
#endif
{
#ifdef MSCC_STDIO_THRU_CORE_UART_APB
    const char * message = "\nProgam has exited with code:";

    write(STDERR_FILENO, message, strlen(message));
    write_hex(STDERR_FILENO, code);
#endif

    while (1);
}

void *_sbrk(ptrdiff_t incr)
{
    extern char _end[];
    extern char _heap_end[];
    static char *curbrk = _end;

    if ((curbrk + incr < _end) || (curbrk + incr > _heap_end))
    {
        return ((char *) - 1);
    }

    curbrk += incr;
    return curbrk - incr;
}

int _isatty(int fd)
{
    if (fd <= 2u)    /* one of stdin, stdout, stderr */
    {
        return 1u;
    }
    else
    {
        errno = EBADF;
        return 0u;
    }
}

static int stub(int err)
{
    errno = err;
    return -1;
}

int _open(const char* name, int flags, int mode)
{
    return stub(ENOENT);
}

int _openat(int dirfd, const char* name, int flags, int mode)
{
    return stub(ENOENT);
}

int _close(int fd)
{
    return stub(EBADF);
}

int _execve(const char* name, char* const argv[], char* const env[])
{
    return stub(ENOMEM);
}

int _fork()
{
    return stub(EAGAIN);
}

int _fstat(int fd, struct stat *st)
{
    if (isatty(fd))
    {
        st->st_mode = S_IFCHR;
        return 0;
    }

    return stub(EBADF);
}

int _getpid()
{
    return 1;
}

int _kill(int pid, int sig)
{
    return stub(EINVAL);
}

int _link(const char *old_name, const char *new_name)
{
    return stub(EMLINK);
}

off_t _lseek(int fd, off_t ptr, int dir)
{
    if (_isatty(fd))
    {
        return 0;
    }

    return stub(EBADF);
}

ssize_t _read(int fd, void* ptr, size_t len)
{
#ifdef MSCC_STDIO_THRU_CORE_UART_APB

    char* ptr1 = (char*)ptr;

    if (_isatty(fd))
    {
        int  count;

        for (count = 0; count < len; count++)
        {
            ptr1[count] = getachar();
            sendchar(ptr1[count]);

            /* Return partial buffer if we get EOL */
            if (('\r' == ptr1[count])||('\n' == ptr1[count]))
            {
                ptr1[count] = '\n';
                return  count;
            }
        }

        return  count;          /* Filled the buffer */
    }
#endif

    return stub(EBADF);
}

int _stat(const char* file, struct stat* st)
{
    return stub(EACCES);
}

clock_t _times(struct tms* buf)
{
    return stub(EACCES);
}

int _unlink(const char* name)
{
    return stub(ENOENT);
}

int _wait(int* status)
{
    return stub(ECHILD);
}

ssize_t _write(int fd, const void* ptr, size_t len)
{
#ifdef MSCC_STDIO_THRU_CORE_UART_APB
    int count_out;
    char* ptr1 = (char*)ptr;

    /*--------------------------------------------------------------------------
     * Output text to the UART.
     */
    count_out = 0;
    while(len--)
    {
        sendchar(ptr1[count_out]);
        count_out++;
    }

    errno = 0;
    return count_out;

#else   /* MSCC_STDIO_THRU_CORE_UART_APB */

    return stub(EBADF);

#endif  /* MSCC_STDIO_THRU_CORE_UART_APB */

}

#ifdef __cplusplus
}
#endif
