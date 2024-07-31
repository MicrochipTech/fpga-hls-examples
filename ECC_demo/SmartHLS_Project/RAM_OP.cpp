#include <stdio.h>
#include <iostream>
#include "hls/ecc.hpp"
#include "hls/ap_int.hpp"

using namespace hls;

#define SIMULATION
#define RAM_CLEAR 0
#define RAM_INIT 1
#define READ 2
#define WRITE 3
#define CLEAR_COUNT 4
#define SUM 5
#define SB_INJ 6
#define DB_INJ 7

#define N 256
#pragma HLS memory impl variable(ecc_ram) ecc(true)
ap_uint<8> ecc_ram[N];

// Module outputs are instantiated as globals
ap_uint<1> sb_correct, db_detect;
ap_uint<8> read_data = 0;
int sb_count, db_count = 0;
int sum_out;

/* ========================================================================== */
ap_uint<8> read_op(bool WB_EN, ap_uint<8> ram_addr, int &sb_count_reg, int &db_count_reg){
    // retrieve ECC info of the given address
    auto ecc_info = read_ecc(&ecc_ram[ram_addr]);
    sb_correct = ecc_info.sb_correct;
    db_detect = ecc_info.db_detect;
    
    // increment the counter
    sb_count_reg += sb_correct;
    db_count_reg += db_detect;

    // perform write back for sb_correct
    if(sb_correct && WB_EN){
        printf("SB Write Back!\n");
        ecc_ram[ram_addr] = ecc_info.data;
    }

    return ecc_info.data;
}

void RAM_OP(char cmd, bool WB_EN = 0, ap_uint<8> ram_addr = 0,
            ap_uint<8> write_data = 0) {
#pragma HLS function top

    // using static variables for the counters to keep the values 
    static int sb_count_reg = 0;
    static int db_count_reg = 0;

    if (cmd == RAM_CLEAR){
        // init/erase ram with all 0
        #pragma HLS loop pipeline
        for(unsigned i = 0; i < N; i++){
            ecc_ram[i] = 0;
        }
    } else if (cmd == RAM_INIT) {
        // init ram with increment value
        #pragma HLS loop pipeline
        for(unsigned i = 0; i < N; i++){
            ecc_ram[i] = i;
        }
    } else if (cmd == READ){
        read_data = read_op(WB_EN, ram_addr, sb_count_reg, db_count_reg);
    } else if (cmd == WRITE) {
        ecc_ram[ram_addr] = write_data;
    } else if (cmd == CLEAR_COUNT) {
        sb_count_reg = 0;
        db_count_reg = 0;
    } else if (cmd == SUM) {
        int sum = 0;
        #pragma HLS loop pipeline
        for(unsigned i = 0; i < N; i++){
            read_data = read_op(WB_EN, i, sb_count_reg, db_count_reg);
            sum += read_data;
        }
        sum_out = sum;
    }
#ifdef SIMULATION
    else if (cmd == SB_INJ)
        inject_ecc_error(&ecc_ram[2], 1);
    else if (cmd == DB_INJ)
        inject_ecc_error(&ecc_ram[4], 3);
#endif

    // count output
    sb_count = sb_count_reg;
    db_count = db_count_reg;
}

int main() {
    int err_count = 0;

    // RAM_INIT with incremental data
    RAM_OP(RAM_INIT);

    // SUM w/o any error
    RAM_OP(SUM);
    if(sum_out != 32640)
        err_count++;
    if (sb_count + db_count != 0)
        err_count++;
    printf("Sum 1: %d\n", sum_out);
    printf("ECC count 1: %d\n", sb_count + db_count);

#ifdef SIMULATION
    // inject single bit error at ecc_ram[2], mask = 'b0001
    RAM_OP(SB_INJ);
    // READ, addr = 2, write_data = -1 (unused), WB_EN = 1
    RAM_OP(READ, 1, 2, -1);
    if(read_data != 2)
        err_count++;
    if(!(sb_count == 1 && db_count == 0 && sb_correct == 1 && db_detect == 0))
        err_count++;
    std::cout << "ecc_ram[2] =  " << read_data.to_string(10) << std::endl; // error should be corrected
    printf("sb_count = %d\n", sb_count);
    printf("db_count = %d\n", db_count);

    // inject double bit error at ecc_ram[4], mask = 'b0011
    // ecc_ram[4] = 4 changed to ecc_ram[4] = 7
    RAM_OP(DB_INJ);
    // READ, addr = 4, write_data = -1 (unused), WB_EN = 1
    RAM_OP(READ, 1, 4, -1);
    if(read_data != 7)
        err_count++;
    if(!(sb_count == 1 && db_count == 1 && sb_correct == 0 && db_detect == 1))
        err_count++;
    std::cout << "ecc_ram[4] =  " << read_data.to_string(10) << std::endl;
    printf("sb_count = %d\n", sb_count);
    printf("db_count = %d\n", db_count);

    // SUM w/ errors
    RAM_OP(SUM);
    if(sum_out != 32643)
        err_count++;
    if (sb_count + db_count != 4)
        err_count++;
    printf("Sum 2: %d\n", sum_out);
    printf("ECC count 2: %d\n", sb_count + db_count);
#else
    // READ, addr = 2
    RAM_OP(READ, 1, 2, -1);
    if(read_data != 2)
        err_count++;
    if(sb_correct || db_detect) // there should not be any error
        err_count++;
    std::cout << "ecc_ram[2] =  " << read_data.to_string(10) << std::endl;
    printf("sb_count = %d\n", sb_count);
    printf("db_count = %d\n", db_count);

    // READ, addr = 4
    RAM_OP(READ, 1, 4, -1);
    if(read_data != 4)
        err_count++;
    if(sb_correct || db_detect) // there should not be any error
        err_count++;
    std::cout << "ecc_ram[4] =  " << read_data.to_string(10) << std::endl;
    printf("sb_count = %d\n", sb_count);
    printf("db_count = %d\n", db_count);
#endif

    if (err_count)
        printf("FAIL!");
    else
        printf("PASS!");

    return err_count;
}
