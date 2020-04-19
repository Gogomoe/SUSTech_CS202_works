module ALU(
    input[31:0] data1,
    input[31:0] data2,
    input[31:0] sign_extend,
    input src,
    input[3:0] control,
    output reg[31:0] result,
    output reg zero
);

wire[31:0] data3;
assign data3 = src ? sign_extend : data2;

always @(*) begin
    casex(control)
        4'b0000: result = data1 & data3;
        4'b0001: result = data1 | data3;
        4'b001x: result = data1 + data3;
        4'b0100: result = data1 ^ data3;
        4'b0101: result = ~(data1 | data3);
        4'b011x: result = data1 - data3;
        4'b1000: result = data1 << sign_extend[4:0];
        4'b1010: result = data1 >> sign_extend[4:0];
        4'b1011: result = data1 >>> sign_extend[4:0];
        4'b1100: result = data1 << data2[4:0];
        4'b1110: result = data1 >> data2[4:0];
        4'b1111: result = data1 >>> data2[4:0];
        default: result = 0;
    endcase
    zero = result == 0;
end

endmodule