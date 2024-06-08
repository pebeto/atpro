TARGET = memab
OBJS = main.o ATPRO.o

BUILD_PRX = 1
USE_KERNEL_LIBC = 1
USE_KERNEL_LIBS = 1

CFLAGS = -Os -Wall -fno-pic

ifeq ($(CONFIG_620), 1)
CFLAGS += -DCONFIG_620=1
endif

ifeq ($(CONFIG_63X), 1)
CFLAGS += -DCONFIG_63X=1
endif

ifeq ($(CONFIG_660), 1)
CFLAGS += -DCONFIG_660=1
endif

ifeq ($(RELEASE), 1)
CFLAGS += -DRELEASE=1
else
CFLAGS += -DDEBUG=1
endif

CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

PRX_EXPORTS = exports.exp

PSPSDK=$(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build_prx.mak
