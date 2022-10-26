#define N 10


volatile int coeff1 = 3;
volatile int coeff2 = 2;

void cross_iteration_dependency( volatile int array[N] ) {
#pragma HLS loop unroll factor(1)
#pragma HLS loop pipeline
	for (int i = 0; i < N - 1; i++) {
		array[i+1] = array[i] * coeff1;
	}
}

void functional_unit_contention( volatile int array[N] ) {
#pragma HLS loop unroll factor(1)
#pragma HLS loop pipeline
	for (int i = 0; i < N; i++) {
		int mult1 = coeff1 * coeff1;
		int mult2 = coeff2 * coeff2;
		array[i] = mult1 + mult2;
	}
}

void memory_contention( volatile int array[N] ) {
#pragma HLS loop unroll factor(1)
#pragma HLS loop pipeline
	for (int i = 0; i < N - 1; i++) {
		array[i] = array[i] + array[i + 1];
	}
}

int main() {
#pragma HLS function top

	volatile int array[N] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

	cross_iteration_dependency( array );
	functional_unit_contention( array );
	memory_contention( array );
	return 0;
}
