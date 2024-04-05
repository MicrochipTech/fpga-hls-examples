NAME=hls_pipeline
SRCS=hls_pipeline.cpp
BOARD_PATH=tests/hls_pipeline
LOCAL_CONFIG = -legup-config=config.tcl
SHLS_ROOT_DIR ?= $(shell basename `which shls`)
LEVEL = $(SHLS_ROOT_DIR)/examples

USER_CXX_FLAG+=-DHLS_DBG_PRINTF
USER_CXX_FLAG+=-DHLS_PROFILER_SAMPLES=100
USER_CXX_FLAG+=-DHLS_PROFILER_ENABLE

BOARD_IP ?= 192.168.2.1

include $(LEVEL)/Makefile.common