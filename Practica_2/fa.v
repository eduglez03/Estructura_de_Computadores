module fa(output wire c_out, sum, input wire a, b, c_in);
  
  wire sum1, carry1, carry2;

  fa fa_1(sum1, carry1, a, b);
  fa fa_2(sum, carry2, c_in, sum1);
  or or_1(c_out, carry1, carry2);
  
  
  assign {c_out, sum} = A + B + c_in;
 
endmodule