#include "axi_word.hpp"
#include "checksum_calc.h"
#include "utils.h"

#include <legup/bit_level_operations.h>
#include <legup/streaming.hpp>
#include <legup/types.h>

#include <stdlib.h>

struct metadata {
    uint32 src_addr;
    uint32 dest_addr;
    uint16 src_port;
    uint16 dest_port;
};

void udpTxReadFunction(legup::FIFO<AxiWord> &data_in,
                       legup::FIFO<metadata> &metadata_in,
                       legup::FIFO<uint16> &length_in,
                       legup::FIFO<AxiWord> &data_out,
                       legup::FIFO<AxiWord> &checksum_out) {
#pragma LEGUP function pipeline

    // From http://www.faqs.org/rfcs/rfc768.html
    //
    // Checksum is the 16-bit one's complement of the one's complement sum of a
    // pseudo header of information from
    //
    //  1.  the pseduo IP header, contains the source  address, the destination
    //      address, the protocol, and the UDP length. This information gives
    //      protection against misrouted datagrams.
    //
    //      Please note that this is different from the real IP header.
    //
    //    0      7 8     15 16    23 24    31
    //   +--------+--------+--------+--------+
    //   |          source address           |
    //   +--------+--------+--------+--------+
    //   |        destination address        |
    //   +--------+--------+--------+--------+
    //   |  zero  |protocol|   UDP length    |
    //   +--------+--------+--------+--------+
    //
    //  2.  the UDP header (8 bytes)
    //      a. Length  is the length  in octets  of this user datagram
    //      including  this header  and the data. (minimum length is eight.)
    //      b. Checksum field is zero when calculating checksum
    //
    //   0      7 8     15 16    23 24    31
    //  +--------+--------+--------+--------+
    //  |     Source      |   Destination   |
    //  |      Port       |      Port       |
    //  +--------+--------+--------+--------+
    //  |                 |                 |
    //  |     Length      |    Checksum     |
    //  +--------+--------+--------+--------+
    //
    //  3.  the data, padded  with zero octets  at the end (if  necessary)  to
    //  make  a multiple of two octets.
    //
    // So in summary,
    //  the checksum = src addr + dest addr + src port + dest port
    //               + 2 * (data_len + 8) + protocol
    //               + data
    // Order doesn't seem to matter too much as long as they are all added
    // together, so this give us some flexibility in terms of when and what to
    // feed into the module to calcualte checksum.

    static enum State {
        IDLE = 0,
        PSEUDOHEADER,
        FORWARD,
        RESIDUE
    } udp_tx_r_state;

    static uint16 packet_length = 0;

    // Temporary buffer for the data to be sent in the next iteration
    static uint32 remaining = 0;
    static uint32 remaining_extra = 0;

    // data to be sent through AXI
    AxiWord output_word;
    output_word.keep = 0xFF;
    output_word.last = 0;

    switch (udp_tx_r_state) {
    case IDLE:
        if (!metadata_in.empty() && !length_in.empty()) {
            // Read metadata
            metadata temp_metadata = metadata_in.read();

            // Read packet length
            // Increase the length to take the UDP header into account.
            packet_length = length_in.read() + 8;

            // create the first data for checksum and downstream, which contains
            // udp length (in a format of IP header) + source addr
            // 0x1100 is the protocol used
            output_word.data =
                legup_bit_concat_3(ByteSwap32(temp_metadata.src_addr), 32,
                                   ByteSwap16(packet_length), 16, 0x1100, 16);

            // also prepare the next data for checksum and downstream, which has
            // dest addr, src & dest port
            remaining = ByteSwap32(temp_metadata.dest_addr);
            remaining_extra =
                legup_bit_concat_2(ByteSwap16(temp_metadata.dest_port), 16,
                                   ByteSwap16(temp_metadata.src_port), 16);

            udp_tx_r_state = PSEUDOHEADER;
            data_out.write(output_word);
            checksum_out.write(output_word);
        }
        break;
    case PSEUDOHEADER:
        output_word.data =
            legup_bit_concat_2(remaining_extra, 32, remaining, 32);
        remaining =
            legup_bit_concat_2(0x0000, 16, ByteSwap16(packet_length), 16);
        packet_length -= 8;

        udp_tx_r_state = FORWARD;
        data_out.write(output_word);
        checksum_out.write(output_word);
        break;
    case FORWARD:
        // This state streams all the payload data into both the checksum
        // calculation stage and the next stage, reformatting them as required
        if (!data_in.empty()) {
            // read input word
            AxiWord input_word = data_in.read();

            output_word.data = legup_bit_concat_2(
                legup_bit_select(input_word.data, 31, 0), 32, remaining, 32);

            remaining = legup_bit_select(input_word.data, 63, 32);

            if (packet_length > 8) {
                packet_length -= 8;
            } else if (packet_length > 4) {
                packet_length -= 4;
                udp_tx_r_state = RESIDUE;
            } else {
                output_word.keep =
                    legup_bit_concat_2(Length2Keep(packet_length), 4, 0xF, 4);
                output_word.last = 1;

                packet_length = 0;
                udp_tx_r_state = IDLE;
            }
            data_out.write(output_word);
            checksum_out.write(output_word);
        }
        break;
    case RESIDUE:
        output_word.data = legup_bit_concat_2(0x00000000, 32, remaining, 32);
        output_word.keep = Length2Keep(packet_length);
        output_word.last = 1;

        packet_length = 0;
        udp_tx_r_state = IDLE;
        data_out.write(output_word);
        checksum_out.write(output_word);

        break;
    }
}

