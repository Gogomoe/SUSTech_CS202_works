module	control32(
	input[5:0]  Opcode,
    input[21:0] Alu_resultHigh,
    input[5:0]  Function_opcode,
    output      Jrn,
    output      RegDST,
    output      ALUSrc,
    output      MemorIOtoReg,
    output      RegWrite,
    output      MemRead,
    output      MemWrite,
    output      IORead,
    output      IOWrite,
    output      Branch,
    output      nBranch,
    output      Jmp,
    output      Jal,
    output      I_format,
    output      Sftmd,
    output[1:0] ALUOp
);

controller_plus controller_plus_inst(
    Opcode,
    Function_opcode,
    Alu_resultHigh,
    RegDST,
    RegWrite,
    ALUSrc,
    MemorIOtoReg,
    MemRead,
    MemWrite,
    IORead,
    IOWrite,
    Jrn,
    Branch,
    nBranch,
    Jmp,
    Jal,
    I_format,
    Sftmd,
    ALUOp
);

endmodule