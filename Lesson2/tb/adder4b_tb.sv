module adder4b_tb;

  // Parameters

  // Ports
  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] s;
  wire o;

  adder4b adder4b_dut (
      .a(a),
      .b(b),
      .s(s),
      .o(o)
  );

  initial begin
    begin
      $dumpfile("adder4b_tb.vcd");
      $dumpvars;
      test(10);
      $finish;
    end
  end

  task automatic test;
    input integer nTest;
    begin
      repeat (nTest) add($urandom, $urandom);
    end
  endtask  //automatic

  task automatic add;
    input [3:0] a_val;
    input [3:0] b_val;
    begin
      a = a_val;
      b = b_val;
      #1;
      $display("%d + %d = %d %1s", a, b, s, o ? "[OVERFLOWED]" : "");
    end
  endtask  //automatic


endmodule
