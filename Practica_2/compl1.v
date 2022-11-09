module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);

  assign Out = cpl ? ~Inp : Inp; // SE PUEDE HACER CON PUERTAS XOR

  // mux2_4 mux_compl1 (Out, Inp, ~Inp, cpl); 

  /*
    xor compl1_1(Out[0], Inp[0], cpl);
    xor compl1_2(Out[1], Inp[1], cpl);
    xor compl1_3(Out[2], Inp[2], cpl);
    xor compl1_4(Out[3], Inp[3], cpl);
  */

endmodule