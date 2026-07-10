`timescale 1ns/1ps

module alu_tb;

    // Signed inputs
    reg signed [31:0] A;
    reg signed [31:0] B;

    reg [2:0] ALUControl;

    wire [31:0] Result;
    wire Z, N, V, C;

    // Signed view of Result
    wire signed [31:0] Result_signed;
    assign Result_signed = Result;

    // Instantiate ALU
    alu uut(
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .Z(Z),
        .N(N),
        .V(V),
        .C(C)
    );

    initial begin

        $display("--------------------------------------------------------------------------");
        $display("Time\tA\tB\tALU\tResult\tZ N V C");
        $display("--------------------------------------------------------------------------");

        $monitor("%0t\t%0d\t%0d\t%b\t%0d\t%b %b %b %b",
                 $time,
                 A,
                 B,
                 ALUControl,
                 Result_signed,
                 Z, N, V, C);

        // ADD
        A = 10;
        B = 5;
        ALUControl = 3'b000;
        #10;

        // SUB
        A = 10;
        B = 5;
        ALUControl = 3'b001;
        #10;

        // AND
        A = 32'hF0F0F0F0;
        B = 32'h0FF00FF0;
        ALUControl = 3'b010;
        #10;

        // OR
        A = 32'hF0F0F0F0;
        B = 32'h0FF00FF0;
        ALUControl = 3'b011;
        #10;

        // SLT (10 < 20)
        A = 10;
        B = 20;
        ALUControl = 3'b101;
        #10;

        // SLT (20 < 10)
        A = 20;
        B = 10;
        ALUControl = 3'b101;
        #10;

        // Negative result
        A = 15;
        B = 25;
        ALUControl = 3'b001;
        #10;

        // Zero result
        A = 100;
        B = 100;
        ALUControl = 3'b001;
        #10;

        // Carry generation
        A = 32'hFFFFFFFF;
        B = 1;
        ALUControl = 3'b000;
        #10;

        // Positive overflow
        A = 32'h7FFFFFFF;
        B = 1;
        ALUControl = 3'b000;
        #10;

        // Negative overflow
        A = 32'h80000000;
        B = 32'hFFFFFFFF;
        ALUControl = 3'b000;
        #10;

        // Subtraction overflow
        A = 32'h80000000;
        B = 1;
        ALUControl = 3'b001;
        #10;

        $finish;
    end

endmodule