module minisys_sc(
    input clk, rst,
    output[23:0] led,
    input[23:0] switch
);

wire clock;

wire[31:0] Instruction;
wire[31:0] PC_plus_4;
wire[31:0] opcplus4;

wire[31:0] read_data_1;
wire[31:0] read_data_2;
wire[31:0] read_data;
wire[31:0] ALU_result;
wire[31:0] Add_result;

wire[31:0] Sign_extend;

wire[5:0] Opcode = Instruction[31:26];
wire[5:0] Function_opcode = Instruction[5:0];
wire[21:0] Alu_resultHigh = ALU_result[31:10];

wire Branch;
wire nBranch;
wire Jmp;
wire Jal;
wire Jrn;
wire RegWrite;
wire MemtoReg;
wire RegDst;
wire ALUSrc;
wire Zero;
wire I_format;
wire Sftmd;
wire[4:0] Shamt = Instruction[10:6];
wire[1:0] ALUOp;

wire MemRead;
wire MemWrite;
wire IORead;
wire IOWrite;

cpuclk cpuclk_inst(
    .clk_in1(clk),
    .clk_out1(clock)
);


Ifetc32 Ifetc32_inst(
    Instruction,
    PC_plus_4,
    Add_result,
    read_data_1,
    Branch,
    nBranch,
    Jmp,
    Jal,
    Jrn,
    Zero,
    clock,
    rst,
    opcplus4
);

control32 control32_inst(
    Opcode,
    Alu_resultHigh,
    Function_opcode,
    Jrn,
    RegDst,
    ALUSrc,
    MemtoReg,
    RegWrite,
    MemRead,
    MemWrite,
    IORead,
    IOWrite,
    Branch,
    nBranch,
    Jmp,
    Jal,
    I_format,
    Sftmd,
    ALUOp
);

Idecode32 Idecode32_inst(
    read_data_1,
    read_data_2,
    Instruction,
    read_data,
    ALU_result,
    Jal,
    RegWrite,
    MemtoReg,
    RegDst,
    Sign_extend,
    clock,
    rst,
    opcplus4
);

Executs32 Executs32_inst(
    read_data_1,
    read_data_2,
    Sign_extend,
    Function_opcode,
    Opcode,
    ALUOp,
    Shamt,
    ALUSrc,
    I_format,
    Zero,
    Jrn,
    Sftmd,
    ALU_result,
    Add_result,
    PC_plus_4
);

wire led_select;
wire switch_select;
wire[31:0] mem_read_data;
wire[23:0] io_read_data;
wire[31:0] write_data;
wire[31:0] address;

mem_or_io mem_or_io_inst(
    ALU_result,
    MemRead,
    MemWrite,
    IORead,
    IOWrite,
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
    clock,       // clock
    rst,       // rst
    IOWrite,     // write enable
    led_select,  // select led
    write_data,
    led
);

switchs switchs_inst(
    clock,
    rst,
    IORead,
    switch_select,
    io_read_data,
    switch
);

dmemory32 dmemory32_inst(
    mem_read_data,
    address,
    write_data,
    MemWrite,
    clock
);

endmodule