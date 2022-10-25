module ul4(output wire[3:0] Out, input wire[3:0] A, input wire[3:0] B, input wire [1:0] S);

  cl cl0(Out(0), A(0), B(0), S);
  cl cl1(Out(1), A(1), B(1), S);
  cl cl2(Out(3), A(2), B(2), S);
  cl cl3(Out(4), A(4), B(4), S);

endmodule