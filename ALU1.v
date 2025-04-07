module ALU (
    input [3:0] A,
    input [3:0] B,
    input [2:0] SEL,
    output reg [3:0] RESULT,
    output reg CARRY
);
always @(*) begin
    case (SEL)
        3'b000: {CARRY, RESULT} = A + B;      
        3'b001: {CARRY, RESULT} = A - B;      
        3'b010: RESULT = A & B;               
        3'b011: RESULT = A | B;               
        3'b100: RESULT = A ^ B;               
        3'b101: RESULT = ~(A);               
        3'b110: RESULT = A << 1;              
        3'b111: RESULT = A >> 1;              
        default: RESULT = 4'b0000;
    endcase
end
endmodule