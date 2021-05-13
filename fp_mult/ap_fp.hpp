#ifndef LEGUP_AP_FP_HPP
#define LEGUP_AP_FP_HPP

#include "legup/ap_int.hpp"
#include <legup/types.h>

#define F_M_W 23 // float mantissa width
#define F_E_W 8  // float exponent width
#define D_M_W 52 // double mantissa width
#define D_E_W 11 // double exponent width
#define H_M_W 10 // half mantissa width
#define H_E_W 5  // half exponent width

namespace legup {

// Class for arbitrary precision floating-point numbers.
template <unsigned M_W, unsigned E_W> class ap_fp {
public:
    static const unsigned W = M_W + E_W + 1;

    ap_fp() : data_() {}
    explicit ap_fp(ap_uint<W> val) : data_(val) {}

    ap_uint<1> sign() { return data_[W-1]; }
    ap_uint<E_W> exp() { return data_(W-2, M_W); }
    ap_uint<M_W> mantissa() { return data_(M_W-1, 0); }

    ap_uint<W> data() { return data_; }

private:
    ap_uint<W> data_;
}; // class ap_fp

ap_fp<D_M_W, D_E_W> double_to_ap_fp(double in) {
    return ap_fp<D_M_W, D_E_W>(ap_uint<64>(*(uint64 *)&in));
}

ap_fp<F_M_W, F_E_W> float_to_ap_fp(float in) {
    return ap_fp<F_M_W, F_E_W>(ap_uint<32>(*(uint32 *)&in));
}

} // namespace legup

#endif
