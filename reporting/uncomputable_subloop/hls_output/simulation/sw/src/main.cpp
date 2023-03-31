#include "cosim_wrap.h"
#include <stdio.h>

#define SIZE 30

// sums the collatz function over a range of SIZE numbers starting from n
int sum_collatz(int n) {
auto sum_collatz_original = [&]() -> int{
#pragma HLS function top
    int sum = 0;
    for(int i=n; i<n+SIZE; i++) {
        int m = i;
        for(int j=0; true; j++) {
            if(m == 1) {
                sum += j;
                break;
            }
            if(m%2) {
                m = (m*3)+1;
            } else {
                m /= 2;
            }
        }
    }
    return sum;
};
#ifdef sum_collatz_COSIM_WRAPPER
	sum_collatz_COSIM_WRAPPER()
#endif
}


int main() {
    printf("%d\n", sum_collatz(10));
    return 0;
}
