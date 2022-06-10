#include "hls/thread.hpp"
#include "hls/streaming.hpp"

volatile int a[5] = {0};
volatile int b = 0, c = 0, d = 0;
volatile int e, f, g;

void no_dependency() {
#pragma HLS function noinline
	e = b + c;
	f = c + d;
	g = b + d;
}

void data_dependency() {
#pragma HLS function noinline
	e = b + c;
	f = e + d;
	g = e + f;
}

void memory_dependency() {
#pragma HLS function noinline
	volatile int i = 0;
	a[i] = b;
	f = a[1];
	g = a[2];
}

void resource_contention() {
#pragma HLS function noinline
	e = a[0];
	f = a[1];
	g = a[2];
}

void no_loop_unroll() {
#pragma HLS function noinline
	int h = 0;
#pragma HLS loop unroll factor(1)
	for (int i = 0; i < 5; i++) {
		 h += a[i];
	}
	e = h;
}

void loop_unroll() {
#pragma HLS function noinline
	int h = 0;
#pragma HLS loop unroll
	for (int i = 0; i < 5; i++) {
		 h += a[i];
	}
	e = h;
}

int main() {
	no_dependency();
	data_dependency();
	memory_dependency();
	resource_contention();
	no_loop_unroll();
	loop_unroll();
}
