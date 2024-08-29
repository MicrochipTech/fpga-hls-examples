#include <csignal>
#include <iostream>
#include <fstream>
#include <hls/streaming.hpp>
#include <hls/hls_alloc.h>
#include <hls/thread.hpp>
#include <stdlib.h>
#define FIFO_DEPTH 10

uint8_t keep_going;
struct cfg_t {
    int n_fwd_1;
    int n_wait_1;
    int n_fwd_2;
    int n_wait_2;
};

void signalHandler( int signum ) {
    printf("signum %d received!\n", signum);
    if (signum == SIGINT) keep_going = 0;
}

void read_config(struct cfg_t &cfg){
    std::ifstream cfgFile("my_cfg.cfg");
    if (!cfgFile) {
        printf("ERROR. Could not open cfg file\n"); fflush(stdout);
        exit(-1);
    }
    printf("Config file is opened!\n"); fflush(stdout);

    std::string line;
    cfgFile.seekg(0);

    std::getline(cfgFile, line); 
    cfg.n_fwd_1 = std::stoi(line);

    std::getline(cfgFile,line); 
    cfg.n_wait_1 = std::stoi(line);

    std::getline(cfgFile,line); 
    cfg.n_fwd_2 = std::stoi(line);

    std::getline(cfgFile,line); 
    cfg.n_wait_2 = std::stoi(line);
   
    cfgFile.close();
    printf("Num FWD 1: %d\n", cfg.n_fwd_1);
    printf("Num WAIT 1: %d\n", cfg.n_wait_1);
    printf("Num FWD 2: %d\n", cfg.n_fwd_2);
     printf("Num WAIT 2: %d\n", cfg.n_wait_2);
    
}

void readFunction(hls::FIFO<unsigned int> &data_in,
                       hls::FIFO<unsigned int> &data_out, 
                       int t_id, /* Thread ID */
                       int n_fwd,
                       int n_wait) {

    // Counters must be volatile, or else SHLS will optimize out the n_wait loop, which is fair
    volatile int f = 0, w = 0;

    int words_read = 0;

    #ifndef __SYNTHESIS__
    printf("T%d: I AM ALIVE! n_fwd=%d, n_wait=%d\n", t_id, n_fwd, n_wait);
    #endif

read_func_loop:
    #pragma HLS loop pipeline
    while(words_read < FIFO_DEPTH){
       // printf("T%d: f: %d, w: %d. n_fwd = %d, n_wait = %d\n", t_id, f, w, n_fwd, n_wait); 
        if (f < n_fwd){
            if (!data_in.empty()) {
                #ifndef __SYNTHESIS__
         	    printf("T%d: I am FORWARDING successfully! WORD COUNT: %d, f: %d\n", t_id, words_read, f);
                #endif
                data_out.write(data_in.read());
	        words_read++;
            } else {
                #ifndef __SYNTHESIS__
                printf("T%d: I am FORWARDING unsuccessfully! f: %d\n", t_id, f);
                #endif
            }
            f++;
            if (f == n_fwd) w = 0;

        } else {
            if (n_wait != 0) {
                #ifndef __SYNTHESIS__
                printf("T%d: I am WAITING right now, %d\n", t_id, w);
                #endif      
                w++;
            }
            if (w == n_wait) f = 0;
        }
    }

    #ifndef __SYNTHESIS__
    printf("T%d: Done!\n", t_id);
    #endif
}

void write_fifo(hls::FIFO<unsigned int> &out_fifo, unsigned int *buf) {
    #pragma HLS loop pipeline
    for(int i=0; i<FIFO_DEPTH; i++) {
        unsigned int tmp = buf[i];
        out_fifo.write(tmp);
    }
}

void read_fifo(hls::FIFO<unsigned int> &in_fifo, unsigned int *buf) {
    #pragma HLS loop pipeline
    for(int i=0; i<FIFO_DEPTH; i++) {
        auto wd = in_fifo.read();
        buf[i] = wd;
    }
}        

void my_wrapper (hls::FIFO<unsigned int> &data_in,
                       hls::FIFO<unsigned int> &data_out, struct cfg_t cfg) {

    hls::FIFO<unsigned int> fifo_1(FIFO_DEPTH);
    
    auto t1 = hls::thread<void>(readFunction, hls::ref(data_in), hls::ref(fifo_1), 1, cfg.n_fwd_1, cfg.n_wait_1);    	
    auto t2 = hls::thread<void>(readFunction, hls::ref(fifo_1), hls::ref(data_out), 2, cfg.n_fwd_2, cfg.n_wait_2);    	

    t1.join();
    t2.join();
}

void top_level(unsigned int *bufIn, unsigned int *bufOut, struct cfg_t cfg) {
    #pragma HLS function top 
    #pragma HLS interface default type(axi_target)
    #pragma HLS interface argument(bufOut) type(axi_initiator) num_elements(FIFO_DEPTH)
    #pragma HLS interface argument(bufIn) type(axi_initiator) num_elements(FIFO_DEPTH)

    hls::FIFO<unsigned int> data_in(FIFO_DEPTH);
    hls::FIFO<unsigned int> data_out(FIFO_DEPTH);

    write_fifo(data_in, bufIn);
    my_wrapper(data_in, data_out, cfg);
    read_fifo(data_out, bufOut);
}

int main(int argc, char** argv) {
    int num_iterations = 0;

    if (argc == 2){
        num_iterations = atoi(argv[1]);
    } 

    // We want to register SIGINT to have a graceful exit
    signal(SIGINT, signalHandler);
    printf("SIGINT registered\n"); fflush(stdout);
    
    // Read the config file.
    // Using a config file enables us to change the n_fwd & n_waits without having to provide them as arguments
    struct cfg_t cfg = {10, 0, 10, 0};
    
    unsigned int *bufIn = (unsigned int *)hls_malloc(FIFO_DEPTH*sizeof(unsigned int));
    unsigned int *bufOut = (unsigned int *)hls_malloc(FIFO_DEPTH*sizeof(unsigned int));

    keep_going = 1;

    // First fill the buffer with some numbers
    for (int i = 0; i < FIFO_DEPTH; i++) {
        bufIn[i] = i;
        printf("In number %d\n", i);
    }	
    if (num_iterations <= 0) {
        while (keep_going){
            read_config(cfg);
            top_level(bufIn, bufOut, cfg);
        }
    } else {
        for (int j = 0; keep_going && j < num_iterations; j++){
            read_config( cfg);
            top_level(bufIn, bufOut, cfg);
        }
    }

    // Print the output
 	for (int i = 0; i < FIFO_DEPTH; i++) {
        printf("Out number %d is %d\n", i, bufOut[i]);
    }
    
    hls_free(bufIn);
    hls_free(bufOut);
    return 0;
}
