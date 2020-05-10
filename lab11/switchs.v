`timescale 1ns / 1ps

module switchs(
input       clk,
input       rst,
input       read,           //  read control
input       switch_select,
output reg  [23:0]read_date,
input[23:0] switch_input    //  from the 24 switches of minisys developing boad
);

    always@(negedge clk or posedge rst) begin
        if(rst) begin
            read_date <= 0;
        end

		else if(switch_select && read) begin
		    read_date <= switch_input;
        end
    end
endmodule
