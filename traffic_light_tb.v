`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg rst;
wire [1:0] light;

traffic_light dut(
    .clk(clk),
    .rst(rst),
    .light(light)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #10 rst = 0;

    #200;

    $finish;
end

initial
begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, traffic_light_tb);
end

endmodule