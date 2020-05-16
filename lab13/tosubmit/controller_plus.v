module controller_plus(
  input[5:0]   opcode,
  // instruction[31..26]    
  input[5:0]   function_opcode,
  // instructions[5..0]
  input[21:0]  alu_result_high,
  // from alu_result[31..10], help determine whether to process Mem or IO
  output       reg_dst,
  //1 indicate destination register is "rd",otherwise it's "rt"    
  output       reg_write,
  //1 indicate write register, otherwise it's not
  output       alu_src,
  //1 indicate the 2nd data is immidiate (except "beq","bne")    
  output       men_io_to_reg,
  //1 indicate read data from memory or io and write it into register
  output       men_read,
  output       men_write,
  output       io_read,
  output       io_write,
  //1 indicate write data into memory
  output       jrn,
  //1 indicates the instruction is "jr", otherwise it's not "jr"    
  output       branch,
  //1 indicate the instruction is "beq" , otherwise it's not
  output       n_branch,
  //1 indicate the instruction is "bne", otherwise it's not
  output       jmp,
  //1 indicate the instruction is "j", otherwise it's not
  output       jal,
  //1 indicate the instruction is "jal", otherwise it's not
  output       i_format,
  //1 indicate the instruction is I-type but isn't "beq","bne","LW" or "SW"
  output       shamt,
  //1 indicate the instruction is shift instruction
  output[1:0]  alu_op
  //if it's R-type or I_format=1,bit1 is 1, if it's "beq" or "bne"?,bit 0 is 1
);

wire r_type = opcode == 6'b000000;
wire j_type = jmp || jal;
wire i_type = !r_type && !j_type;

assign jrn = opcode == 6'b000000 && function_opcode == 6'b001000;

assign branch = opcode == 6'b000100;
assign n_branch = opcode == 6'b000101;

assign alu_src = i_type && !branch && !n_branch;

wire lw = opcode == 6'b100011;
wire sw = opcode == 6'b101011;
wire use_io = alu_result_high[21:0] == 22'H3FFFFF;

assign men_io_to_reg = io_read || men_read;
assign men_write = sw && !use_io;
assign men_read = lw && !use_io;
assign io_write = sw && use_io;
assign io_read = lw && use_io;

assign reg_dst = r_type;

assign reg_write = (opcode[5:3] == 3'b001 || lw || jal || r_type) && !jrn;

assign jmp = opcode == 6'b000010;
assign jal = opcode == 6'b000011;

assign i_format = i_type && !branch && !n_branch && !lw && !sw;

assign alu_op = {(r_type || i_format), (branch || n_branch)};

wire sll = r_type && function_opcode == 6'b000000;
wire srl = r_type && function_opcode == 6'b000010;
wire sra = r_type && function_opcode == 6'b000011;

assign shamt = sll || srl || sra;

endmodule