module test_controller(
  
);
reg[5:0]   opcode;
reg[5:0]   function_opcode;
wire       reg_dst;
wire       reg_write;
wire       alu_src;
wire       men_to_reg;
wire       men_write;
wire       jrn;
wire       branch;
wire       n_branch;
wire       jmp;
wire       jal;
wire       i_format;
wire       shamt;
wire[1:0]  alu_op;

controller inst(
    opcode,
    function_opcode,
    reg_dst,
    reg_write,
    alu_src,
    men_to_reg,
    men_write,
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
    // add
    opcode = 6'b000000;
    function_opcode = 6'b100000;
    #200
    // jr
    opcode = 6'b000000;
    function_opcode = 6'b001000;
    #200
    // addi
    opcode = 6'b001000;
    function_opcode = 6'b000000;
    #200
    // lw
    opcode = 6'b100011;
    #200
    // sw
    opcode = 6'b101011;
    #200
    // beq
    opcode = 6'b000100;
    #200
    // bne
    opcode = 6'b000101;
    #200
    // j
    opcode = 6'b000010;
    #200
    // jal
    opcode = 6'b000011;
    #200
    // srl
    opcode = 6'b000000;
    function_opcode = 6'b000010;
    #200
    $finish;
end

endmodule