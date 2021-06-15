#include <hls/axi_interface.hpp>
#include <hls/ap_int.hpp>
#include <stdio.h>
using namespace hls;

void simple_initiator(AxiInterface<ap_uint<32>, ap_uint<64>, ap_uint<8>> &initiator) {
#pragma HLS function top
    ap_uint<9> remaining = AXIM_MAX_BURST_LEN;
    ap_uint<32> r_addr = 0;
    ap_uint<32> w_addr = AXIM_MAX_BURST_LEN * 8;

#pragma HLS loop pipeline
    for (; remaining != 0; --remaining) {
        bool is_last = remaining == 1;

        if (remaining == AXIM_MAX_BURST_LEN) {
            // Request to read data in burst.
            axi_m_read_req<ap_uint<32>, ap_uint<64>, ap_uint<8>>(initiator, r_addr, AXIM_MAX_BURST_LEN);

            // Request to write data in burst.
            axi_m_write_req<ap_uint<32>, ap_uint<64>, ap_uint<8>>(initiator, w_addr, AXIM_MAX_BURST_LEN);
        }

        // Write back the data we read + 1.
        ap_uint<64> data = axi_m_read_data<ap_uint<32>, ap_uint<64>>(initiator);
        axi_m_write_data<ap_uint<32>, ap_uint<64>, ap_uint<8>>(initiator, ap_uint<64>(data + 1), ap_uint<8>(0xFF), is_last);

    }

    // After the last write, read the response code.
    ap_uint<2> bresp = axi_m_write_resp(initiator);
}

int main() {
    AxiInterface<ap_uint<32>, ap_uint<64>, ap_uint<8>> axi_if(AXIM_MAX_BURST_LEN);

    // Prepare the data to be read by the AXI initiator.
    for (int i = 0; i < AXIM_MAX_BURST_LEN; i++) {
        RdDataSignals<ap_uint<64>> r_sig;
        r_sig.data = i;
        r_sig.resp = 0;
        r_sig.last = i == AXIM_MAX_BURST_LEN - 1;
        axi_if.r.write(r_sig);
    }

    // Prepare the write response for the write from AXI initiator.
    WrRespSignals b_sig;
    axi_if.b.write(b_sig);

    // Run the top-level function that will be synthesize to hardware.
    simple_initiator(axi_if);

    bool failed = false;

    // Clear the write and read request.
    ap_uint<32> r_addr = axi_if.ar.read().addr;
    ap_uint<32> w_addr = axi_if.aw.read().addr;

    // Check that the read and write addresses were as expected.
    failed |= r_addr != 0;
    failed |= w_addr != AXIM_MAX_BURST_LEN * 8;

    // Read all of write data.
    for (int i = 0; i < AXIM_MAX_BURST_LEN; ++i) {
        // Check that write data is i + 1.
        failed |= axi_if.w.read().data != i + 1;
    }

    // Now that all FIFOs have been cleared, the AXI interface could be prepared
    // for more calls to the kernel..

    if (!failed)
        printf("PASS!\n");
    else
        printf("FAILED!\n");

    return failed;
}

