`timescale 1ns / 1ps

module event_counter_tb;

  // Parameters

  // Ports
  reg event_triggered = 0;
  reg rst = 0;
  reg hold = 0;
  wire [7:0] count;

  event_counter event_counter_dut (
      .event_triggered(event_triggered),
      .rst(rst),
      .hold(hold),
      .count(count)
  );

  initial begin
    begin
      $dumpfile("event_counter_tb.vcd");
      $dumpvars;
      test(5);
      $finish;
    end
  end

  task automatic test;
    input integer nTest;
    begin
      #(100);
      hold = 0;
      repeat (nTest) random_event;
      hold = 1;
      repeat (nTest) random_event;
      rst = 1;
      #(10);
      rst = 0;
      #(100);
    end
  endtask  //automatic

  task automatic random_event;
    begin
      #($urandom % 100 + 1);
      event_triggered = 1;
      #($urandom % 10 + 1);
      event_triggered = 0;
    end
  endtask  //automatic

endmodule
