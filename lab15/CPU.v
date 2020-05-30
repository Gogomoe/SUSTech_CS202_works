module CPU(
    input        clk, reset,
    output[23:0] led_out,
    input[23:0]  switch_input
);

wire clock;

wire[31:0] instruction;
wire[31:0] pc_plus_4;
wire[31:0] old_pc_plus_4;

wire[31:0] read_data_1;
wire[31:0] read_data_2;
wire[31:0] read_data;
wire[31:0] alu_result;
wire[31:0] add_result;

wire[31:0] sign_extend;

wire[5:0] opcode = instruction[31:26];
wire[5:0] function_opcode = instruction[5:0];
wire[21:0] alu_result_high = alu_result[31:10];

wire branch;
wire n_branch;
wire jmp;
wire jal;
wire jrn;
wire reg_write;
wire men_io_to_reg;
wire reg_dst;
wire alu_src;
wire zero;
wire i_format;
wire sftmd;
wire[4:0] shamt = instruction[10:6];
wire[1:0] alu_op;

wire men_read;
wire men_write;
wire io_read;
wire io_write;

cpuclk cpuclk_inst(
    .clk_in1(clk),
    .clk_out1(clock)
);


instruction_fetch instruction_fetch_inst(
    clock, reset,
    instruction,
    pc_plus_4,
    old_pc_plus_4,
    add_result,
    read_data_1,
    branch,
    n_branch,
    jmp,
    jal,
    jrn,
    zero
);


controller_plus controller_plus_inst(
    opcode,
    function_opcode,
    alu_result_high,
    reg_dst,
    reg_write,
    alu_src,
    men_io_to_reg,
    men_read,
    men_write,
    io_read,
    io_write,
    jrn,
    branch,
    n_branch,
    jmp,
    jal,
    i_format,
    shamt,
    alu_op
);

instruction_decoder instruction_decoder_inst(
    clock, reset,
    instruction,
    read_data,
    alu_result,
    jal,
    reg_write,
    men_io_to_reg,
    reg_dst,
    old_pc_plus_4,
    read_data_1,
    read_data_2,
    sign_extend
);

execute execute_inst(
    read_data_1,
    read_data_2,
    sign_extend,
    function_opcode,
    opcode,
    alu_op,
    alu_src,
    shamt,
    sftmd,
    i_format,
    zero,
    alu_result,
    add_result,
    pc_plus_4
);

wire led_select;
wire switch_select;
wire[31:0] mem_read_data;
wire[23:0] io_read_data;
wire[31:0] write_data;
wire[31:0] address;

mem_or_io mem_or_io_inst(
    alu_result,
    men_read,
    men_write,
    io_read,
    io_write,
    mem_read_data,
    {8'b0, io_read_data},
    read_data_2,
    read_data,
    write_data,
    address,
    led_select,
    switch_select
);

leds leds_inst(
    clock,
    reset,
    io_write,
    led_select,
    write_data,
    led_out
);

switchs switchs_inst(
    clock,
    reset,
    io_read,
    switch_select,
    io_read_data,
    switch_input
);

memory memory_inst(
    clock,
    address,
    write_data,
    men_write,
    read_data
);

endmodule