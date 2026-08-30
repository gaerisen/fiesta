ROOT = $(shell pwd)
INCDIR = $(ROOT)/include
LIBDIR = $(ROOT)/lib

CC = $(CROSS_COMPILE)gcc
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

LDSCRIPT = link.ld
CFLAGS = -march=rv64imaczicsr -mabi=lp64 -O0 -I$(INCDIR)
CFLAGS += -ffreestanding -fpic -mcmodel=medlow
ASFLAGS = $(CFLAGS)
LDFLAGS = $(CFLAGS) -T $(LDSCRIPT) -nostdlib -nostartfiles -static
LDFLAGS += -L$(LIBDIR) -lsbi

TARGET = kernel

MODULES = $(shell find . -name Config.mk)

OBJ :=

include $(MODULES)

.PHONY: all clean cleaner $(SUBDIRS)

all: $(TARGET).elf

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

%.o: %.S
	$(CC) $(ASFLAGS) -c $^ -o $@

$(TARGET).elf: $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $@

# $(TARGET).bin: $(TARGET).elf
#	$(OBJCOPY) -O binary $^ $@

# $(TARGET).hex: $(TARGET).bin
#	od -An -vtx1 $^ > $@

# flash.hex: $(TARGET).hex
#	head -n 2048 $^ > $@

# ram.hex: $(TARGET).hex
#	tail -n +2049 $^ > $@

dump:
	$(OBJDUMP) -D $(TARGET).elf

clean:
	rm *.elf $(OBJ)
