// Import legup/thread.hpp to access the LegUp thread library and API.
#include "hls/thread.hpp"
#include "hls/streaming.hpp"

// Global variables shared between consumer and producer.
// These must be global instead of local to the top level function because the
// top level function does not wait for the threads to finish before returning.

// The contention free pragma tells LegUp not to generate an arbiter.
#pragma HLS memory impl variable(buf) contention_free(true)
int buf[100] = {0};
volatile bool done = false;

// The producer function continuously reads from input fifo and writes to buf
// then waits for consumer to finish consuming.
void producer(hls::FIFO<int> &input_fifo, volatile bool &done) {
    while (1) {
        if (!done) {
// Pipeline for extra performance.
#pragma HLS loop pipeline
            for (int i = 0; i < 100; i++)
                buf[i] = input_fifo.read();
            done = true;
        }
    }
}

// The consumer function continuously waits for the producer to finish producing
// then reads from buf, sums and writes the result to output fifo.
void consumer(hls::FIFO<int> &output_fifo, volatile bool &done) {
    while (1) {
        if (done) {
            int sum = 0;
// Pipeline for extra performance.
#pragma HLS loop pipeline
            for (int i = 0; i < 100; i++)
                sum += buf[i];
            done = false;
            output_fifo.write(sum);
        }
    }
}

// The top level function launches the producer and consumer threads then
// returns without waiting for them to finish.
void top(hls::FIFO<int> &input_fifo, hls::FIFO<int> &output_fifo) {
#pragma HLS function top
    hls::thread<void> producer_t(producer, hls::ref(input_fifo),
                                   hls::ref(done));
    hls::thread<void> consumer_t(consumer, hls::ref(output_fifo),
                                   hls::ref(done));
}

// Main testbench that calls top to launch the threads, then writes 1000 inputs
// and expects 10 outputs.
int main() {
    hls::FIFO<int> input_fifo(1000);
    hls::FIFO<int> output_fifo(10);
    top(input_fifo, output_fifo);
    for (int i = 0; i < 1000; i++) {
        input_fifo.write(i);
    }
    for (int i = 0; i < 10; i++) {
        printf("result = %d\n", output_fifo.read());
    }
    return 0;
}
