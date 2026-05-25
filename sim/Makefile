SHELL := /bin/bash

XRUN ?= xrun
TOP  ?= tb_top
TEST ?= ALL

FILELIST := filelist.f

# Include dirs (for `include and packages)
INCDIRS := -incdir tb/reg -incdir tb/common -incdir tb/ahb -incdir pat -incdir sva

XRUN_FLAGS := -64bit -sv -f $(FILELIST) -top $(TOP) -timescale 1ns/1ps -access +rwc $(INCDIRS)

.PHONY: all run clean

all: run

run:
	$(XRUN) $(XRUN_FLAGS) +TEST=$(TEST)

clean:
	rm -rf xcelium.d irun.key xrun.log xrun.history *.log *.key *.vcd *.fsdb
