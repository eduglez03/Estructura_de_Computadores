module alu(output reg [7:0] S,    // Salida de la ALU
           output reg zero,       // Flag de cero
		       output reg carry,      // Flag de acarreo
           input wire [7:0] A, B, // Operandos
           input wire [2:0] Op    // Elección de operación a realizar
           );
// Una ALU simple que puede realizar 8 operaciones diferentes, y que devuelve el resultado, además de flags de cero y acarreo
	   
always @(A, B, Op)
begin
  case (Op)              
    3'b000: S = A;
    3'b001: S = ~A;
    3'b010: {carry, S} = A + B;
    3'b011: {carry, S} = A - B;
    3'b100: S = A & B;
    3'b101: S = A | B;
    3'b110: S = A ^ B;
    3'b111: {carry, S} = -A;
	default: S = 'bx; //desconocido en cualquier otro caso (x | z), por si se modifica el código
  endcase
  //Calculo del flag de cero
  zero = ~(|S);   //operador de reducción |y hace la or de los bits del vector 'y' y devuelve 1 bit resultado
end
	   
endmodule
