
//-----sub-module; XOR Gate with a and b-----

module xor_gate (
                    input wire a,
                    input wire b,
                    output wire y
                );
                    assign y = a ^ b;
endmodule

//-----sub-module; And Gate-----

module and_gate (
                    input wire a,
                    input wire b,
                    output wire y
                );
                    assign y = a & b;
endmodule

//-----sub-module; OR Gate-----

module or_gate(
                    input wire a,
                    input wire b,
                    output wire y
                );
                    assign y = a | b;
endmodule

//-----sub-module; Half Adder-----

module half_adder (
                   input wire a,
                   input wire b,
                   output wire sum,
                   output wire carry
                   );
        xor_gate u_xor (.a(a), .b(b), .y(sum));
        and_gate u_and (.a(a), .b(b), .y(carry));

endmodule

//-----main module; Full Adder-----

module full_adder (
                   input wire a,
                   input wire b,
                   input wire cin,
                   output sum,
                   output cout
                  );
        wire s1, c1, c2;

        half_adder u_ha1 (.a(a),   .b(b),     .sum(s1),     .carry(c1));
        half_adder u_ha2 (.a(s1),  .b(cin),   .sum(sum),    .carry(c2));
        or_gate    u_or  (.a(c1),  .b(c2),    .y(cout));

endmodule
