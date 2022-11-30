//Memoria de programa, se inicializa y no se modifica

module memprog(output wire [15:0] Datum,    // Dato que se lee de memoria
               input  wire clk,             // Señal de reloj
               input  wire [9:0] Address);  // Dirección de memoria a la que se accede

  reg [15:0] Mem[0:1023]; //memoria de 1024 palabras de 16 bits de ancho

  initial
  begin
    $readmemb("progfile.dat", Mem); // inicializa la memoria del fichero en texto binario
  end
  assign Datum = Mem[Address];
endmodule


