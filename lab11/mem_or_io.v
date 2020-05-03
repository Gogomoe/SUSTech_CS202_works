module mem_or_io(
    input[31:0]  calc_address, // alu result
    input        mem_read,
    input        mem_write,
    input        io_read,
    input        io_write,
    input[31:0]  mem_read_data,
    input[31:0]  io_read_data,
    input[31:0]  calc_data,
    output[31:0] read_data,
    output[31:0] write_data,
    output[31:0] address,
    output       LEDCtrl,
    output       SwitchCtrl
);

// TODO finish the module

endmodule