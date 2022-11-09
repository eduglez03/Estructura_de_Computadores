module mux2_4(output wire [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s);
  
  assign Out = (s) ? B : A;  // En función del valor de s coge A o B
  
endmodule