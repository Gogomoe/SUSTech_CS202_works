`timescale 1ns / 1ps

module test_ALU();

reg src;
reg[3:0] control;
wire[31:0] result;
wire zero;

ALU inst1(
    32'ha011,
    32'ha011,
    32'h4321,
    src, control,
    result, zero
);

initial begin
    control = 0;
    src = 0;

    repeat(7)
        #5 control = (control + 1);

    #5 control = 4'b1100;
    #5 control = 4'b1110;
    #5 control = 4'b1111;

    #5
    src = 1;
    control = 0;

    repeat(7)
        #5 control = (control + 1);

    #5 control = 4'b1000;
    #5 control = 4'b1010;
    #5 control = 4'b1011;

    #5 $finish;
end

endmodule