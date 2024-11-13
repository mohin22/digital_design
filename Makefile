# Makefile to compile and simulate Verilog files

# Compiler and simulator
VLOG = iverilog
VOBJ = and_gate.v tb_and_gate.v
VCD = and_gate.vcd
GTK = gtkwave

# Default target to run simulation
all: sim

# Compile Verilog files
compile:
	$(VLOG) -o and_gate_tb.vvp $(VOBJ)

# Run the simulation
sim: compile
	# Run the simulation to produce VCD file for waveform analysis
	vvp and_gate_tb.vvp

# Open the waveform file in GTKWave
view: sim
	$(GTK) $(VCD)

# Clean up generated files
clean:
	rm -f *.vvp *.vcd

# Phony targets
.PHONY: all compile sim view clean

