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
