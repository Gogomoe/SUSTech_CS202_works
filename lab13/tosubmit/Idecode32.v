module Idecode32(
    output[31:0] read_data_1,
    output[31:0] read_data_2,
    input[31:0]  Instruction,
    input[31:0]  read_data,
    input[31:0]  ALU_result,
    input        Jal,
    input        RegWrite,
    input        MemtoReg,
    input        RegDst,
    output[31:0] Sign_extend,
    input        clock,
    input        reset,
    input[31:0]  opcplus4
);

instruction_decoder instruction_decoder_inst(
    clock, reset,
    Instruction,
    read_data,
    ALU_result,
    Jal,
    RegWrite,
    MemtoReg,
    RegDst,
    opcplus4,
    read_data_1,
    read_data_2,
    Sign_extend
);


endmodule