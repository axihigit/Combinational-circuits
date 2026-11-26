//----Sub-module: XOR Gate----
module xor_gate (
        input wire a,
        input wire b,
        output wire y
       );
     assign y = a ^ b;
endmodule

//----Sub-module: AND Gate----
module and_gate (
        input wire a,
        input wire b,
        output wire y
    );
    assign y = a & b;
endmodule

//----Parent Module: Half Adder----
module half_adder(
        input wire a,
        input wire b,
        output wire sum,
        output wire carry
    );

// Instantiating using named port association (.port(signal))
xor_gate u_xor (.a(a), .b(b), .y(sum));
and_gate u_and (.a(a), .b(b), .y(carry));

endmodule

`timescale 1ns/1ps

module HalfAdder_tb;
    reg a;
    reg b;
    wire sum;
    wire carry;

    // Instantiate your half_adder module
    half_adder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // VCD dumper setup for GTKWave
        $dumpfile("HalfAdder_tb.vcd");
        $dumpvars(0, HalfAdder_tb);

        // Apply all 4 input combinations
        a = 0; b = 0; #10;
       a = 1; b = 0; #10;
       a = 0; b = 1; #10;

    a = 1; b = 1; #10;

        $finish;
    end
endmodule
