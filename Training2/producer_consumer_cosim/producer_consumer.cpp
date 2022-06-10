// Import hls/thread.hpp to access the SmartHLS thread library and API.
#include "hls/streaming.hpp"
#include "hls/thread.hpp"

// Global variables shared between consumer and producer.
// These can be local to the top level function because the top level function
// waits for the threads to finish before returning.

// The contention free pragma tells SmartHLS not to generate an arbiter.
#pragma HLS memory impl variable(buf) contention_free(true)
int buf[100] = {0};
volatile bool done = false;

// The producer function reads from input fifo and writes to buf then waits for
// consumer to finish consuming 10 times.
void producer(hls::FIFO<int> &input_fifo, volatile bool &done) {
    for (int i = 0; i < 10; i++) {
        while (done)
            ;
// Pipeline for extra performance.
#pragma HLS loop pipeline
        for (int i = 0; i < 100; i++)
            buf[i] = input_fifo.read();
        done = true;
    }
}

// The consumer function waits for the producer to finish producing then reads
// from buf, sums and writes the result to output fifo 10 times.
void consumer(hls::FIFO<int> &output_fifo, volatile bool &done) {
    for (int i = 0; i < 10; i++) {
        while (!done)
            ;
        int sum = 0;
// Pipeline for extra performance.
#pragma HLS loop pipeline
        for (int i = 0; i < 100; i++)
            sum += buf[i];
        done = false;
        output_fifo.write(sum);
    }
}

// The top level function launches the producer and consumer threads then waits
// for them to finish before returning.
void top(hls::FIFO<int> &input_fifo, hls::FIFO<int> &output_fifo) {
#pragma HLS function top
    hls::thread<void> producer_t(producer, hls::ref(input_fifo),
                                   hls::ref(done));
    hls::thread<void> consumer_t(consumer, hls::ref(output_fifo),
                                   hls::ref(done));
    producer_t.join();
    consumer_t.join();
}

// Main testbench that calls top to launch the threads, then writes 1000 inputs
// and expects 10 outputs.
int main() {
    hls::FIFO<int> input_fifo(1000);
    hls::FIFO<int> output_fifo(10);
    for (int i = 0; i < 1000; i++) {
        input_fifo.write(i);
    }
    top(input_fifo, output_fifo);
    int expected = 4950;
    for (int i = 0; i < 10; i++) {
        int result = output_fifo.read();
        printf("result = %d, expected = %d\n", result, expected);
        if (result != expected)
            return 1;
        expected += 10000;
    }
    return 0;
}
