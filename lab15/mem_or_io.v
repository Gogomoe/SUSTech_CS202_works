module mem_or_io(
    input[31:0]      calc_address, // alu result
    input            mem_read,
    input            mem_write,
    input            io_read,
    input            io_write,
    input[31:0]      mem_read_data,
    input[31:0]      io_read_data,
    input[31:0]      calc_data,
    output reg[31:0] read_data,
    output reg[31:0] write_data,
    output[31:0]     address,
    output           led_select,
    output           switch_select
);

wire read = mem_read || io_read;
wire write = mem_write || io_write;

always @(*) begin
    if(read) begin
        read_data = io_read ? io_read_data : mem_read_data;
    end
    else begin
        read_data = 32'hZZZZZZZZ;
    end
end

always @(*) begin
    if(write) begin
        write_data = calc_data;
    end
    else begin
        write_data = 32'hZZZZZZZZ;
    end
end

assign address = calc_address;
assign led_select = io_write;
assign switch_select = io_read;

endmodule