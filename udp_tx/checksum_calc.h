#define __CHECKSUM_CALC_H_

#include "utils.h"

#include <legup/bit_level_operations.h>
#include <legup/streaming.hpp>
#include <legup/types.h>

void checksumCalculation(legup::FIFO<AxiWord> &dataIn,
                         legup::FIFO<uint16> &checksumOut) {

    // One software example for calculating checksum
    //
    //    sum = 0;
    //    while (len > 1) {
    //        sum += *buf++;
    //        if (sum & 0x80000000)
    //            sum = (sum & 0xFFFF) + (sum >> 16);
    //        len -= 2;
    //    }
    //    // Add the padding if the packet lenght is odd
    //    if ( len & 1 )
    //        sum += *((uint8_t *)buf);

    // Note:
    //  Byte order doesn't matter, as long as the bytes at odd position is
    //  added to the odd ones, and the even position added to the even ones.
    //
    //  Because we are using axi interface with keep signal here, we should use
    //  little endian format.

    // FIXME: does 32-bit value big enough to avoid overflow??
    static uint32 checksum = 0;

    if (!dataIn.empty()) {
        AxiWord inputWord = dataIn.read();
        uint64 data = inputWord.data & Keep2Mask(inputWord.keep);

        uint32 tempSum = checksum;
        tempSum +=
            legup_bit_select(data, 63, 48) + legup_bit_select(data, 47, 32) +
            legup_bit_select(data, 31, 16) + legup_bit_select(data, 15, 0);

        if (inputWord.last) {
            checksum = 0;
            // run this twice to make sure the higher 16 bit are all zero
            tempSum = (tempSum & 0xFFFF) + (tempSum >> 16);
            tempSum = (tempSum & 0xFFFF) + (tempSum >> 16);
            // Select the lower 16 bits, reverse the bits of the result
            // and write it into the output
            checksumOut.write(~legup_bit_select(tempSum, 15, 0));
        } else {
            checksum = tempSum;
        }
    }
}

#define __CHECKSUM_CALC_H_
