`timescale 1ns / 1ps

module test_register();

reg clk, rst;

reg[4:0] read_reg1;
reg[4:0] read_reg2;
reg[4:0] write_reg;
reg[31:0] write_data;
reg write;

wire[31:0] read_data1;
wire[31:0] read_data2;

register inst1(
    clk, rst,
    read_reg1, read_reg2,
    write_reg, write_data, write,
    read_data1, read_data2
);

initial fork
    rst = 1;
    clk = 0;
    write = 0;
    
    forever
        #5 clk=~clk;
        
    #8 rst = 0;
    #8 read_reg1 = 5'd0;
    #8 read_reg2 = 5'd1;

    #23 write_reg = 5'd0;
    #23 write_data = 32'h1234;
    #23 write = 1;
    
    #33 write = 0;
    
    #43 write_reg = 5'd1;
    #43 write_data = 32'h4321;
    #43 write = 1;
    
    #53 write = 0;

    #70 $finish;
join


endmodule