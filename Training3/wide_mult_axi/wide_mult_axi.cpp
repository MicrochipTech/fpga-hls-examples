#include "axi4_target.h"
#include <hls/ap_fixpt.hpp>
#include <hls/ap_int.hpp>
#include <hls/axi_interface.hpp>
#include <iostream>

using namespace hls;

// The calculation is dout = A + B + (C*D) + 0.5*(C*C*E) = A + B + C * (D + 0.5*(C*E))
// B, C is 64-bit width, A, D, E is 128-bit width.
// A, C, D, E  are signed signals while B is unsigned.
// For A, D, E (128-bit), there are 64 fractional bits, 63 integer bits and 1 sign bit.
// For B and C,  there are no fractional bits. C has 63 integer bits and 1 sign bit.
// The output of module is 256-bits to handle overflow at each stage.
// This design has a requirement to run at 156.25 MHz

// global variable for AXI4-Lite target
#pragma HLS interface variable(data) type(axi_slave) concurrent_access(true)
TargetLayout data;

ap_fixpt<256, 192> wide_mult(ap_fixpt<128, 64> A, ap_uint<64> B, ap_int<64> C,
                             ap_fixpt<128, 64> D, ap_fixpt<128, 64> E) {
#pragma HLS function noinline
    // implements A + B + C * (D + 0.5 * (C * E));

    ap_fixpt<192, 128> m, n, o;
    ap_fixpt<256, 192> p, q;

    m = C * E;
    n = m.ashr(1);
    o = D + n;
    p = C * o;
    q = A + p;
    return B + q;
}

void wide_mult_axi(AxiInterface<ap_uint<32>, ap_uint<32>, ap_uint<4>> &initiator) {
#pragma HLS function top
    // implements A + B + C * (D + 0.5 * (C * E));

    ap_fixpt<128, 64> A, D, E;
    ap_uint<64> B;
    ap_int<64> C;

    ap_fixpt<256, 192> r;

    if (data.run == 0) // idle
        return;

    if (data.run == 1) { // single
        A(31, 0) = data.A0;
        A(63, 32) = data.A1;
        A(95, 64) = data.A2;
        A(127, 96) = data.A3;
        B(31, 0) = data.B0;
        B(63, 32) = data.B1;
        C(31, 0) = data.C0;
        C(63, 32) = data.C1;
        D(31, 0) = data.D0;
        D(63, 32) = data.D1;
        D(95, 64) = data.D2;
        D(127, 96) = data.D3;
        E(31, 0) = data.E0;
        E(63, 32) = data.E1;
        E(95, 64) = data.E2;
        E(127, 96) = data.E3;

        r = wide_mult(A, B, C, D, E);

        data.result0 = r(31, 0);
        data.result1 = r(63, 32);
        data.result2 = r(95, 64);
        data.result3 = r(127, 96);
        data.result4 = r(159, 128);
        data.result5 = r(191, 160);
        data.result6 = r(223, 192);
        data.result7 = r(255, 224);

        data.run = 0;

    } else { // burst
        // get data from DDR
        const uint32_t BURST_SIZE = data.run;
        const uint32_t NUM_INPUT_WORDS = 16;
        const uint32_t NUM_OUTPUT_WORDS = 8;
        const uint32_t WORD_SIZE = 4;
        ap_uint<32> addr = data.base_addr;

        ap_uint<2> bresp;
        ap_uint<2> error = 0;

        for (uint32_t i = 0; i < BURST_SIZE; i++) {
            axi_m_read_req<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, addr, ap_uint<9>(NUM_INPUT_WORDS));
            addr += NUM_INPUT_WORDS * WORD_SIZE;

            A(31, 0) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            A(63, 32) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            A(95, 64) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            A(127, 96) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            B(31, 0) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            B(63, 32) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            C(31, 0) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            C(63, 32) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            D(31, 0) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            D(63, 32) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            D(95, 64) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            D(127, 96) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            E(31, 0) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            E(63, 32) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            E(95, 64) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);
            E(127, 96) = axi_m_read_data<ap_uint<32>, ap_uint<32>>(initiator);

            r = wide_mult(A, B, C, D, E);

            axi_m_write_req<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, addr, ap_uint<9>(NUM_OUTPUT_WORDS));
            addr += NUM_OUTPUT_WORDS * WORD_SIZE;

            axi_m_write_data<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, ap_uint<32>(r(31, 0)), ap_uint<4>(0xF), /*is_last=*/0);
            axi_m_write_data<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, ap_uint<32>(r(63, 32)), ap_uint<4>(0xF), /*is_last=*/0);
            axi_m_write_data<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, ap_uint<32>(r(95, 64)), ap_uint<4>(0xF), /*is_last=*/0);
            axi_m_write_data<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, ap_uint<32>(r(127, 96)), ap_uint<4>(0xF), /*is_last=*/0);
            axi_m_write_data<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, ap_uint<32>(r(159, 128)), ap_uint<4>(0xF), /*is_last=*/0);
            axi_m_write_data<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, ap_uint<32>(r(191, 160)), ap_uint<4>(0xF), /*is_last=*/0);
            axi_m_write_data<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, ap_uint<32>(r(223, 192)), ap_uint<4>(0xF), /*is_last=*/0);
            axi_m_write_data<ap_uint<32>, ap_uint<32>, ap_uint<4>>(
                initiator, ap_uint<32>(r(255, 224)), ap_uint<4>(0xF), /*is_last=*/1);

            bresp = axi_m_write_resp(initiator);
            error |= bresp;
        }

        // Send aggregate response code back to MiV
        data.error = error;

        // Signal accelerator finished
        data.run = 0;

    }
}

