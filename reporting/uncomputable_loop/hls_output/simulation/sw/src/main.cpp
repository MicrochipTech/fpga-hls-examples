#include "cosim_wrap.h"
#include <stdio.h>

// counts the number of steps the collatz conjecture takes to reach 1
int collatz(int n) {
auto collatz_original = [&]() -> int{
#pragma HLS function top
    for(int i=0; true; i++) {
        if(n == 1) {
            return i;
        }
        if(n%2) {
            n = (n*3)+1;
        } else {
            n /= 2;
        }
    }
};
#ifdef collatz_COSIM_WRAPPER
	collatz_COSIM_WRAPPER()
#endif
}


int main() {
    for(int i=5; i<10; i++) {
        printf("%d %d\n", i, collatz(i));
    }
}
