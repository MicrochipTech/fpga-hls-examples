#include "cosim_wrap.h"
#include <stdio.h>

int sub_function(int);

int top_function(int n) {
auto top_function_original = [&]() -> int{
#pragma HLS function top
    int sum = 0;
    for(int i=n; i<n+16; i++) {
        sum += sub_function(i);
    }
    return sum;
};
#ifdef top_function_COSIM_WRAPPER
	top_function_COSIM_WRAPPER()
#endif
}

int sub_function(int n) {
#pragma HLS function noinline
    return n*n - n;
}
int main() {
    int n = top_function(10);
    return 0;
}
