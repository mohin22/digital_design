`timescale 1ns / 1ps  // Timescale directive should be at the top, outside the module

module tb_and_gate;

    reg [1:0] a, b;    // 2-bit inputs
    wire [1:0] y;      // 2-bit output

    // Instantiate the AND gate module
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Initialize the VCD file for waveform dumping
    initial begin
        $dumpfile("and_gate.vcd");   // Name of the VCD file
        $dumpvars(0, tb_and_gate);   // Dump all variables from the testbench
    end

    // Test sequence
    initial begin
        // Display the result
        $monitor("Time = %0d, a = %b, b = %b, y = %b", $time, a, b, y);

        // Apply test vectors
        a = 2'b00; b = 2'b00; #10;
        a = 2'b01; b = 2'b01; #10;
        a = 2'b10; b = 2'b10; #10;
        a = 2'b11; b = 2'b11; #10;
        a = 2'b01; b = 2'b10; #10;

        // End simulation
        $finish;
    end

endmodule

