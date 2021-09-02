#define __CHECKSUM_CALC_H_

#include "utils.hpp"

#include <hls/ap_int.hpp>
#include <hls/streaming.hpp>

using hls::ap_uint;

void checksumCalculation(hls::FIFO<AxiWord> &dataIn,
                         hls::FIFO<ap_uint<16>> &checksumOut) {

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
    static ap_uint<32> checksum = 0;

    if (!dataIn.empty()) {
        AxiWord inputWord = dataIn.read();
        ap_uint<64> data = inputWord.data & Keep2Mask(inputWord.keep);

        ap_uint<32> tempSum = checksum;
        tempSum += data(63, 48) + data(47, 32) + data(31, 16) + data(15, 0);

        if (inputWord.last) {
            checksum = 0;
            // run this twice to make sure the higher 16 bit are all zero
            tempSum = (tempSum & 0xFFFF) + (tempSum >> 16);
            tempSum = (tempSum & 0xFFFF) + (tempSum >> 16);
            // Select the lower 16 bits, reverse the bits of the result
            // and write it into the output
            checksumOut.write(~tempSum(15, 0));
        } else {
            checksum = tempSum;
        }
    }
}

#define __CHECKSUM_CALC_H_
