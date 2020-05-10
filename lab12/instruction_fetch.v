module instruction_fetch(
    input        clk, rst,
    output[31:0] instruction,
    output[31:0] pc_plus_4_out,
    output reg[31:0] old_pc_plus_4,
    input[31:0]  add_result,  // use for b/j
    input[31:0]  read_data_1, // use for jr
    input        branch,
    input        n_branch,
    input        jmp,
    input        jal,
    input        jrn,
    input        zero
);

reg[31:0] pc;
assign pc_plus_4_out = pc + 4;

instruction_rom inst(
    .clka(clk),
    .addra(pc[15:2]),
    .douta(instruction)
);

wire [31:0] next_pc_1 = ((zero && branch) || (!zero && n_branch)) ? add_result[31:0] : (pc_plus_4_out >> 2);
wire [31:0] next_pc_2 = (jrn) ? read_data_1[31:0] : next_pc_1;
wire [31:0] next_pc_3 = (jal || jmp) ? {2'b0 , pc[31:28] , instruction[25:0]} : next_pc_2;

always @(negedge clk) begin
    if(rst) begin
        pc <= 32'd0;
    end
    else begin
        pc <= (next_pc_3 << 2);
    end
end

always @(negedge clk) begin
    if(jal) begin
        old_pc_plus_4 <= (pc_plus_4_out >> 2);
    end
end

endmodule