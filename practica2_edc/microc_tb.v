`timescale 1 ns/10 ps /// Directiva para el tiempo de simulación

module micro_tb;

  /// Señales (salidas)
  wire [5:0] Opcode_test;
  wire zero_test, carry_test;

  /// Señales (entradas)
  reg s_inc_test, s_skip_test, we_test, s_inm_test;
  reg [2:0] ALUOp_test;
  reg clk_test, reset_test;

  /// Módulo
  microc micro_test(Opcode_test, zero_test, carry_test, clk_test, reset_test, s_skip_test, s_inc_test, s_inm_test, we_test, ALUOp_test);

  /// Reloj
  always
    begin
      clk_test <= 1'b1;
      #20;
      clk_test <= 1'b0;
      #20;
    end
  
  /// Reset inicial
  initial
    begin
      reset_test <= 1'b1;
      #3;
      reset_test <= 1'b0;
      #2;
    end

  /// Pruebas
  initial 
    begin
      $monitor("ALU(%b) we(%b) skip(%b) inc(%b) inm(%b)", ALUOp_test, we_test, s_skip_test, s_inc_test, s_inm_test);
      $dumpfile("micro_tb.vcd");
      $dumpvars;

      /// Decodificación
      #20;
      /// LI #3, R1
      /// 0000_0000_0010_0001
      ALUOp_test = 000; /// Nos da igual
      we_test = 1;
      s_skip_test = 0;
      s_inm_test = 1;
      s_inc_test = 1;
      #40;

      /// LI #1, R2
      /// 0000_0000_0001_0010
      ALUOp_test = 000; /// Nos da igual
      we_test = 1;
      s_skip_test = 0;
      s_inc_test = 1;
      s_inm_test = 1;
      #40;

      /// ADD R1, R2, R3 (3 + 1 = 4 = 0100)
      ALUOp_test = 010; /// Suma
      we_test = 1;
      s_skip_test = 0;
      s_inc_test = 1;
      s_inm_test = 0;
      #40;

      /// SUB R2, R2, R4 (1 + 1 = 0 = 0000)
      ALUOp_test = 011; /// Resta
      we_test = 1;
      s_skip_test = 0;
      s_inc_test = 1;
      s_inm_test = 0;
      #40;

      /// Salto incondicional
      ALUOp_test = 000; /// Nos da igual
      we_test = 0;
      s_skip_test = 0; /// Nos da igual
      s_inc_test = 0;
      s_inm_test = 0; /// Nos da igual
      #40;

      $finish;
    end
endmodule