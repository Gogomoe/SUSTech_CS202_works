module memory(
    input clk,
    input[31:0] address,
    input[31:0] write_data,
    input write,
    output[31:0] read_data
);

RAM ram (
    .clka(!clk),
    .wea(write),
    .addra(address[15:2]),
    .dina(write_data),
    .douta(read_data)
);

endmodule