module shift_reg #(
    parameter DEPTH = 4  //! Depth of the shift register
) (
    input                  clk,  //! Clock signal to trigger data shift on rising edge
    input                  rst,  //! Reset signal to initialize the register to 0
    input                  en,   //! Enable signal to allow shifting when high
    input                  d,    //! Data input for the shift register
    output reg [DEPTH-1:0] q     //! Output of the shift register holding the shifted data
);

  always @(posedge clk, posedge rst) begin
    if (rst) q <= 0;  // Reset the register to 0 when rst is high
    else if (en) q <= {d, q[DEPTH-1:1]};  // Shift data in when enable is high
  end

endmodule
