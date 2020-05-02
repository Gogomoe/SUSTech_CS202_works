module test_instruction_decoder(
);

reg        clk, rst;
reg[31:0]  instruction;
reg[31:0]  men_data;
reg[31:0]  alu_result;
wire       jal = instruction[31:26] == 6'b000011;
wire       reg_write = (
                instruction[31:29] == 3'b001 ||
                instruction[31:26] == 6'b100011 ||
                jal ||
                instruction[31:26] == 6'b000000
           ) && !(instruction[31:26] == 6'b000000 && instruction[5:0] == 6'b001000);
wire       mem_to_reg = instruction[31:26] == 6'b100011;
wire       reg_dst = instruction[31:26] == 6'b000000;
reg[31:0]  opcplus4;
wire[31:0] read_data_1;
wire[31:0] read_data_2;
wire[31:0] sign_extend;

instruction_decoder inst1(
    clk, rst,
    instruction,
    men_data,
    alu_result,
    jal,
    reg_write,
    mem_to_reg,
    reg_dst,
    opcplus4,
    read_data_1,
    read_data_2,
    sign_extend
);

initial begin
    rst = 1;
    instruction = 32'b0;
    men_data = 32'b0;
    alu_result = 32'b0;
    opcplus4 = 32'b0;

    #200
    instruction = 32'b000000_00010_00011_00111_100000;
    alu_result = 5;

end

endmodule