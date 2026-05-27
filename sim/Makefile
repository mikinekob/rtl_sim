SHELL := /bin/tcsh

XRUN ?= xrun
TOP  ?= tb_top
TEST ?= ALL

FILELIST := filelist.f
OUT ?= out/$(TEST)
OUTPUT ?= output

# Include dirs (for `include and packages)
INCDIRS := -incdir tb/reg -incdir tb/common -incdir tb/ahb -incdir pat -incdir sva

XRUN_FLAGS := -64bit -sv -f $(FILELIST) -top $(TOP) -timescale 1ns/1ps -access +rwc $(INCDIRS)
XRUN_RUNFLAGS := -l $(OUT)/xrun.log

PATS := PAT01_HW_RESET_SMOKE PAT02_SW_RESET_RETURN_DEFAULT

.PHONY: all run run-all clean

all: run

run:
	mkdir -p $(OUT)
	mkdir -p $(OUTPUT)/$(TEST)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_RUNFLAGS) +TEST=$(TEST) +SHMFILE
	# Move generated waveforms (SHM is typically a directory) to OUTPUT/$(TEST)
	if ( -d wave.shm ) mv wave.shm $(OUTPUT)/$(TEST)/
	if ( -d xmsim.shm ) mv xmsim.shm $(OUTPUT)/$(TEST)/
	if ( -d xcelium.shm ) mv xcelium.shm $(OUTPUT)/$(TEST)/
	if ( -d waves.shm ) mv waves.shm $(OUTPUT)/$(TEST)/
	# Also move any remaining *.shm directories in the current dir
	foreach d ( *.shm )
		if ( -d $$d ) mv $$d $(OUTPUT)/$(TEST)/
	end

# Run each pattern in a separate xrun invocation so logs/waves are split per PAT.
run-all:
	@foreach p ( $(PATS) )
		$(MAKE) run TEST=$$p
	end

clean:
	rm -rf out output xcelium.d irun.key xrun.log xrun.history *.log *.key *.vcd *.fsdb *.shm