void udpTxWriteFunction(legup::FIFO<AxiWord> &data_in,
                        legup::FIFO<uint16> &checksum_in,
                        legup::FIFO<AxiWord> &data_out) {
#pragma LEGUP function pipeline

    // IP Header
    //
    //    0                   1                   2                   3
    //    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
    //   +-------+-------+---------------+-------------------------------+
    //   |Version|  IHL  |Type of Service|          Total Length         |
    //   +-------+-------+---------------+-----+-------------------------+
    //   |         Identification        |Flags|      Fragment Offset    |
    //   +---------------+---------------+-----+-------------------------+
    //   |  Time to Live |    Protocol   |         Header Checksum       |
    //   +---------------+---------------+-------------------------------+
    //   |                       Source Address                          |
    //   +---------------------------------------------------------------+
    //   |                    Destination Address                        |
    //   +-----------------------------------------------+---------------+
    //   |                    Options                    |    Padding    |
    //   +-----------------------------------------------+---------------+
    //
    // In the current implementaiton, we don't have any option, so the IP header
    // include only the first 5 rows (i.e. 20 bytes)

    static enum State { IDLE, IP1, IP2, IP3, FORWARD } udp_tx_w_state;
    static uint32 remaining = 0;

    AxiWord output_word;
    output_word.keep = 0xFF;
    output_word.last = 0;

    switch (udp_tx_w_state) {
    case IDLE:
        if (!data_in.empty()) {
            AxiWord input_word = data_in.read();

            // add 20 bytes to the IP header length
            uint16 temp_length =
                ByteSwap16(legup_bit_select(input_word.data, 31, 16)) + 20;

            output_word.data = legup_bit_concat_3(
                0x00000000, 32, ByteSwap16(temp_length), 16, 0x0045, 16);

            remaining = legup_bit_select(input_word.data, 63, 32);
            udp_tx_w_state = IP1;

            data_out.write(output_word);
        }
        break;
    case IP1:
        output_word.data = legup_bit_concat_2(remaining, 32, 0x000011FF, 32);
        udp_tx_w_state = IP2;
        data_out.write(output_word);
        break;
    case IP2:
        if (!data_in.empty()) {
            output_word = data_in.read();
            udp_tx_w_state = IP3;
            data_out.write(output_word);
        }
        break;
    case IP3:
        if (!data_in.empty() && !checksum_in.empty()) {
            uint16 checksum = checksum_in.read();
            output_word = data_in.read();
            output_word.data =
                legup_bit_update(output_word.data, 31, 16, checksum);

            if (output_word.last) {
                udp_tx_w_state = IDLE;
            } else {
                udp_tx_w_state = FORWARD;
            }
            data_out.write(output_word);
        }
        break;
    case FORWARD:
        if (!data_in.empty()) {
            output_word = data_in.read();
            if (output_word.last) {
                udp_tx_w_state = IDLE;
            }
            data_out.write(output_word);
        }
        break;
    }
}

// FIXME: have to create a wrapper function for the shared checksumCalculation,
// otherwise we will have multiple implementations for the same module when we
// integrate multiple projects together
void udpTxChecksum(legup::FIFO<AxiWord> &data_in,
                   legup::FIFO<uint16> &checksum_out) {
#pragma LEGUP function pipeline
    checksumCalculation(data_in, checksum_out);
}

