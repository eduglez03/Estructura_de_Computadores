module mux2_4(output wire [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s);
  
  always @(A, B, s) begin
    case (A, B, s)
      2'00: out = A;     // LAS SALIDAS SE ESCRIBREN ASÍ ?
      2'01: out = A;
      2'10: out = B;
      2'11: out = B;
    endcase  
  end 
  
endmodule

