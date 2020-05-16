module Ifetc32 (
    output[31:0] Instruction,
    output[31:0] PC_plus_4_out,
    input[31:0]  Add_result,
    input[31:0]  Read_data_1,
    input        Branch,
    input        nBranch,
    input        Jmp,
    input        Jal,
    input        Jrn,
    input        Zero,
    input        clock,
    input        reset,
    output[31:0] opcplus4
);

instruction_fetch ins_fetch_inst(
    clock, reset,
    Instruction,
    PC_plus_4_out,
    opcplus4,
    Add_result,
    Read_data_1,
    Branch,
    nBranch,
    Jmp,
    Jal,
    Jrn,
    Zero
);

endmodule