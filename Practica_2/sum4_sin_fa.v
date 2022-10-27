module sum4(output wire[3:0] S, output wire c_out, input wire[3:0] A, input wire[3:0] B, input wire c_in);// Se hace uso del operador de concatenación:
  assign {c_out, S} = a + b + c_in;
endmodule