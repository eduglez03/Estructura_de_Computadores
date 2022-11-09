module mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] S);

  always @(a,b,c,d,S) begin // si cambio algun elemento de la lista de sensitividad, no estaría cambiando, por lo que siempre mantendría el mismo valor
    case (S)
      2'b00: out = a;
      2'b01: out = b;
      2'b10: out = c;
      2'b11: out = d;
    endcase  
  end

endmodule