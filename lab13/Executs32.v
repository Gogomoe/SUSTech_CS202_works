module Executs32 (
    input[31:0]  Read_data_1,
    input[31:0]  Read_data_2,
    input[31:0]  Sign_extend,
    input[5:0]   Function_opcode,
    input[5:0]   Exe_opcode,
    input[1:0]   ALUOp,
    input[4:0]   Shamt,
    input        ALUSrc,
    input        I_format,
    input        Zero,
    input        Jrn,
    input        Sftmd,
    output[31:0] ALU_Result,
    output[31:0] Add_Result,
    input[31:0]  PC_plus_4
);

execute execute_inst(
    Read_data_1,
    Read_data_2,
    Sign_extend,
    Function_opcode,
    Exe_opcode,
    ALUOp,
    ALUSrc,
    Shamt,
    Sftmd,
    I_format,
    Zero,
    ALU_Result,
    Add_Result,
    PC_plus_4
);

endmodule