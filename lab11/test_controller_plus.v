module test_controller_plus(
);

reg[5:0]   opcode;
reg[5:0]   function_opcode;
reg[21:0]  alu_result_high;
wire       reg_dst;
wire       reg_write;
wire       alu_src;
wire       men_io_to_reg;
wire       men_read;
wire       men_write;
wire       io_read;
wire       io_write;
wire       jrn;
wire       branch;
wire       n_branch;
wire       jmp;
wire       jal;
wire       i_format;
wire       shamt;
wire[1:0]  alu_op;

controller_plus inst(
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

initial begin
    opcode = 6'b0;
    function_opcode = 6'b0;
    alu_result_high = 22'b0;
    #100
    opcode = 6'b001000; // ADDI
    #100
    opcode = 6'b100011; // LW
    #100
    opcode = 6'b101011; // SW

    #100
    alu_result_high = 22'h3FFFFF;
    opcode = 6'b100011; // LW IO
    #100
    opcode = 6'b101011; // sw IO

    #100
    opcode = 6'b0;
    function_opcode = 6'b001000; // JR
    #100
    opcode = 6'b000100; // BEQ
    #100
    opcode = 6'b000101; // BNE
    #100
    opcode = 6'b000010; // JMP
    #100
    opcode = 6'b000011; // JAL
    #100
    opcode = 6'b000000; // SRL
    function_opcode = 6'b000010;

    #100 $finish;
end

endmodule