void udpTx(legup::FIFO<AxiWord> &data_in, legup::FIFO<metadata> &metadata_in,
           legup::FIFO<uint16> &length_in, legup::FIFO<AxiWord> &data_out) {
#pragma LEGUP function top

    // Declare intermediate legup::FIFOs for inter-function communication
    // Note that the FIFO size should be big enough to hold the whole packet
    static legup::FIFO<AxiWord> read2write(8192);
    // FIXME: Need to use big FIFOs here only to run software testbench
    // properly. The FIFO depth can be reduce to 2 when generating hardware to
    // save resources.
    static legup::FIFO<AxiWord> read2checksum(8192);
    static legup::FIFO<uint16> checksum2write(8192);

    udpTxReadFunction(data_in, metadata_in, length_in, read2write,
                      read2checksum);
    udpTxChecksum(read2checksum, checksum2write);
    udpTxWriteFunction(read2write, checksum2write, data_out);
}

int main() {

    legup::FIFO<AxiWord> data_in(1024);
    legup::FIFO<metadata> metadata_in(1024);
    legup::FIFO<uint16> length_in(1024);
    legup::FIFO<AxiWord> data_out(1024);

    AxiWord input_word;
    metadata input_md;
    uint16 input_length;

    FILE *tx_input = fopen("in.dat", "r");
    FILE *tx_output = fopen("out.dat", "w");
    if (!tx_input || !tx_output) {
        printf("FAIL: Unable to open data file.\n");
        return -1;
    }

    char line[8192];
    char *ptr = line;
    bool more_input = true;
    unsigned bytes_left = 0;

    // run extra iterations after the data_out fifo is empty to make sure we
    // completely flush out all data from the pipeline
    const unsigned EXTRA_ITER = 50;
    unsigned additional_iter = 1;

    while (more_input || !data_out.empty() || additional_iter != EXTRA_ITER) {
        if (more_input) {
            if (bytes_left == 0) {
                if ((more_input = fgets(line, sizeof(line), tx_input))) {
                    ptr = line;

                    input_md.dest_addr = strtoul(ptr, &ptr, 16);
                    input_md.src_addr = strtoul(ptr, &ptr, 16);
                    input_md.dest_port = strtoul(ptr, &ptr, 16);
                    input_md.src_port = strtoul(ptr, &ptr, 16);
                    input_length = strtoul(ptr, &ptr, 16);

                    metadata_in.write(input_md);
                    length_in.write(input_length);

                    // skip the extra space
                    ptr++;

                    unsigned data_length = strlen(ptr) - 1;
                    bytes_left = data_length / 2;

                    for (unsigned i = 0; i < 14; i++)
                        ptr[data_length + i] = '0';
                }
            }
            if (more_input) {
                char buf[17] = {0};
                strncpy(buf, ptr, 16);

                input_word.data = ByteSwap64(strtoull(buf, NULL, 16));
                input_word.keep =
                    (bytes_left <= 8) ? Length2Keep(bytes_left) : 0xFF;
                input_word.last = (bytes_left <= 8);

                data_in.write(input_word);
                if (input_word.last) {
                    bytes_left = 0;
                } else {
                    bytes_left -= 8;
                    ptr += 16;
                }
            }
        }

        if (!data_out.empty()) {
            AxiWord output_word = data_out.read();
            if (output_word.last) {
                unsigned len = Keep2Length(output_word.keep);
                fprintf(tx_output, "%0*llx", 2 * len,
                        ByteSwap64(output_word.data) >> (8 * (8 - len)));
                fprintf(tx_output, "\n");
            } else {
                fprintf(tx_output, "%016llx", ByteSwap64(output_word.data));
            }
            additional_iter = 0;
        }
        additional_iter++;
        udpTx(data_in, metadata_in, length_in, data_out);
    }

    fclose(tx_input);
    fclose(tx_output);

    // compare the out.dat with the golden output
    FILE *tx_expected = fopen("expected_out.dat", "r");
    tx_output = fopen("out.dat", "r");

    if (!tx_expected || !tx_output) {
        printf("FAIL: Unable to open data file.\n");
        return -1;
    }

    char ch1, ch2;
    int error = 0, pos = 0, line_num = 1;
    while ((ch1 = fgetc(tx_output)) != EOF &&
           (ch2 = fgetc(tx_expected)) != EOF) {
        pos++;
        if (ch1 == '\n' && ch2 == '\n') {
            line_num++;
            pos = 0;
        }

        if (ch1 != ch2) {
            error++;
            printf("Line %d, Column %d, data mismatch.\n", line_num, pos);
            break;
        }
    }
    fclose(tx_expected);
    fclose(tx_output);

    if (error == 0)
        printf("PASS\n");
    else
        printf("FAIL\n");

    return error;
}
