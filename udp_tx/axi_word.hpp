#ifndef __AXI_WORD_H__
#define __AXI_WORD_H__

#include <hls/streaming.hpp>

#ifndef printd
#define printd
#endif

#ifdef USE_AP_INT
#include <hls/ap_int.hpp>
struct AxiWord {
    hls::ap_uint<64> data;
    hls::ap_uint<8> keep;
    hls::ap_uint<1> last;
};

#define PrintAxiWord(axi_word)                                                 \
    printd(#axi_word ": {0x%016llx, 0x%02x, 0x%x}\n",                          \
           axi_word.data.to_uint64(), axi_word.keep.to_uint64(),               \
           axi_word.last.to_uint64())

#else
#include "hls/types.h"
struct AxiWord {
    uint64 data;
    uint8 keep;
    uint1 last;
};

#define PrintAxiWord(axi_word)                                                 \
    printd(#axi_word ": {0x%016llx, 0x%02x, 0x%x}\n", axi_word.data,           \
           axi_word.keep, axi_word.last)

#endif

typedef hls::FIFO<AxiWord> AxiWordFifo;

static inline void ReadAxiWordFifo(AxiWordFifo *awf, AxiWord *axi_word) {
    AxiWord currWord;
    awf->read(currWord);
    axi_word->data = currWord.data;
    axi_word->keep = currWord.keep;
    axi_word->last = currWord.last;
    // printd("Reading from fifo: ");//%s: ", awf->name);
    PrintAxiWord((*axi_word));
}

static inline void WriteAxiWordFifo(AxiWordFifo *awf, AxiWord axi_word) {
    awf->write(axi_word);
    printd("Writing to fifo: ");//%s: ", awf->name);
    PrintAxiWord(axi_word);
}

static inline bool IsAxiWordFifoEmpty(AxiWordFifo *awf) {
    return awf->empty();
}

static inline void CopyAxiWord(AxiWord *src, AxiWord *dst) {
    dst->data = src->data;
    dst->keep = src->keep;
    dst->last = src->last;
}

#endif
