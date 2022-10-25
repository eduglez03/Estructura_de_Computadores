module mux2_4(output wire [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s);

  always @(a,b,c,d, S) begin
    case (S)
      2'00: out = a;
      2'01: out = b;
      2'10: out = c;
      2'11: out = d;
    endcase  
  end

endmodule
