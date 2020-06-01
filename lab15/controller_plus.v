module controller_plus(
  input        clk, rst,
  input[5:0]   opcode,
  // instruction[31..26]    
  input[5:0]   function_opcode,
  // instructions[5..0]
  input[21:0]  alu_result_high,
  input        zero,
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
  output[1:0]  alu_op,
  //if it's R-type or I_format=1,bit1 is 1, if it's "beq" or "bne"?,bit 0 is 1
  output[1:0]  write_pc,
  output       write_ir,
  output       write_alu_result
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

assign men_io_to_reg = state == swb && io_read || men_read;
assign men_write = state == smem && sw && !use_io;
assign men_read = lw && !use_io;
assign io_write = state == smem && sw && use_io;
assign io_read = lw && use_io;

assign reg_dst = state == swb && r_type;

assign reg_write = (state == sid && jal == 1) || (state == swb);

assign write_pc = {
    (
        (state == sid && (jmp || jal || jrn)) ||
        (state == sexe && ((branch && zero) || (n_branch && !zero)))
    ),
    (
        (state == sif) ||
        (state == sexe && ((branch && zero) || (n_branch && !zero)))
    )
};

assign write_ir = state == sif;
assign write_alu_result = state == sexe;

assign jmp = opcode == 6'b000010;
assign jal = opcode == 6'b000011;

assign i_format = i_type && !branch && !n_branch && !lw && !sw;

assign alu_op = {(r_type || i_format), (branch || n_branch)};

wire sll = r_type && function_opcode == 6'b000000;
wire srl = r_type && function_opcode == 6'b000010;
wire sra = r_type && function_opcode == 6'b000011;
wire sllv = r_type && function_opcode == 6'b000100;
wire srlv = r_type && function_opcode == 6'b000110;
wire srav = r_type && function_opcode == 6'b000111;

assign shamt = sll || srl || sra || sllv || srlv || srav;

reg [2:0] next_state;
reg [2:0] state;

parameter [2:0] sinit = 3'b000,
                sif   = 3'b001,
                sid   = 3'b010,
                sexe  = 3'b011,
                smem  = 3'b100,
                swb   = 3'b101;

always @ (posedge clk or posedge rst) begin
    if(rst) begin
        state <= sinit;
        end
    else begin
        state <= next_state;
    end
end

always @(*) begin
    case(state)
        sinit: begin next_state = sif; end
        sif: begin next_state = sid; end
        sid: begin
            if(jmp || jal) begin //J-type instruction
                // the next state is sif(instruction fetch)
                next_state = sif;
            end else begin
                // the next state is sexe(instruction execution)
                next_state = sexe;
            end
        end
        sexe: begin
            if(lw || sw) begin
                next_state = smem;
            end else if(branch || n_branch) begin
                next_state = sif;
            end else begin
                next_state = swb;
            end
        end
        smem: begin
            if(lw) begin
                next_state = swb;
            end else begin
                next_state = sif;
            end
        end
        swb: begin next_state = sif; end
        default: begin next_state = sinit; end
    endcase
end
endmodule