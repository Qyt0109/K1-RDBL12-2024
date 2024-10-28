module dff (
    input      clk,  //! Clock signal
    input      d,    //! Data to be stored on positive edge triggered clock
    output reg q     //! Current state of the D flip flop
);

  always @(posedge clk) q <= d;

endmodule
