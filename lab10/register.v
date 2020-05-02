module register(
    input clk, rst,
    input[4:0] read_reg1,
    input[4:0] read_reg2,
    input[4:0] write_reg,
    input[31:0] write_data,
    input reg_write,
    output reg[31:0] read_data1,
    output reg[31:0] read_data2
);

reg[31:0] data[31:0];

always @(posedge clk) begin
    if(rst) begin
        data[0] <= 32'b0;
        data[1] <= 32'b0;
        data[2] <= 32'b0;
        data[3] <= 32'b0;
        data[4] <= 32'b0;
        data[5] <= 32'b0;
        data[6] <= 32'b0;
        data[7] <= 32'b0;
        data[8] <= 32'b0;
        data[9] <= 32'b0;
        data[10] <= 32'b0;
        data[11] <= 32'b0;
        data[12] <= 32'b0;
        data[13] <= 32'b0;
        data[14] <= 32'b0;
        data[15] <= 32'b0;
        data[16] <= 32'b0;
        data[17] <= 32'b0;
        data[18] <= 32'b0;
        data[19] <= 32'b0;
        data[20] <= 32'b0;
        data[21] <= 32'b0;
        data[22] <= 32'b0;
        data[23] <= 32'b0;
        data[24] <= 32'b0;
        data[25] <= 32'b0;
        data[26] <= 32'b0;
        data[27] <= 32'b0;
        data[28] <= 32'b0;
        data[29] <= 32'b0;
        data[30] <= 32'b0;
        data[31] <= 32'b0;
    end
    else begin
        if(write_data && write_reg != 0) begin
            data[write_reg] <= write_data;
        end
        read_data1 <= data[read_reg1];
        read_data2 <= data[read_reg2];
    end
end

endmodule