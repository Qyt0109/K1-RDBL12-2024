module shift_reg_tb;

  // Parameters
  localparam CLK_PERIOD = 10;
  localparam DEPTH = 4;

  // Ports
  reg clk = 0;
  reg rst = 0;
  reg en = 0;
  reg d = 0;
  wire [DEPTH-1:0] q;

  shift_reg #(
      .DEPTH(DEPTH)
  ) shift_reg_dut (
      .clk(clk),
      .rst(rst),
      .en (en),
      .d  (d),
      .q  (q)
  );

  initial begin
    begin
      $dumpfile("shift_reg_tb.vcd");
      $dumpvars;
      reset(1);
      nopclk(2);
      test($urandom, 10);
      nopclk(2);
      $finish;
    end
  end

  task automatic test;
    input integer seq;
    input integer n;
    integer seq_idx;
    begin
      seq_idx = 0;
      en = 1;
      repeat (n) begin
        d = seq[seq_idx];
        @(negedge clk);
        seq_idx = seq_idx + 1;
      end
      en = 0;
    end
  endtask  //automatic

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

  always #(CLK_PERIOD / 2) clk <= !clk;

endmodule
