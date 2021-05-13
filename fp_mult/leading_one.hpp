#ifndef __LEADING_ONE_HPP__
#define __LEADING_ONE_HPP__

// Use template meta-programming to compute the position of the leading one of
// an unsigned int.
// To get the position of the leading one of 'val', use leading_one<val>::value.

// A struct with bool field 'value' that is true if val has a 1 at position N,
// otherwise value is false
template <unsigned N, unsigned val> struct one_at_N {
    static bool const value = 1 << N & val;
};

// A struct that will have an unsigned field 'value' giving the position of the
// leading one in val. It does this using recursion and three different versions
// of the struct. The struct also has boolean field 'zero' which is true if val
// is zero, in which case 'value' should be ignored.
template <unsigned N, unsigned val, typename T = void> struct find_leading_one;

// This struct is used if the bit at position N is a 1, and sets value to N.
template <unsigned N, unsigned val>
struct find_leading_one<
    N, val,
    typename std::enable_if<one_at_N<N, val>::value && val != 0>::type> {
    static unsigned const value = N;
    static bool const zero = false;
};

// This struct is used if the bit at position N is a 0, and recursively sets
// value to find_leading_one<N-1, val>::value.
template <unsigned N, unsigned val>
struct find_leading_one<
    N, val,
    typename std::enable_if<!one_at_N<N, val>::value && val != 0>::type> {
    static unsigned const value = find_leading_one<N - 1, val>::value;
    static bool const zero = false;
};

// This struct is used if val is zero, and sets 'zero' to true.
template <unsigned N> struct find_leading_one<N, 0, void> {
    static unsigned const value = 0;
    static bool const zero = true;
};

// The struct to be used to get the leading one of 'val'. The field 'value' gets
// set to the position of the leading one of 'val', unless 'val' is zero, in
// which case the field 'zero' is true.
template <unsigned val> struct leading_one {
    static unsigned const value =
        find_leading_one<sizeof(unsigned) * 8 - 1, val>::value;
    static bool const zero =
        find_leading_one<sizeof(unsigned) * 8 - 1, val>::zero;
};

#endif
