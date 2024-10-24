module adder4b (
    input  [3:0] a,  //! Input value _a_ to be added
    input  [3:0] b,  //! Input value _b_ to be added
    output [3:0] s,  //! Output sum _s = a + b_
    output       o   //! Overflow bit
);

  assign {o, s} = a + b;

endmodule
