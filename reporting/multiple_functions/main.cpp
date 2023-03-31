#include <stdio.h>

#define SIZE 30

int collatz(int);

// same as uncomputable_subloop, but with the inner loop as a seperate function
int sum_collatz(int n) {
#pragma HLS function top
    int sum = 0;
    for(int i=n; i<n+SIZE; i++) {
        sum += collatz(i);
    }
    return sum;
}

int collatz(int n) {
#pragma HLS function noinline
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
}

int main() {
    printf("%d\n", sum_collatz(10));
    return 0;
}