void prepare_axi_read(AxiInterface<ap_uint<32>, ap_uint<32>, ap_uint<4>> &axi_if,
                      ap_uint<32> input, int last = 0) {

    RdDataSignals<ap_uint<32>> r_sig;
    r_sig.data = input;
    r_sig.resp = 0;
    r_sig.last = last;
    axi_if.r.write(r_sig);

}

int main() {

    // input test vectors
    const int NUM_INPUTS = 47;

    //reg signed [127:0]astim[47]= '{128'b010, 128'b011, 128'b100, 128'b101, 128'd10, 128'd100, 128'd33, 128'd1024, 128'd100000,
    //                               128'd1000000, 128'b011, 128'd1000000000, 128'd999999999999,128'h0100000000000000000000000000000,
    //                               128'd5000000000, 128'd123456789, 128'd7777, 128'd9876543210, 128'd9876543210, 128'd9876543210, 128'd9876543210,
    //                               128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,
    //                               128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,
    //                               128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,
    //                               128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,
    //                               128'd9876543210, 128'd9876543210};
    ap_fixpt<128, 64> A[NUM_INPUTS] = {"0x2", "0x3", "0x4", "0x5", "0xA", "0x64", "0x21", "0x400", "0x186A0",
            "0xF4240", "0x3", "0x3B9ACA00", "0xE8D4A50FFF", "0x0100000000000000000000000000000",
            "0x12A05F200", "0x75BCD15", "0x1E61", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA"};

    //reg signed [63:0] bstim[47] = '{64'b010, 64'b011, 64'b100, 64'b101,64'd20,64'd200,64'd555,64'd2048,64'd555555, 64'd5555555, 64'b011, 
    //                                64'd1000000000,64'd999999999999,64'h0100000000000000,64'd5000000000, 64'd123456789, 
    //                                64'd8888,64'd9876543210,64'd9876543210, 64'd9876543210,64'd9876543210, 64'd9876543210,64'd9876543210,
    //                                64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,
    //                                64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,
    //                                64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,
    //                                64'd9876543210,64'd9876543210,64'd9876543210};

    ap_uint<64> B[NUM_INPUTS] = {"0x2", "0x3", "0x4", "0x5", "0x14", "0xC8", "0x22B",
            "0x800", "0x87A23", "0x54C563", "0x3", "0x3B9ACA00", "0xE8D4A50FFF",
            "0x0100000000000000", "0x12A05F200", "0x75BCD15",
            "0x22B8", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA"};

    // reg signed [63:0]cstim[47] = '{64'b010, 64'b011, 64'b100, 64'b101,64'd30,64'd300,64'd11,64'd4096, 64'd1444000,64'd14440000,
    //                                 64'b011, 64'd1000000000,64'd999999999999, 64'h0100000000000000, 64'd5000000000, 64'd123456789,
    //                                 64'd9999, 64'd9876543210, 64'hb4, 64'h1, 64'h8000000000000000,64'h8000000000000000,64'h8000000000000000,
    //                                 64'h9000000000000000, 64'hA000000000000000,64'hB000000000000000, 64'hC000000000000000, 64'hD000000000000000,
    //                                 64'hE000000000000000,64'hF000000000000000,64'h0000000000000001,64'h7FFFFFFFFFFFFFFF,64'h100000000000000,
    //                                 64'h200000000000000, 64'h300000000000000,64'h400000000000000,64'h500000000000000, 64'h600000000000000,
    //                                 64'h700000000000000, 64'h1123456780000000,64'h2123456780000000,64'h3123456780000000, 64'h4123456780000000,
    //                                 64'h5123456780000000,64'h6123456780000000,64'h7123456780000000,64'hFFFFFFFFFFFFFFFE };
    ap_int<64> C[NUM_INPUTS] = {"0x2", "0x3", "0x4", "0x5", "0x1E", "0x12C", "0xB", "0x1000", "0x1608A0", "0xDC5640", 
            "0x3", "0x3B9ACA00", "0xE8D4A50FFF", "0x0100000000000000", "0x12A05F200", "0x75BCD15",
            "0x270F", "0x24CB016EA", "0xb4", "0x1", "0x8000000000000000","0x8000000000000000","0x8000000000000000",
            "0x9000000000000000", "0xA000000000000000","0xB000000000000000", "0xC000000000000000", "0xD000000000000000",
            "0xE000000000000000","0xF000000000000000","0x0000000000000001","0x7FFFFFFFFFFFFFFF","0x100000000000000",
            "0x200000000000000", "0x300000000000000","0x400000000000000","0x500000000000000", "0x600000000000000",
            "0x700000000000000", "0x1123456780000000","0x2123456780000000","0x3123456780000000", "0x4123456780000000",
            "0x5123456780000000","0x6123456780000000","0x7123456780000000","0xFFFFFFFFFFFFFFFE" };

    // reg signed [127:0] dstim[47] = '{128'b010, 128'b011, 128'b100, 128'b101,128'd40,128'd400,128'd1248,128'd8182,128'd10, 128'd100, 128'b011, 
    //                                 128'd1000000000,128'd999999999999,128'h0100000000000000,128'd5000000000, 128'd123456789, 
    //                                 128'd8888,128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210,
    //                                 128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,
    //                                 128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,
    //                                 128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,
    //                                 128'd9876543210,128'd9876543210,128'd9876543210};
    ap_fixpt<128, 64> D[NUM_INPUTS] = {"0x2", "0x3", "0x4", "0x5", "0x28", "0x190", "0x4E0", "0x1FF6", "0xA", "0x64", "0x3",
            "0x3B9ACA00", "0xE8D4A50FFF", "0x0100000000000000", "0x12A05F200", "0x75BCD15",
            "0x22B8", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA", "0x24CB016EA", "0x24CB016EA",
            "0x24CB016EA", "0x24CB016EA"};

    // reg signed [127:0] estim[47] = '{128'b010, 128'b011,128'b100,128'b101,128'd50,128'd500,128'd4096,128'd16384,128'd100000888,128'd1000008888,
    //                                  128'b011,128'd1000000000,128'd999999999999,128'h0100000000000000000000000000000,128'd5000000000,128'd123456789,
    //                                  128'd7777,128'd9876543210,128'h8000000000000000,128'h80000000000000008000000000000000,128'h00000000000000000000000000000001,
    //                                  128'h80000000000000000000000000000000,128'h80000000000000000000000000000000,128'h90000000000000000000000000000000,
    //                                  128'hA0000000000000000000000000000000,128'hB0000000000000000000000000000000,128'hC0000000000000000000000000000000,
    //                                  128'hD0000000000000000000000000000000,128'hE0000000000000000000000000000000, 128'hF0000000000000000000000000000000,
    //                                  128'h80000000000000000000000000000000, 128'h7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,128'h1123456789ABCDEF0000000000000000,
    //                                  128'h2123456789ABCDEF0000000000000000,128'h3123456789ABCDEF0000000000000000,128'h4123456789ABCDEF0000000000000000,
    //                                  128'h5123456789ABCDEF0000000000000000,128'h6123456789ABCDEF0000000000000000,128'h7123456789ABCDEFFFFFFFFFFFFFFFFE, 
    //                                  128'h7123456789ABCDEFFFFFFFFFFFFFFFFE, 128'h7123456789ABCDEFFFFFFFFFFFFFFFFE,128'h7123456789ABCDEFFFFFFFFFFFFFFFFE, 
    //                                  128'h7123456789ABCDEFFFFFFFFFFFFFFFFE, 128'h7123456789ABCDEFFFFFFFFFFFFFFFFE,128'h7123456789ABCDEFFFFFFFFFFFFFFFFE, 
    //                                  128'h7123456789ABCDEFFFFFFFFFFFFFFFFE ,128'h7123456789ABCDEFFFFFFFFFFFFFFFFE};
    ap_fixpt<128, 64> E[NUM_INPUTS] = {"0x2", "0x3", "0x4", "0x5", "0x32", "0x1F4", "0x1000", "0x4000", "0x5F5E478", "0x3B9AECB8",
            "0x3", "0x3B9ACA00", "0xE8D4A50FFF", "0x0100000000000000000000000000000", "0x12A05F200", "0x75BCD15",
            "0x1E61", "0x24CB016EA", "0x8000000000000000","0x80000000000000008000000000000000","0x00000000000000000000000000000001",
            "0x80000000000000000000000000000000","0x80000000000000000000000000000000","0x90000000000000000000000000000000",
            "0xA0000000000000000000000000000000","0xB0000000000000000000000000000000","0xC0000000000000000000000000000000",
            "0xD0000000000000000000000000000000","0xE0000000000000000000000000000000", "0xF0000000000000000000000000000000",
            "0x80000000000000000000000000000000", "0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF","0x1123456789ABCDEF0000000000000000",
            "0x2123456789ABCDEF0000000000000000","0x3123456789ABCDEF0000000000000000","0x4123456789ABCDEF0000000000000000",
            "0x5123456789ABCDEF0000000000000000","0x6123456789ABCDEF0000000000000000","0x7123456789ABCDEFFFFFFFFFFFFFFFFE", 
            "0x7123456789ABCDEFFFFFFFFFFFFFFFFE", "0x7123456789ABCDEFFFFFFFFFFFFFFFFE","0x7123456789ABCDEFFFFFFFFFFFFFFFFE", 
            "0x7123456789ABCDEFFFFFFFFFFFFFFFFE", "0x7123456789ABCDEFFFFFFFFFFFFFFFFE","0x7123456789ABCDEFFFFFFFFFFFFFFFFE", 
            "0x7123456789ABCDEFFFFFFFFFFFFFFFFE ","0x7123456789ABCDEFFFFFFFFFFFFFFFFE"};


    // expected results from the modelsim testbench
    ap_fixpt<256, 192> expected_results[NUM_INPUTS] = {
            "0x000000000000000000000000000000000000000000000002000000000000000a",
            "0x0000000000000000000000000000000000000000000000030000000000000018",
            "0x0000000000000000000000000000000000000000000000040000000000000034",
            "0x000000000000000000000000000000000000000000000005000000000000005a",
            "0x0000000000000000000000000000000000000000000000140000000000005c9e",
            "0x0000000000000000000000000000000000000000000000c800000000015927c4",
            "0x00000000000000000000000000000000000000000000022b000000000003fdc1",
            "0x0000000000000000000000000000000000000000000008000000002001ff6400",
            "0x000000000000000000000000000000000000000000087a28a6ddd93bfed54ce0",
            "0x00000000000000000000000000000000000000000054db76d29b88e9d0eab340",
            "0x0000000000000000000000000000000000000000000000030000000000000018",
            "0x00000000000000000000000000000000000000003d38611e5dc8f6d256feca00",
            "0x0000000000000000000000000000000000604cd0128929a8cbbe69112f800000",
            "0x0000000800000000000000000000000001110000000000000000000000000000",
            "0x0000000000000000000000000000000000000001f3f8bbce5f59266b26c9f200",
            "0x0000000000000000000000000000000000000000075c944ff0eab6e81d2853da",
            "0x0000000000000000000000000000000000000000000022b80000005a89ed9e42",
            "0x0000000000000000000000000000000000000008612c923bd582e0ce1b2d4a02",
            "0x00000000000000000000000000000000000000024cb0368e000001a038803372",
            "0xffffffffffffffffffffffffffffffffc00000024cb016ea4000000499602dd4",
            "0x000000000000000000000000000000002000000126580b75000000024cb016ea",
            "0xf00000000000000000000000000000000000000126580b75000000024cb016ea",
            "0xf00000000000000000000000000000000000000126580b75000000024cb016ea",
            "0xf5480000000000000000000000000000000000014b230ce3a00000024cb016ea",
            "0xf9400000000000000000000000000000000000016fee0e52400000024cb016ea",
            "0xfc1800000000000000000000000000000000000194b90fc0e00000024cb016ea",
            "0xfe00000000000000000000000000000000000001b984112f800000024cb016ea",
            "0xff28000000000000000000000000000000000001de4f129e200000024cb016ea",
            "0xffc0000000000000000000000000000000000002031a140cc00000024cb016ea",
            "0xfff800000000000000000000000000000000000227e5157b600000024cb016ea",
            "0xffffffffffffffffffffffffffffffffc00000024cb016ea0000000499602dd4",
            "0x0fffffffffffffffc000000000000000200000037308225f4000000000000000",
            "0x00000891a2b3c4d5e6f7800000000000000000024efcc700ea0000024cb016ea",
            "0x000042468acf13579bde0000000000000000000251497717d40000024cb016ea",
            "0x0000dd1eb851eb851eb3800000000000000000025396272ebe0000024cb016ea",
            "0x0002091a2b3c4d5e6f780000000000000000000255e2d745a80000024cb016ea",
            "0x0003f638e38e38e38e2b80000000000000000002582f875c920000024cb016ea",
            "0x0006d47ae147ae147ace000000000000000000025a7c37737c0000024cb016ea",
            "0x000ad3e02468acf13577ffffffffffffffcf00025cc8e78a660000024cb016ea",
            "0x0040e679fe106ed0a36f4ca7afecbafdfeda4beea7faef43e35c559d4cb016ea",
            "0x00f2a6fe5ba17fe1b463c3d02fecbafdfbb5e341dcc5f0b2835c559d4cb016ea",
            "0x02158ac820bc3cc0b5583af8afecbafdf6917a951190f221235c559d4cb016ea",
            "0x03a991d74d60a56da64cb2212fecbafdef6d11e8465bf38fc35c559d4cb016ea",
            "0x05aebc2be18eb9e887412949afecbafde648a93b7b26f4fe635c559d4cb016ea",
            "0x082509c5dd467a315835a0722fecbafddb24408eaff1f66d035c559d4cb016ea",
            "0x0b0c7aa54087e648192a179aafecbafdcdffd7e1e4bcf7dba35c559d4cb016ea",
            "0x00000000000000000000000000000000e2468ad16007b2c9fffffffdb34fe912"};

    // Prepare for AXI initiator interface reads/writes
    const int NUM_READS_PER_INPUT = 16;
    const int NUM_WRITES_PER_INPUT = 8;
    const int WORD_SIZE = 4;

    AxiInterface<ap_uint<32>, ap_uint<32>, ap_uint<4>> axi_if(NUM_INPUTS * NUM_READS_PER_INPUT);

    for (int i = 0; i < NUM_INPUTS; i++) {
        prepare_axi_read(axi_if, A[i](31, 0));
        prepare_axi_read(axi_if, A[i](63, 32));
        prepare_axi_read(axi_if, A[i](95, 64));
        prepare_axi_read(axi_if, A[i](127, 96));
        prepare_axi_read(axi_if, B[i](31, 0));
        prepare_axi_read(axi_if, B[i](63, 32));
        prepare_axi_read(axi_if, C[i](31, 0));
        prepare_axi_read(axi_if, C[i](63, 32));
        prepare_axi_read(axi_if, D[i](31, 0));
        prepare_axi_read(axi_if, D[i](63, 32));
        prepare_axi_read(axi_if, D[i](95, 64));
        prepare_axi_read(axi_if, D[i](127, 96));
        prepare_axi_read(axi_if, E[i](31, 0));
        prepare_axi_read(axi_if, E[i](63, 32));
        prepare_axi_read(axi_if, E[i](95, 64));
        prepare_axi_read(axi_if, E[i](127, 96), /*last=*/1);

        WrRespSignals b_sig;
        axi_if.b.write(b_sig);
    }

    // AXI target inputs
    data.run = NUM_INPUTS;
    data.base_addr = 0;

    // Run the top-level function that will be synthesize to hardware.
    wide_mult_axi(axi_if);

    int mismatch_addr_cnt = 0;

    ap_uint<32> addr = 0;

    // Check that the read and write addresses were as expected.
    for (int i = 0; i < NUM_INPUTS; ++i) {
        if (addr != axi_if.ar.read().addr)
            mismatch_addr_cnt++;
        addr += NUM_READS_PER_INPUT * WORD_SIZE;
        if (addr != axi_if.aw.read().addr)
            mismatch_addr_cnt++;
        addr += NUM_WRITES_PER_INPUT * WORD_SIZE;
    }

    // Read all of write data.
    int mismatch_cnt = 0;
    for (int i = 0; i < NUM_INPUTS; ++i) {
        ap_fixpt<256, 192> result;
        result(31, 0) = axi_if.w.read().data;
        result(63, 32) = axi_if.w.read().data;
        result(95, 64) = axi_if.w.read().data;
        result(127, 96) = axi_if.w.read().data;
        result(159, 128) = axi_if.w.read().data;
        result(191, 160) = axi_if.w.read().data;
        result(223, 192) = axi_if.w.read().data;
        result(255, 224) = axi_if.w.read().data;
        std::cout << "A: " << A[i].raw_bits() << " B: " << B[i]
                  << " C: " << C[i] << " D: " << D[i].raw_bits()
                  << " E: " << E[i].raw_bits() << "\n";
        std::cout << "Expected: " << expected_results[i].raw_bits()
                  << ", Actual: " << result.raw_bits() << "\n";
        if (result != expected_results[i]) {
            mismatch_cnt++;
            std::cout << "ERROR: mismatch\n";
        } else {
            std::cout << "Matched!\n";
        }
    }

    std::cout << "Incorrect addresses: " << mismatch_addr_cnt << "\n";
    std::cout << "Mismatches: " << mismatch_cnt << "\n";
    if (mismatch_addr_cnt || mismatch_cnt)
        std::cout << "FAIL\n";
    else
        std::cout << "PASS\n";
    return mismatch_addr_cnt || mismatch_cnt;
}

