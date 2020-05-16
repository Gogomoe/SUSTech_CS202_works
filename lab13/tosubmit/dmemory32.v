module dmemory32(
    output[31:0] read_data,
    input[31:0]  address,
    input[31:0]  write_data,
    input        Memwrite,
    input        clock
);

memory memory_inst(
    clock,
    address,
    write_data,
    Memwrite,
    read_data
);

endmodule