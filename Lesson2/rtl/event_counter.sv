module event_counter (
    input            event_triggered,  //! Event occurred, increment the count
    input            rst,              //! Reset the count to zero
    input            hold,             //! Hold the current count even if an event is triggered
    output reg [7:0] count = 0         //! Count the number of events that have occurred
);

  always @(posedge event_triggered, posedge rst) begin
    if (rst) count <= 0;
    else if (!hold) count <= count + 1;
  end

endmodule
