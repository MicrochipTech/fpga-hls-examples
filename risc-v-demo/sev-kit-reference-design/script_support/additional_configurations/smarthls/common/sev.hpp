#pragma once 

#include "hls/ap_int.hpp"

namespace hls {
namespace sev {

// Common AXI Streaming word definition and convention
// tuser[0] : Start-Of-Frame (SOF)
// tuser[1] : End-Of-Frame (EOF)
// tlast    : End-Od-Line (EOL)
typedef struct axis_wd {
    hls::ap_uint<24> data;
    hls::ap_uint<2> user;
    hls::ap_uint<1> last;
} axis_wd_t;

}
}
