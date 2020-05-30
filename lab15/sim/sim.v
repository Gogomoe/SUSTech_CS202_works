`timescale 1ns / 1ps

module minisys_sim(
);

    reg clk = 0;
    reg rst = 1;
    wire[23:0] led_out;
    
    CPU u (clk, rst, led_out, 24'hzzzzzz);
    initial begin
        #7000 rst = 0;
    end
    always #10 clk=~clk;
        
endmodule
