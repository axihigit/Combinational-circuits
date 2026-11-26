
//-----------------------------------Test Bench------------------------------------

`timescale 1ns/1ps

module FullAdder_tb;
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;

    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    integer i;
    initial begin
        $dumpfile("FullAdder.vcd");
        $dumpvars(0, FullAdder_tb);

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];
            #10;
        end

        $finish;
    end
endmodule
