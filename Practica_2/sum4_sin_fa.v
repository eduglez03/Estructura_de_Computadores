module sum4_sin_fa(output wire[3:0] S, output wire c_out, input wire[3:0] A, input wire[3:0] B, input wire c_in);// Se hace uso del operador de concatenación:
  assign {c_out, S} = a + b + c_in; // El c_out y el S deben ir en ese orden ya que es el bit más significativo de la operación
endmodule

