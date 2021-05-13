#include "fmult.hpp"
#include "half.hpp"

#include <legup/streaming.hpp>
#include <legup/types.h>

#include <iostream>
#include <limits>
#include <math.h>
#include <string>

#define StrT const char *

using half_float::half;

// Parse bits from float, double, or half.
struct FloatBits {
    ap_uint<1> S;
    ap_uint<8> E;
    ap_uint<23> M;
};

struct DoubleBits {
    ap_uint<1> S;
    ap_uint<11> E;
    ap_uint<52> M;
};

struct HalfBits {
    ap_uint<1> S;
    ap_uint<5> E;
    ap_uint<11> M;
};

ap_uint<32> ToBits(float in) { return ap_uint<32>(*(uint32 *)(&in)); }
ap_uint<64> ToBits(double in) { return ap_uint<32>(*(uint64 *)(&in)); }
ap_uint<16> ToBits(half in) { return ap_uint<16>(*(uint16 *)(&in)); }

FloatBits ParseBits(float in) {
    ap_uint<32> bits = ToBits(in);
    return FloatBits({bits[31], bits(30, 23), bits(22, 0)});
}

DoubleBits ParseBits(double in) {
    ap_uint<64> bits = ToBits(in);
    return DoubleBits({bits[63], bits(62, 52), bits(51, 0)});
}

HalfBits ParseBits(half in) {
    ap_uint<16> bits = ToBits(in);
    return HalfBits({bits[15], bits(14, 10), bits(9, 0)});
}

template <typename FType> void print_value_and_bits(StrT var_name, FType in) {
  auto B = ParseBits(in);
  printf("%s: %f,\tExponent: %lld\tMatissa: %lld\n", var_name, in,
         B.E.to_uint64(), B.M.to_uint64());
}

template <> void print_value_and_bits<half>(StrT var_name, half in) {
  auto B = ParseBits(in);
  printf("%s: %f,\tExponent: %lld\tMatissa: %lld\n", var_name, float(in),
         B.E.to_uint64(), B.M.to_uint64());
}

// Compares output.

bool isDenormal(float in) {
    ap_uint<32> ap_in(*(uint32 *)&in);
    return !ap_in(30, 23);
}

bool isDenormal(double in) {
    ap_uint<64> ap_in(*(uint64 *)&in);
    return !ap_in(62, 52);
}

bool isDenormal(half in) {
    ap_uint<16> ap_in(*(short *)&in);
    return !ap_in(14, 10);
}

// assumes that expect is a denormalized number
template <unsigned M_W, unsigned W>
bool denormalMatches(ap_uint<W> expect, ap_uint<W> actual) {
    return expect(W - 1, M_W) == actual(W - 1, M_W) && expect[M_W - 1] &&
           expect(M_W - 2, 0) == actual(M_W - 1, 1);
}

bool isDenormalAndMatches(float expect, float actual) {
    return isDenormal(expect) &&
           denormalMatches<23>(ap_uint<32>(*(uint32 *)&expect),
                               ap_uint<32>(*(uint32 *)&actual));
}

bool isDenormalAndMatches(double expect, double actual) {
    return isDenormal(expect) &&
           denormalMatches<52>(ap_uint<64>(*(uint64 *)&expect),
                               ap_uint<64>(*(uint64 *)&actual));
}

bool isDenormalAndMatches(half expect, half actual) {
    return isDenormal(expect) &&
           denormalMatches<10>(ap_uint<16>(*(uint16 *)&expect),
                               ap_uint<16>(*(uint16 *)&actual));
}

bool isSmallDenormal(float in) {
    return isDenormal(in) && !(*(uint32 *)&in & 1 << 22);
}

bool isSmallDenormal(double in) {
    return isDenormal(in) && !(*(uint64 *)&in & (uint64)1 << 51);
}

bool isSmallDenormal(half in) {
    return isDenormal(in) && !(*(uint16 *)&in & 1 << 9);
}

unsigned match_count = 0;
unsigned error_count = 0;

template <typename FType> StrT fut_name();
template <> StrT fut_name<float>() { return "fmult_32"; }
template <> StrT fut_name<double>() { return "fmult_64"; }
template <> StrT fut_name<half>() { return "fmult_16"; }

template <typename FType> bool isNaN(FType f) { return f != f; }

template <typename FType> void check(FType ina, FType inb, FType actual) {
    FType expect = ina * inb;

    bool match = (expect == actual) ||
                 // We must also check if the result is nan.
                 (isNaN(expect) && isNaN(actual)) ||
                 // The core does not handle denormalized numbers.
                 isDenormal(ina) || isDenormal(inb) ||
                 // We also match if the result is denormalized and expect's
                 // mantissa is the same as actual's but shifted right and with
                 // a leading 1 in front.
                 isDenormalAndMatches(expect, actual) ||
                 // We also match if the result is denormalized but small enough
                 // that the core should return zero, and actual is 0.
                 (isSmallDenormal(expect) && actual == 0);

    error_count += (!match);
    match_count += match;

    if (!match) {
      printf("### %s\tResult %s.###\n", fut_name<FType>(),
             (match ? "match" : "mismatch"));
      print_value_and_bits("ina", ina);
      print_value_and_bits("inb", inb);
      print_value_and_bits("expect", expect);
      print_value_and_bits("actual", actual);
      printf("#######\n");
    }
}

