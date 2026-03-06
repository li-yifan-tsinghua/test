`timescale 1ns/1ps
module clockwizard
(
        clk_i,
        rst_n,
        clk_o
);
input         clk_i;
input         rst_n;
output         clk_o;
// clock generate
reg clk_o;
reg [4:0] counter;
parameter CLOCK_NUM = 1;
always@(posedge clk_i or negedge rst_n)
begin
        if(~rst_n)
                counter <= 0;
        else if(counter == CLOCK_NUM)
                counter <= 0;
        else
                counter <= counter + 1;
end
always@(posedge clk_i or negedge rst_n)
begin
        if(~rst_n)
                clk_o <= 0;
        else
        begin
                if(counter == CLOCK_NUM)
                        clk_o <= ~clk_o;
                else
                        clk_o <= clk_o;
        end
end
endmodule 