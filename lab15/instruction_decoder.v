module instruction_decoder(
    input        clk, rst,
    input[31:0]  instruction,
    input[31:0]  read_data,
    input[31:0]  alu_result,
    input        jal,
    input        reg_write,
    input        men_io_to_reg,
    input        reg_dst,
    input[31:0]  old_pc_plus_4,
    output[31:0] read_data_1,
    output[31:0] read_data_2,
    output[31:0] sign_extend
);

wire[4:0] rs = instruction[25:21];
wire[4:0] rt = instruction[20:16];
wire[4:0] rd = instruction[15:11];

wire[15:0] immediate = instruction[15:0];

register inst(
    clk, rst,
    rs,
    rt,
    jal ? 5'd31    : (reg_dst ? rd : rt),
    jal ? old_pc_plus_4 : (men_io_to_reg ? read_data : alu_result),
    jal || reg_write,
    read_data_1,
    read_data_2
);

assign sign_extend = {{16{immediate[15]}}, immediate};

endmodule