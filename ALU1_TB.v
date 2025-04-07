`timescale 1ns / 1ps
module ALU_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] SEL;
    wire [3:0] RESULT;
    wire CARRY;

    ALU uut (
        .A(A),
        .B(B),
        .SEL(SEL),
        .RESULT(RESULT),
        .CARRY(CARRY)
    );

    initial begin
        dumpfile("ALU.vcd");
        dumpvars(0,ALU_tb);
        $display("Time\tSEL\tA\tB\tRESULT\tCARRY");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, SEL, A, B, RESULT, CARRY);
        A = 4'b0011; B = 4'b0101; SEL = 3'b000; #10;
        A = 4'b1001; B = 4'b0010; SEL = 3'b001; #10;
        A = 4'b1100; B = 4'b1010; SEL = 3'b010; #10;
        A = 4'b1100; B = 4'b1010; SEL = 3'b011; #10;
        A = 4'b1100; B = 4'b1010; SEL = 3'b100; #10;
        A = 4'b1100; B = 4'b0000; SEL = 3'b101; #10;
        A = 4'b0011; B = 4'b0000; SEL = 3'b110; #10;
        A = 4'b1010; B = 4'b0000; SEL = 3'b111; #10;
        $finish;
    end

endmodule
