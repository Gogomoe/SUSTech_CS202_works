`timescale 1ns / 1ps

module minisys_sim(
);

    reg clk = 0;
    reg rst = 1;
    wire[23:0] led_out;
    reg[23:0] sw_input = 24'h000000;
    
    minisys_sc u(clk, rst, led_out, sw_input);
    initial begin
        #700 rst = 0;
        #900 sw_input = 24'h100055;
        #900 sw_input = 24'h200055;
        #900 sw_input = 24'h300000;
        #900 sw_input = 24'h500000;
        #900 sw_input = 24'h600000;
        #900 sw_input = 24'h700000;
    end
    always #1 clk=~clk;
        
endmodule
