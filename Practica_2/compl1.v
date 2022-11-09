module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);

  assign Out = cpl ? ~Inp : Inp;
  
  // mux2_4 (Out, Inp, ~Inp, cpl); Otra posible forma de implementación

endmodule
