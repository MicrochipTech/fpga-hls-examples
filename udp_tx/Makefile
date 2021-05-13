NAME = udp_tx
SRCS = udp_tx.cpp
LOCAL_CONFIG = -legup-config=config.tcl
LEVEL = $(LEGUP_ROOT_DIR)/examples

include $(LEVEL)/Makefile.common

EXTRA_SW_COMPILATION_FLAG = -I../
CFLAG += $(EXTRA_SW_COMPILATION_FLAG)

EXT := cpp
FRONT_END:=$(FRONT_END_PP)
