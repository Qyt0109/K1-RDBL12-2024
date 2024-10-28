module up_dw_cnt #(
    parameter CNT_WIDTH = 4  //! Bit width of the counter
) (
    input                      clk,    //! Clock signal
    input                      rst,    //! Reset the counter
    input                      en,     //! enable counter
    input                      up_dw,  //! Up/Down (1 for Up, 0 for Down)
    output reg [CNT_WIDTH-1:0] cnt     //! Current count value
);

  always @(posedge clk, posedge rst) begin
    if (rst) cnt <= 0;
    else if (en) cnt <= up_dw ? cnt + 1 : cnt - 1;
  end

endmodule
