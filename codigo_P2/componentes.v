//Componentes varios

// Banco de registros de dos salidas y una entrada
module regfile(output wire [7:0]  RD1, RD2,     //datos leidos
               input  wire        clk,          // Señal de reloj
               input  wire        we3,          //señal de habilitación de escritura
               input  wire [3:0]  RA1, RA2, WA3,//direcciones de regs leidos y reg a escribir
               input  wire [7:0]  WD3);         //dato a escribir

  reg [7:0] RegBank[0:15]; //memoria de 32 registros de 8 bits de ancho

  initial
  begin
    $readmemb("regfile.dat",RegBank); // inicializa los registros a valores conocidos
  end  
  
  // El registro 0 siempre es cero
  // se leen dos reg combinacionalmente
  // y la escritura del tercero ocurre en flanco de subida del reloj
  always @(posedge clk)
    if (we3) RegBank[WA3] <= WD3;	
  
  assign RD1 = (RA1 != 0) ? RegBank[RA1] : 0;
  assign RD2 = (RA2 != 0) ? RegBank[RA2] : 0;
endmodule

// Sumador simple
module sum(output wire [9:0] Y,     // Salida del sumador
           input  wire [9:0] A, B); // Operandos de la suma

  assign Y = A + B;
endmodule

// Registro de tamaño configurable para modelar el PC. Cambia en cada flanco de subida de reloj o de reset
module registro #(parameter WIDTH = 8)
              (output reg  [WIDTH-1:0] Q,           // Salida del registro
               input  wire             clk, reset,  // Señales de reloj y reseteo
               input  wire [WIDTH-1:0] D);          // Entrada al registro

  always @(posedge clk, posedge reset)
    if (reset) Q <= 0;
    else       Q <= D;
endmodule

// Multiplexor de dos entradas y una salida, de tamaño configurable. Si la señal de selección "s" vale 1, se pone el valor de d1 en la salida; d0 si vale 0
module mux2 #(parameter WIDTH = 8)
             (output wire [WIDTH-1:0] Y,      // Salida del multiplexor
              input  wire [WIDTH-1:0] D0, D1, // Entradas del multiplexor
              input  wire             s);     // Selección

  assign Y = s ? D1 : D0; 
endmodule
