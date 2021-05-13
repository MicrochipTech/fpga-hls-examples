#ifndef __AXI_WORD_H__
#define __AXI_WORD_H__

#include <legup/types.h>

struct AxiWord {
    uint64 data;
    uint8 keep;
    uint1 last;
};

#endif