// CoSim does not support float return type or argument.
// custom_top instantiates all eight cores together.
// We target DSP that can do 17x17 unsigned multiplication (PolarFire).
void custom_top(legup::FIFO<ap_uint<16>> &half_ina,
                legup::FIFO<ap_uint<16>> &half_inb,
                legup::FIFO<ap_uint<16>> &half_out,
                legup::FIFO<uint64> &double_ina,
                legup::FIFO<uint64> &double_inb,
                legup::FIFO<uint64> &double_out, legup::FIFO<uint32> &float_ina,
                legup::FIFO<uint32> &float_inb,
                legup::FIFO<uint32> &float_out) {
#pragma LEGUP function top
    fmult_16_wrapper<17, 17>(half_ina, half_inb, half_out);
    fmult_32_wrapper<17, 17>(float_ina, float_inb, float_out);
    fmult_64_wrapper<17, 17>(double_ina, double_inb, double_out);
}

void run_test(double a, double b, legup::FIFO<ap_uint<16>> &half_ina,
              legup::FIFO<ap_uint<16>> &half_inb,
              legup::FIFO<ap_uint<16>> &half_out,
              legup::FIFO<uint64> &double_ina, legup::FIFO<uint64> &double_inb,
              legup::FIFO<uint64> &double_out, legup::FIFO<uint32> &float_ina,
              legup::FIFO<uint32> &float_inb, legup::FIFO<uint32> &float_out) {

    // Inject input.
    half h_a(a), h_b(b);
    ap_uint<16> h_a_16(*(short *)&h_a);
    ap_uint<16> h_b_16(*(short *)&h_b);
    half_ina.write(h_a_16);
    half_inb.write(h_b_16);

    double_ina.write(*(uint64 *)(&a));
    double_inb.write(*(uint64 *)(&b));

    float f_a = a, f_b = b;
    float_ina.write(*(uint32 *)(&f_a));
    float_inb.write(*(uint32 *)(&f_b));

    // Call custom top.
    custom_top(half_ina, half_inb, half_out, double_ina, double_inb, double_out,
               float_ina, float_inb, float_out);

    // Check output.
    short out_16 = half_out.read().to_uint64();
    uint64 out_64 = double_out.read();
    uint32 out_32 = float_out.read();

    check(h_a, h_b, *(half *)(&out_16));
    check(a, b, *(double *)(&out_64));
    check(f_a, f_b, *(float *)(&out_32));
}

int main() {

    legup::FIFO<ap_uint<16>> half_ina(2);
    legup::FIFO<ap_uint<16>> half_inb(2);
    legup::FIFO<ap_uint<16>> half_out(2);
    legup::FIFO<uint64> double_ina(2);
    legup::FIFO<uint64> double_inb(2);
    legup::FIFO<uint64> double_out(2);
    legup::FIFO<uint32> float_ina(2);
    legup::FIFO<uint32> float_inb(2);
    legup::FIFO<uint32> float_out(2);

    double neg_nan = -0.0 / 0.0;
    double pos_nan = +0.0 / 0.0;
    double neg_inf = -1.0 / 0.0;
    double pos_inf = 1.0 / 0.0;
    double pos_overflow = 1e12;
    double pos_underflow = 1e-12;
    double neg_overflow = -1e12;
    double neg_underflow = -1e-12;

#define NUM_INPUTS 100
    double input_vector_sp[NUM_INPUTS] = {
        0x0.1p-125,
        0x1.0000000000003p0,
        3,
        0.5,
        12314,
        0.03,
        -0.03,
        12312379.712312,
        -12312379.712312,
        0.511111,
        -0.511111,
        1.7593875914735917e19,
        -1.7593875914735917e19,
        75938.75,
        .759387,
        9800.49999,
        -9800.49999,
        23.50,
        123.5,
        8231.0001,
        7123.50001,
        -7123.50001,
        0.0001,
        -0.0001,
        1.0,
        0.51,
        -0.99999,
        0.49,
        12381e10,
        -12.381e10,
        neg_nan,
        pos_nan,
        neg_inf,
        pos_inf,
        pos_overflow,
        pos_underflow,
        neg_overflow,
        neg_underflow,
        // // Does not support denormalized number.
        // std::numeric_limits<float>::min(),
        // std::numeric_limits<double>::min(),
        std::numeric_limits<float>::max(),
        std::numeric_limits<double>::max(),
        double(std::numeric_limits<int long long>::min()),
        double(std::numeric_limits<int long long>::max()),
        double(std::numeric_limits<unsigned long long>::min()),
        double(std::numeric_limits<unsigned long long>::max()),
        double(std::numeric_limits<int long long>::min()) * 2,
        double(std::numeric_limits<int long long>::max()) * 2,
        double(std::numeric_limits<unsigned long long>::min()) * 2,
        double(std::numeric_limits<unsigned long long>::max()) * 2,
        0};

    for (int i = 0; i < 50; i++)
        for (int j = 0; j < 50; j++)
            run_test(input_vector_sp[i], input_vector_sp[j], // Input A, B.
                     half_ina, half_inb, half_out,           // Half FIFOs.
                     double_ina, double_inb, double_out,     // Double FIFOs.
                     float_ina, float_inb, float_out         // Float FIFOs.
                     );

    if (error_count == 0)
        printf("PASS!\n");
    else
        printf("FAIL.\n");

    printf("match_count = %d, error_count = %d\n", match_count, error_count);

    return error_count;
}
