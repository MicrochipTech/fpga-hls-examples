#include <stdint.h>
#include <stdio.h>

void radix2_div(uint32_t dividend, uint8_t divisor, uint32_t &quotient, uint8_t &fractional) {
  #pragma HLS function top

  uint32_t quotient_int = 0;
  uint8_t fractional_int = 0;
  uint8_t remainder = 0;

  if (divisor == 0) {
    quotient_int = 0xFFFFFFFF;
    fractional_int = 0xFF;
  } else {

    quotient_int = 0;
    fractional_int = 0;

    // Perform the division
    for (int i = 31; i >= 0; i--) {
        remainder <<= 1;
        remainder |= (dividend >> i) & 1;

        if (remainder >= divisor) {
            remainder -= divisor;
            quotient_int |= (1 << i);
        }
    }

    // Calculate the fractional part
    for (int i = 7; i >= 0; i--) {
        remainder <<= 1;
        if (remainder >= divisor) {
            remainder -= divisor;
            fractional_int |= (1 << i);
        }
    }
  }

  // Output the results. 
  quotient = quotient_int;
  fractional = fractional_int;
}


using test_case = struct {
  uint32_t dividend;
  uint8_t  divisor;
  uint32_t quotient_ref;
  uint8_t  fractional_ref;  
};

// void test(uint32_t dividend, uint8_t divisor, uint32_t quotient_ref, uint8_t fractional_ref) {
bool test(test_case t) {
  uint32_t quotient;
  uint8_t fractional;
  radix2_div(t.dividend, t.divisor, quotient, fractional);
  bool error = (quotient != t.quotient_ref) || (fractional != t.fractional_ref);
  printf("Test: [%s] Dividend = %u, Divisor = %u, Quotient = %u, Fractional = 0x%x\n",
    error ? "FAIL" : "PASS", t.dividend, t.divisor, quotient, fractional);
  return error;
}

int main() {
  test_case t;
  bool error = 0;
  
  // Test case 1: Basic division
  t = {.dividend = 250, .divisor = 7, .quotient_ref = 35, .fractional_ref = 0xB6};
  error |= test(t);

  // Test case 2: Perfect division with no remainder
  t = {.dividend = 1000, .divisor = 8, .quotient_ref = 125, .fractional_ref = 0x0};
  error |= test(t);

  // Test case 3: Division by 1
  t = {.dividend = 0xFFFFFFFF, .divisor = 1, .quotient_ref = 0xFFFFFFFF, .fractional_ref = 0x0};
  error |= test(t);

  // Test case 4: Division by zero protection
  t = {.dividend = 500, .divisor = 0, .quotient_ref = 0xFFFFFFFF, .fractional_ref = 0xFF};
  error |= test(t);

  // Test case 5: Small dividend case
  t = {.dividend = 5, .divisor = 10, .quotient_ref = 0, .fractional_ref = 0x80};
  error |= test(t);

  // Test case 6: Maximum dividend case
  t = {.dividend = 0xFFFFFFFF, .divisor = 255, .quotient_ref = 16843009, .fractional_ref = 0x0};
  error |= test(t);

  // Test case 7: Power of 2 divisor
  t = {.dividend = 1234, .divisor = 16, .quotient_ref = 77, .fractional_ref = 0x20};
  error |= test(t);

  // Test case 8: Another basic division
  t = {.dividend = 10, .divisor = 3, .quotient_ref = 3, .fractional_ref = 0x55};
  error |= test(t);

  return error;
}