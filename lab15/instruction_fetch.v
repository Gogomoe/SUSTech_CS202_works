module instruction_fetch(
    input            clk, rst,
    output[31:0]     instruction,
    output[31:0]     pc_plus_4,
    output reg[31:0] old_pc_plus_4,
    input[31:0]      add_result,  // use for b/j
    input[31:0]      read_data_1, // use for jr
    input            branch,
    input            n_branch,
    input            jmp,
    input            jal,
    input            jrn,
    input            zero,
    input[1:0]       write_pc,
    input            write_ir
);


wire[31:0] read_instruction;

prgrom inst(
    .clka(clk),
    .addra(PC[15:2]),
    .douta(read_instruction)
);

always @(negedge clk) begin
    if(jal) begin
        old_pc_plus_4 <= (pc_plus_4 >> 2);
    end
end

reg [31:0] IR;
reg [31:0] PC;

always @(negedge clk) begin
    if(rst) begin IR <= 0; end
    else if(write_ir) begin IR <= read_instruction; end
    else begin IR <= IR; end
end

always @(negedge clk) begin
    if(rst) begin PC <= 32'b0; end
    else begin
        case(write_pc)
            2'b01: PC <= PC + 4;
            2'b10: PC <= ((jrn ? read_data_1[31:0] : {2'b0 , PC[31:28] , instruction[25:0]}) << 2);
            2'b11: PC <= (add_result[31:0] << 2);
        endcase
    end
end

assign pc_plus_4 = PC;
assign instruction = IR;


endmodule