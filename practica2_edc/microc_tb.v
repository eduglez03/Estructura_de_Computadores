`timescale 1 ns/10 ps // Directiva para el tiempo de simulación

module micro_tb;

  // Señales (salidas)
  wire [5:0] Opcode_test;
  wire zero_test, carry_test;

  // Señales (entradas)
  reg s_inc_test, s_skip_test, we_test, s_inm_test;
  reg [2:0] ALUOp_test;
  reg clk_test, reset_test;

  // Módulo
  microc micro_test(Opcode_test, zero_test, carry_test, clk_test, reset_test, s_skip_test, s_inc_test, s_inm_test, we_test, ALUOp_test);

  // Reloj
  always
    begin
      clk_test <= 1'b1;
      #20;
      clk_test <= 1'b0;
      #20;
    end
  
  // Reset inicial
  initial
    begin
      reset_test <= 1'b1;
      #3;
      reset_test <= 1'b0;
      #2;
    end

  // Pruebas
  initial 
    begin

// 0000_0000_0011_0100
// 0000_0000_0010_0001
// 0000_0000_0111_0111
// 0001_0100_0111_0001
// 0010_0000_0000_1001
// 0011_0111_0100_0001
// 0100_0111_0100_1010
// 0101_0100_0001_0100
// 0010_0000_0000_0011
// 0010_0000_0000_1001





      $monitor("ALU(%b) we(%b) skip(%b) inc(%b) inm(%b)", ALUOp_test, we_test, s_skip_test, s_inc_test, s_inm_test);
      $dumpfile("micro_tb.vcd");
      $dumpvars;

      #20;
      // INSTNATE 20
      // LI #3, R4
      // 0000_0000_0011_0100
      ALUOp_test = 3'b000;
      we_test = 1;
      s_skip_test = 0;
      s_inm_test = 1;
      s_inc_test = 1;
      #40;
      // INSTNATE 60
      // LI #2, R1
      // 0000_0000_0010_0001
      ALUOp_test = 3'b000;
      we_test = 1;
      s_skip_test = 0;
      s_inm_test = 1;
      s_inc_test = 1;
      #40;

      // INSTNATE 100
      // LI #7, R7
      // 0000_0000_0111_0111
      ALUOp_test = 3'b000;
      we_test = 1;
      s_skip_test = 0;
      s_inm_test = 1;
      s_inc_test = 1;
      #40;

    // BUCLE 

      // INSTNATE 140
      // SKIPNE R4, R7 
      // 0001_0100_0111_0001
      ALUOp_test = 011; // Resta R4 - R7
      we_test = 1;
      s_skip_test = 1;
      s_inm_test = 0;
      s_inc_test = 1;
      #40;

      // INSTNATE 180
      // SKIPGT R7, R4
      // 0011_0111_0100_0001
      ALUOp_test = 011; 
      we_test = 1;
      s_skip_test = 1; 
      s_inc_test = 0;
      s_inm_test = 1; 
      #40;    


      // INSTNATE 220
      // ADD R4, R1, R4
      // 0101_0100_0001_0100
      ALUOp_test = 010; // Suma
      we_test = 1;
      s_skip_test = 0;
      s_inc_test = 1;
      s_inm_test = 0;
      #40;
      

// BUCLE SEGUNDA PASADA

      // INSTNATE 260
      // SKIPNE R4, R7 
      // 0001_0100_0111_0001
      ALUOp_test = 011; // Resta R4 - R7
      we_test = 1;
      s_skip_test = 1;
      s_inm_test = 0;
      s_inc_test = 1;
      #40;


      // INSTNATE 300
      // SKIPGT R7, R4
      // 0011_0111_0100_0001
      ALUOp_test = 011; 
      we_test = 1;
      s_skip_test = 1; 
      s_inc_test = 0;
      s_inm_test = 1; 
      #40;    

      // INSTNATE 340
      // ADD R4, R1, R4
      // 0101_0100_0001_0100
      ALUOp_test = 010; // Suma
      we_test = 1;
      s_skip_test = 0;
      s_inc_test = 1;
      s_inm_test = 0;
      #40;


// BUCLE 2 FIN 

      // INSTNATE 380
      // SKIPNE R4, R7 
      // 0001_0100_0111_0001
      ALUOp_test = 011; // Resta R4 - R7
      we_test = 1;
      s_skip_test = 0;
      s_inm_test = 0;
      s_inc_test = 1;
      #40;

      // INSTNATE 420
      // FIN DEL PROGRAMA
      // 0010_0000_0000_1001
      ALUOp_test = 3'b000; 
      we_test = 0;
      s_skip_test = 0; 
      s_inc_test = 0;
      s_inm_test = 0; 
      #40;

      // INSTNATE 460
      // 
      // 0010_0000_0000_1001
      ALUOp_test = 3'b000; 
      we_test = 0;
      s_skip_test = 0; 
      s_inc_test = 0;
      s_inm_test = 0; 
      #40;
      // 
      // INSTNATE 500

      // 0010_0000_0000_1001
      ALUOp_test = 3'b000; 
      we_test = 0;
      s_skip_test = 0; 
      s_inc_test = 0;
      s_inm_test = 0; 
      #40;
      // 
      // INSTNATE 540

      // 0010_0000_0000_1001
      ALUOp_test = 3'b000; 
      we_test = 0;
      s_skip_test = 0; 
      s_inc_test = 0;
      s_inm_test = 0; 
      #40;

      $finish;
    end
endmodule