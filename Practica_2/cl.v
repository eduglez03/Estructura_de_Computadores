module cl(output wire out, input wire a, input wire b, input wire [1:0] S);

  wire xor_out, not_out, and_out, or_out;  // SE DECLARAN LOS CABLES DE SALIDA DE LAS PUESTAS LÓGICAS
  
  and and_door(and_out, a, b);  // SE DECLARA UNA PUERTA AND A LA QUE LE ENTRAN A Y B Y SALE AND_DOOR
  or or_door(or_out, a, b);  // SE DECLARA UNA PUERTA OR A LA QUE LE ENTRAN A Y B Y SALE OR_DOOR
  xor xor_door(xor_out, a, b);  // SE DECLARA UNA PUERTA XOR A LA QUE LE ENTRA A Y B Y SALE EL CABLE XOR_OUT
  not not_door(not_out, a);  // SE DECLARA UNA PUERTA NOT A LA QUE LE ENTRAN A Y SALE NOT_DOOR
  mux4_1 mux_cl(out, xor_out, and_out, or_out, not_out, S);  // DECLARAMOS UN MUX4_1 AL QUE LE ENTRA COMO PARAMETROS LAS SALIDAS DE LAS PUERTAS LÓGICAS ANTERIORES, UNA SEÑAL DE SELECCIÓN S Y DA COMO SALIDA LA SEÑAL OUT DE LA CELDA LOGICA
                                                              
endmodule