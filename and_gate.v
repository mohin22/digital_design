module and_gate(
    input wire [1:0] a,   // 2-bit input
    input wire [1:0] b,   // 2-bit input
    output wire [1:0] y   // 2-bit output
);

    assign y = a & b; // AND operation

endmodule

