NAME = fmult
LOCAL_CONFIG = -legup-config=config.tcl
LEVEL = $(LEGUP_ROOT_DIR)/examples
SRCS = fmult_test.cpp

include $(LEVEL)/Makefile.common
EXT=cpp
FRONT_END:=$(FRONT_END_PP)

# Need this line to avoid clang++ error not finding header file:
#    In file included from fmult_test_labeled.cpp:6:
#    /usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/iostream:38:10: fatal error: 'bits/c++config.h' file not found
#    #include <bits/c++config.h>
#             ^
#    1 error generated.
#CFLAG += -I/usr/include/x86_64-linux-gnu/c++/5
CFLAG += -Wno-narrowing
EXTRA_SW_COMPILATION_FLAG += -Wno-narrowing
