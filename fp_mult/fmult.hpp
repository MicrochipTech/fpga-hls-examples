#ifndef __FMULT_HPP__
#define __FMULT_HPP__

#include "ap_fp.hpp"

#include <legup/streaming.hpp>
#include <legup/ap_int.hpp>

#include <string>
#include <iostream>

using legup::ap_uint;
using legup::ap_fp;
using legup::FIFO;

// Use template meta-programming to compute some constants in split_mult.  We
// do not want any hardware to be required to compute the constants. They can,
// in theory, be determined at compile time, so we use template
// meta-programming to force this computation to be done during compilation.
#include "leading_one.hpp"

// Use template meta-programming to compute the order in which to do the
// additions in split_mult.
#include "mergesort_for_split_mult.hpp"

// Performs multiplication of wide datatype in multiple steps.
// Returns the upper R_W bits of the result.
// Returns whether all lower bits not returned were all zero or not.
template <unsigned MULT_W_A, // Width of each multiplication split for ina.
          unsigned MULT_W_B, // Width of each multiplication split for inb.
          unsigned R_W,      // Width of the upper part of the result to return.
          unsigned D_W>      // Input data width.
ap_uint<R_W>
split_mult(ap_uint<D_W> ina, ap_uint<D_W> inb, bool &lower_bits_all_zero) {
    // NUM_SPLITS = ceiling(D_W / MULT_W)
    static const unsigned NUM_SPLITS_A =
        D_W % MULT_W_A ? D_W / MULT_W_A + 1 : D_W / MULT_W_A;
    static const unsigned NUM_SPLITS_B =
        D_W % MULT_W_B ? D_W / MULT_W_B + 1 : D_W / MULT_W_B;

    static const unsigned MIN_NUM_SPLITS =
        NUM_SPLITS_A < NUM_SPLITS_B ? NUM_SPLITS_A : NUM_SPLITS_B;
    // Position of leading one in MIN_NUM_SPLITS.
    static const unsigned LEADING_ONE =
        leading_one<MIN_NUM_SPLITS>::value;
    // Whether MIN_NUM_SPLITS is power of 2.
    static const bool POW_OF_2 =
        MIN_NUM_SPLITS == 1
            ? true
            : leading_one<MIN_NUM_SPLITS - 1>::value <
                  LEADING_ONE;
    // Product width.
    static const unsigned PROD_W = MULT_W_A + MULT_W_B;
    // Accumulator (acc) width.
    // acc is used to add up to MIN_NUM_SPLITS numbers of PROD_W width. For acc
    // to be wide enough, ACC_W should be PROD_W + ceiling(log(MIN_NUM_SPLITS))
    // where the log is in base 2. LEADING_ONE holds
    // floor(log(MIN_NUM_SPLITS)), so we add 1 if MIN_NUM_SPLITS is not a power
    // of 2. We have an additional + 1 because acc does not necessarily start
    // at 0 for each series of additions.
    static const unsigned ACC_W = PROD_W + LEADING_ONE + (POW_OF_2 ? 1 : 2);
    // Width of the highest split (MSBs)
    static const unsigned HIGH_W_A = D_W - MULT_W_A * (NUM_SPLITS_A - 1);
    static const unsigned HIGH_W_B = D_W - MULT_W_B * (NUM_SPLITS_B - 1);
    // Lowest bit in the full result that we care about.
    static const unsigned LOW_RES_BIT = D_W * 2 - R_W;
    ap_uint<R_W> output = 0;
    ap_uint<MULT_W_A> split_a[NUM_SPLITS_A > 1 ? NUM_SPLITS_A - 1 : 0];
    ap_uint<MULT_W_B> split_b[NUM_SPLITS_B > 1 ? NUM_SPLITS_B - 1 : 0];
    ap_uint<HIGH_W_A> high_split_a;
    ap_uint<HIGH_W_B> high_split_b;

#pragma unroll
    for (unsigned i = 0; i + 1 < NUM_SPLITS_A; ++i) {
        split_a[i] = ina((i + 1) * MULT_W_A - 1, i * MULT_W_A);
    }
    high_split_a = ina(D_W - 1, D_W - HIGH_W_A);
#pragma unroll
    for (unsigned i = 0; i + 1 < NUM_SPLITS_B; ++i) {
        split_b[i] = inb((i + 1) * MULT_W_B - 1, i * MULT_W_B);
    }
    high_split_b = inb(D_W - 1, D_W - HIGH_W_B);

    ap_uint<ACC_W> acc(0); // Accumulator.

    // We multiply every pair of numbers from split_a and split_b. When
    // multiplying numbers  at indices i, j, the result would need to be
    // shifted left by i * MULT_W_A + j * MULT_W_B to be at the right position
    // in the final result. We compute the results and add them all to get the
    // final result.  In order to keep the addition widths small, we start
    // accumulating results at the lower bits in order to consider the carries
    // and bits for rounding, and move the accumulator up the result. Once the
    // accumulator reaches the upper bits that we need to return, we store the
    // result bits in ouput.

    // Because the two mult widths can be anything, there is no nice order to
    // perform the multiplication and additions in. We use template
    // metaprogramming to determine this order.

    // The following line sets index_list to a template metaprogramming
    // representation of a linked list of all pairs of indices (i, j).
    typedef typename create_list<0, 0, NUM_SPLITS_A - 1, NUM_SPLITS_B - 1>::node
        index_list;
    // The following line orders index_list in increasing order of
    // i * MULT_W_A + j * MULT_W_B, and sets the resultant list to the_order.
    typedef typename mergesort<NUM_SPLITS_A * NUM_SPLITS_B, index_list,
                               MULT_W_A, MULT_W_B>::sorted the_order;
    // Two arrays that represent the pairs (i, j) in sorted order.
    unsigned every_i[NUM_SPLITS_A * NUM_SPLITS_B];
    unsigned every_j[NUM_SPLITS_A * NUM_SPLITS_B];
    // Populate the arrays from the_order.
    the_order::get_every_i(every_i);
    the_order::get_every_j(every_j);

    unsigned prev_i = every_i[0];
    unsigned prev_j = every_j[0];
    if (prev_i == NUM_SPLITS_A-1 && prev_j == NUM_SPLITS_B-1)
        acc += high_split_a * high_split_b;
    else if (prev_i == NUM_SPLITS_A - 1)
        acc += high_split_a * split_b[prev_j];
    else if (prev_j == NUM_SPLITS_B - 1)
        acc += high_split_b * split_a[prev_i];
    else
        acc += split_a[prev_i] * split_b[prev_j];
    lower_bits_all_zero = true;
#pragma unroll
    for (unsigned n = 1; n < NUM_SPLITS_A * NUM_SPLITS_B; ++n) {
        // prev_i and prev_j are the (i, j) from the previous multiplication.
        unsigned i = every_i[n];
        unsigned j = every_j[n];
        // Where the lowest bit of acc currently corresponds to in the final
        // result.
        unsigned lo = prev_i * MULT_W_A + prev_j * MULT_W_B;
        // How much to shift by before adding the multiplication for the current
        // (i, j).
        unsigned shift = i * MULT_W_A + j * MULT_W_B - lo;
        if (shift > 0) {
            // Where the highest bit that will be shifted away corresponds to in
            // the final result.
            unsigned hi = lo + shift - 1;
            if (hi >= LOW_RES_BIT)
                output(hi - LOW_RES_BIT,
                       lo > LOW_RES_BIT ? lo - LOW_RES_BIT : 0) =
                    acc(hi - lo, lo > LOW_RES_BIT ? 0 : LOW_RES_BIT - lo);
            if (lo < LOW_RES_BIT) // Some lower bits of acc are not part of the
                                  // result.
                lower_bits_all_zero &=
                    !acc(LOW_RES_BIT - lo > shift ? shift - 1
                                                  : LOW_RES_BIT - lo - 1,
                         0);
            acc = acc >> shift;
        }
        prev_i = i;
        prev_j = j;
        if (i == NUM_SPLITS_A-1 && j == NUM_SPLITS_B-1)
            acc += high_split_a * high_split_b;
        else if (i == NUM_SPLITS_A - 1)
            acc += high_split_a * split_b[j];
        else if (j == NUM_SPLITS_B - 1)
            acc += high_split_b * split_a[i];
        else
            acc += split_a[i] * split_b[j];
    }

    unsigned i = every_i[NUM_SPLITS_A * NUM_SPLITS_B - 1];
    unsigned j = every_j[NUM_SPLITS_A * NUM_SPLITS_B - 1];
    unsigned lo = i * MULT_W_A + j * MULT_W_B;
    static const unsigned hi = D_W * 2 - 1;
    if (hi >= lo) {
        if (hi >= LOW_RES_BIT)
            output(hi - LOW_RES_BIT, lo > LOW_RES_BIT ? lo - LOW_RES_BIT : 0) =
                acc(hi - lo, lo > LOW_RES_BIT ? 0 : LOW_RES_BIT - lo);
        if (lo <
            LOW_RES_BIT) // Some lower bits of acc are not part of the result.
            lower_bits_all_zero &=
                !acc(LOW_RES_BIT - lo > PROD_W ? PROD_W - 1
                                               : LOW_RES_BIT - lo - 1,
                     0);
    }

    return output;
}

