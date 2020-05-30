`timescale 1ns / 1ps

module leds(
    input            clk,         // clock
    input            rst,         // reset
    input            write,       // write enable
    input            led_select,  // select led
    input[23:0]      write_data,
    output reg[23:0] led_out
);

    always@(posedge clk or posedge rst) begin
        if(rst) begin
            led_out <= 24'h000000;
        end
		else if(led_select && write) begin
	        led_out <= write_data;
        end
    end

endmodule
