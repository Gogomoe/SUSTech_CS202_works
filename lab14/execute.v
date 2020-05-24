module execute(
    input[31:0]      data1,
    input[31:0]      data2,
    input[31:0]      sign_extend,
    input[5:0]       function_opcode,
    input[5:0]       opcode,
    input[1:0]       alu_op,
    input            alu_src,
    input[4:0]       shamt,
    input            sftmd,
    input            i_format,
    output reg       zero,
    output reg[31:0] alu_result,
    output reg[31:0] add_result,
    input[31:0]      pc_plus_4
);

wire[31:0] Ainput = data1;
wire[31:0] Binput;
assign Binput = alu_src ? sign_extend : data2;

wire[5:0] exe_code;
assign exe_code = (i_format == 0) ? function_opcode : {3'b000, opcode[2:0]};

wire[2:0] alu_ctl;
assign alu_ctl[0] = (exe_code[0] | exe_code[3]) & alu_op[1];
assign alu_ctl[1] = ((!exe_code[2]) | (!alu_op[1]));
assign alu_ctl[2] = (exe_code[1] & alu_op[1]) | alu_op[0];

reg[31:0] alu_output_mux;
always @(*) begin
    case(alu_ctl)
        3'b000: alu_output_mux = Ainput & Binput;
        3'b001: alu_output_mux = Ainput | Binput;
        3'b010: alu_output_mux = Ainput + Binput; // sign
        3'b011: alu_output_mux = Ainput + Binput; // unsign
        3'b100: alu_output_mux = Ainput ^ Binput;
        3'b101: alu_output_mux = ~(Ainput | Binput);
        3'b110: alu_output_mux = Ainput - Binput; // sign
        3'b111: alu_output_mux = Ainput - Binput; // unsign
        default: alu_output_mux = 32'd0;
    endcase
end

wire[2:0] sftm;
assign sftm = function_opcode[2:0];

wire signed [31:0] signedBinput = Binput;

reg[31:0] Sinput;
always @(*) begin
    if(sftmd) begin
        case(sftm)
            3'b000: Sinput = Binput << shamt;
            3'b010: Sinput = Binput >> shamt;
            3'b100: Sinput = Binput << Ainput;
            3'b110: Sinput = Binput >> Ainput;
            3'b011: Sinput = signedBinput >>> shamt;
            3'b111: Sinput = signedBinput >>> Ainput;
            default: Sinput = Binput;
        endcase
    end
    else begin
        Sinput = Binput;
    end
end

wire[31:0] A_minus_B = Ainput - Binput;

always @(*) begin
    //set type operation
    if(((alu_ctl==3'b111) && (exe_code[3]==1))||((alu_ctl[2:1]==2'b11) && (i_format==1))) begin
         // A_minus_B[31] == 1  ===  Ainput - Binput < 0
         alu_result = (A_minus_B[31] == 1) ? 1 : 0;
    end
    //lui operation
    else if((alu_ctl==3'b101) && (i_format==1))begin
        alu_result[31:0]={Binput[15:0],{16{1'b0}}};
    end
    //shift operation
    else if(sftmd==1)begin
        alu_result = Sinput;
    end
    //other types of operation in ALU
    else begin
        alu_result = alu_output_mux;
    end
end

always @(*) begin
    zero = alu_result == 0;
end

always @(*) begin
    add_result = (pc_plus_4 >> 2) + sign_extend;
end

endmodule