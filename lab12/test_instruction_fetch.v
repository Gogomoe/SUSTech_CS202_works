`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/07 21:00:51
// Design Name: 
// Module Name: ifetc32_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_instruction_fetch(

    );
    // input
    reg[31:0]  Add_result = 32'h00000000;
    reg[31:0]  Read_data_1 = 32'h00000000;
    reg        Branch = 1'b0;
    reg        nBranch = 1'b0;
    reg        Jmp = 1'b0;
    reg        Jal = 1'b0;
    reg        Jrn = 1'b0;
    reg        Zero = 1'b0;
    reg        clock = 1'b0,reset = 1'b1;

    // output
    wire[31:0] Instruction;            // ï¿½ï¿½ï¿½Ö¸ï¿½ï¿?
    wire[31:0] PC_plus_4_out;
    wire[31:0] opcplus4;
        
    instruction_fetch Uifetch(
        clock, reset,
        Instruction,
        PC_plus_4_out,
        opcplus4,
        Add_result,
        Read_data_1,
        Branch,
        nBranch,
        Jmp,
        Jal,
        Jrn,
        Zero
    );

    initial begin
        #99   reset = 1'b0;
        #100   Jal = 1;
        #100   begin Jrn = 1;Jal = 0; Read_data_1 = 32'h0000019c;end
        #100   begin Jrn = 0;Branch = 1'b1; Zero = 1'b1; Add_result = 32'h00000002;end   
        #100   begin Branch = 1'b0; Zero = 1'b0; end     
    end
    always #50 clock = ~clock;            
endmodule
