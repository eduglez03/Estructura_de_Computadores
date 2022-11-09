module fa(output wire c_out, sum, input wire a, b, c_in);
  
  assign {c_out, sum} = a + b + c_in; // si cambias el orden afecta porque es el mas significativo
 
endmodule