module test_memory();

reg [31:0] address = 32'h0000_0010;
reg [31:0] write_data = 32'hA000_0000;
reg write = 1'b0;
reg clk = 1'b0;
wire [31:0] read_data;

memory uram(
    clk,
    address,
    write_data,
    write,
    read_data
);

always
    #50 clk = ~clk;

initial begin
    #200
    write_data = 32'hA000_00F5;
    write = 1'b1;
    #200 write = 1'b0;
end
endmodule