module event_counter (
    input            event_triggered,  //! Event occurred, increment the count
    input            rst,              //! Reset the count to zero
    input            hold,             //! Hold the current count even if an event is triggered
    output reg [7:0] count = 0         //! Count the number of events that have occurred
);

  always @(posedge event_triggered or posedge rst) begin
    if (rst) begin
      count <= 0;
    end else begin
      if (!hold) count <= count + 1;
    end
  end

endmodule