template <unsigned MULT_W_A, // The width to split the first input for
                             // multiplications into.
          unsigned MULT_W_B, // The width to split the second input for
                             // multiplications into.
          unsigned M_W,      // Mantissa width
          unsigned E_W>      // Exponent width
ap_fp<M_W, E_W>
fmult(ap_fp<M_W, E_W> A, ap_fp<M_W, E_W> B) {
    // Exponent bias is always 2^(E_W-1) - 1
    static const ap_uint<E_W - 1> E_BIAS = ap_uint<E_W - 1>(0) - 1;
    static const unsigned W = M_W + E_W + 1;

    // Get mantissa and implicit 1 from input A and input B, plus a MSB 0 for
    // carry.
    ap_uint<M_W + 2> A_M = (ap_uint<2>(1), (A.mantissa()));
    ap_uint<M_W + 2> B_M = (ap_uint<2>(1), (B.mantissa()));

    // For proper rounding must know if bits below rounding bit are all zero
    bool lower_rounding_bits_are_zero;
    ap_uint<M_W + 5> res = split_mult<MULT_W_A, MULT_W_B, M_W + 5>(
        A_M, B_M, lower_rounding_bits_are_zero);

    // Since we know the upper two bits of A_M and B_M are 01, we know that the
    // leading one of res is at either 2*M_W+1 or 2*M_W. If it is at 2*M_W+1 we
    // have to "shift right" the result.

    // The last discarded bit, depending on if we need to shift right or not.
    ap_uint<1> no_shift_rounding_bit = res[0];
    ap_uint<1> shift_rounding_bit = res[1];

    // Now normalize to output mantissa.
    bool shift_right = res[M_W + 2];

    if (shift_right)
        lower_rounding_bits_are_zero =
            lower_rounding_bits_are_zero && no_shift_rounding_bit == 0;

    ap_uint<M_W + 1> O_M = shift_right ? res(M_W + 1, 2) : res(M_W, 1);

    // The special rounding case is when the bits below the rounding bits are
    // all zero and when the LSB of the result is 0. If either condition is not
    // met, we round normally. In the special case, no change to O_M is needed
    if (!lower_rounding_bits_are_zero || O_M[0] == 1)
        // O_M += (shift_right ? shift_rounding_bit : no_shift_rounding_bit);
        O_M += (shift_right ? ap_uint<1>(shift_rounding_bit)
                            : ap_uint<1>(no_shift_rounding_bit));

    // Adding the rounding bit can carry and overflow the mantissa.
    // If overflow happens, all mantissa bits will be 0.
    bool rounding_overflow = O_M[M_W];

    ap_uint<2> incr_E((shift_right ? 1 : 0) + (rounding_overflow ? 1 : 0));

    // Compute sign.
    ap_uint<1> O_S = A.sign() ^ B.sign();

    // Compute exponent.
    ap_uint<E_W + 1> A_E = A.exp();
    ap_uint<E_W + 1> B_E = B.exp();
    ap_uint<E_W + 1> O_E = A_E + B_E + incr_E;
    bool O_E_underflow = O_E < E_BIAS;
    O_E -= E_BIAS;

    // Now take care of special cases.
    static const ap_uint<E_W> E_all_ones = ~ap_uint<E_W>(0);
    bool A_E_all_ones = A_E == E_all_ones;
    bool B_E_all_ones = B_E == E_all_ones;
    bool A_M_zero = !A.mantissa();
    bool B_M_zero = !B.mantissa();
    bool O_E_overflow = !O_E_underflow && (O_E(E_W, E_W) || O_E == E_all_ones);
    bool zero = (!A_E && A_M_zero) || (!B_E && B_M_zero);

    // Either infinity or NaN.
    bool exception = A_E_all_ones || B_E_all_ones || (O_E_overflow && !zero);
    bool got_nan = (A_E_all_ones && !A_M_zero) || (B_E_all_ones && !B_M_zero) ||
                   (exception && zero); // 0 * inf = nan.

    ap_uint<E_W> OO_E =
        exception ? E_all_ones : zero || O_E_underflow
                                     ? ap_uint<E_W>(0)
                                     : ap_uint<E_W>(O_E(E_W - 1, 0));
    ap_uint<M_W> OO_M = exception
                            ? ap_uint<M_W + 1>(got_nan ? 1 : 0)
                            : zero || O_E_underflow ? ap_uint<M_W + 1>(0) : O_M;

    ap_uint<W> O_bits = (O_S, OO_E, OO_M);

    return ap_fp<M_W, E_W>(O_bits);
}

