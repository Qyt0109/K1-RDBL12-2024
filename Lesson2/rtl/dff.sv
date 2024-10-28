module dff #(
    parameter DATA_WIDTH = 1
) (
    input                       clk,  //! Clock signal
    input      [DATA_WIDTH-1:0] d,    //! Data to be stored on positive edge triggered clock
    output reg [DATA_WIDTH-1:0] q     //! Current state of the D flip flop
);

  always @(posedge clk) q <= d;

endmodule
