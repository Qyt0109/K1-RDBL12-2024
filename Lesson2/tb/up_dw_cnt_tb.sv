`timescale 1ns / 1ps

module up_dw_cnt_tb;

  // Parameters
  localparam CLK_PERIOD = 10;
  localparam CNT_WIDTH = 4;

  // Ports
  reg                  clk = 0;
  reg                  rst = 0;
  reg                  en = 0;
  reg                  up_dw = 0;
  wire [CNT_WIDTH-1:0] cnt;

  up_dw_cnt #(
      .CNT_WIDTH(CNT_WIDTH)
  ) up_dw_cnt_dut (
      .clk  (clk),
      .rst  (rst),
      .en   (en),
      .up_dw(up_dw),
      .cnt  (cnt)
  );

  initial begin
    begin
      $dumpfile("up_dw_cnt_tb.vcd");
      $dumpvars;
      reset(1);
      nopclk(2);
      up_dw_test(1, 5);
      up_dw_test(0, 3);
      nopclk(2);
      $finish;
    end
  end

  task automatic nopclk;
    input integer n;
    begin
      repeat (n) @(negedge clk);
    end
  endtask  //automatic

  task automatic reset;
    input integer n;
    begin
      rst = 1;
      repeat (n) @(negedge clk);
      rst = 0;
    end
  endtask  //automatic

  task automatic up_dw_test;
    input i_up_dw;
    input integer n;
    begin
      en = 1;
      up_dw = i_up_dw;
      repeat (n) @(negedge clk);
      en = 0;
    end
  endtask  //automatic

  always #(CLK_PERIOD / 2) clk <= !clk;

endmodule
