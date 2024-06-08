TARGET = atpro
OBJS = main.o libs.o hud.o draw.o logs.o

BUILD_PRX = 1
USE_KERNEL_LIBC = 1
USE_KERNEL_LIBS = 1

CFLAGS = -Os -Wall

ifeq ($(RELEASE), 1)
CFLAGS += -DRELEASE=1
else
CFLAGS += -DDEBUG=1
endif

ifeq ($(CONFIG_620), 1)
CFLAGS += -DCONFIG_620=1
OBJS += imports/SysMemForKernel620.o
endif

ifeq ($(CONFIG_63X), 1)
CFLAGS += -DCONFIG_63X=1
OBJS += imports/SysMemForKernel63X.o
endif

ifeq ($(CONFIG_660), 1)
CFLAGS += -DCONFIG_660=1
OBJS += imports/SysMemForKernel660.o
endif

CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

PRX_EXPORTS = exports.exp

INCDIR = ../include
LIBDIR = ../libs
LIBS = -lpspsystemctrl_kernel -lpsppower -lpspwlan -lpsprtc_driver

PSPSDK=$(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build_prx.mak
