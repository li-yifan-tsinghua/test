`timescale 1ns/1ps

module tb_clockwizard;

// 信号声明
reg clk_i;
reg rst_n;
wire clk_o;

// 实例化被测模块
clockwizard uut (
    .clk_i(clk_i),
    .rst_n(rst_n),
    .clk_o(clk_o)
);

// 时钟产生：周期为10ns（每5ns翻转一次）
initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
end

// 复位生成：初始时复位有效，20ns后复位释放
initial begin
    rst_n = 0;
    #20 rst_n = 1;
end

// 仿真监视和结束控制
initial begin
    $monitor("Time = %0t | rst_n = %b | clk_i = %b | clk_o = %b", $time, rst_n, clk_i, clk_o);
    #200 $finish;  // 仿真200ns后结束
end

endmodule