template <unsigned MULT_W_A, unsigned MULT_W_B>
void fmult_64_wrapper(FIFO<uint64> &input_a_fifo,
                      FIFO<uint64> &input_b_fifo,
                      FIFO<uint64> &output_fifo) {
#pragma LEGUP function pipeline
    ap_fp<D_M_W, D_E_W> in_a =
        ap_fp<D_M_W, D_E_W>(ap_uint<64>(input_a_fifo.read()));
    ap_fp<D_M_W, D_E_W> in_b =
        ap_fp<D_M_W, D_E_W>(ap_uint<64>(input_b_fifo.read()));
    ap_fp<D_M_W, D_E_W> out = fmult<MULT_W_A, MULT_W_B>(in_a, in_b);
    output_fifo.write(out.data().to_uint64());
}

template <unsigned MULT_W_A, unsigned MULT_W_B>
void fmult_32_wrapper(FIFO<uint32> &input_a_fifo,
                      FIFO<uint32> &input_b_fifo,
                      FIFO<uint32> &output_fifo) {
#pragma LEGUP function pipeline
    ap_fp<F_M_W, F_E_W> in_a =
        ap_fp<F_M_W, F_E_W>(ap_uint<32>(input_a_fifo.read()));
    ap_fp<F_M_W, F_E_W> in_b =
        ap_fp<F_M_W, F_E_W>(ap_uint<32>(input_b_fifo.read()));
    ap_fp<F_M_W, F_E_W> out = fmult<MULT_W_A, MULT_W_B>(in_a, in_b);
    output_fifo.write(out.data().to_uint64());
}

template <unsigned MULT_W_A, unsigned MULT_W_B>
void fmult_16_wrapper(FIFO<ap_uint<16>> &input_a_fifo,
                      FIFO<ap_uint<16>> &input_b_fifo,
                      FIFO<ap_uint<16>> &output_fifo) {
#pragma LEGUP function pipeline
    ap_fp<H_M_W, H_E_W> in_a = ap_fp<H_M_W, H_E_W>(input_a_fifo.read());
    ap_fp<H_M_W, H_E_W> in_b = ap_fp<H_M_W, H_E_W>(input_b_fifo.read());
    ap_fp<H_M_W, H_E_W> out = fmult<MULT_W_A, MULT_W_B>(in_a, in_b);
    output_fifo.write(out.data());
}

#endif
