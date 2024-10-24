module dff (
    input      clk,  //! Clock
    input      d,    //! Data to be stored at the next clock edge
    output reg q     //! The current state and also the output of the D-FF
);

  always @(posedge clk) q <= d;

endmodule
