module sum4(output wire[3:0] S, output wire c_out, input wire[3:0] A, input wire[3:0] B, input wire c_in);
  
  wire carry1, carry2, carry3;
  
  fa fa_0(S[0], carry1, A[0], B[0], c_in);
  fa fa_1(S[1], carry2, A[1], B[1], carry1);
  fa fa_2(S[2], carry3, A[2], B[2], carry2);
  fa fa_3(S[3], c_out, A[3], B[3], carry3);

 // assign {c_out, sum} = A + B + c_in;   ESTO QUE HACE ?

endmodule