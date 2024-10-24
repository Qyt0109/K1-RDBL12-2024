`timescale 1ns / 1ps

module dff_tb;

  // Parameters
  localparam CLK_PERIOD = 10;

  // Ports
  reg  clk = 0;
  reg  d = 0;
  wire q;

  dff dff_dut (
      .clk(clk),
      .d  (d),
      .q  (q)
  );

  initial begin
    begin
      $dumpfile("./wave/dff_tb.vcd");
      $dumpvars;
      test(10);
      $finish;
    end
  end

  task automatic test;
    input integer nTest;
    begin
      #(CLK_PERIOD * 5);
      repeat (nTest) push($urandom);
      #(CLK_PERIOD * 5);
    end
  endtask  //automatic

  task automatic push;
    input data;
    begin
      d = data;
      @(posedge clk);
    end
  endtask  //automatic

  always #(CLK_PERIOD / 2) clk = !clk;

endmodule
