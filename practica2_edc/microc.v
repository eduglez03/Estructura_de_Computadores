module microc(output wire [5:0] Opcode, output wire zero, carry, input wire clk, reset, s_skip, s_inc, s_inm, we, input wire [2:0] ALUOp);
  //Microcontrolador sin memoria de datos de un solo ciclo
  wire[9:0] NewPC, CurrentPC, Offset, skip_out, inc_out;
  wire[15:0] Instruction;

  registro #(10) program_counter(CurrentPC, clk, reset, NewPC);
  memprog memoria_instrucciones(Instruction, clk, CurrentPC);
  mux2 #(10) mux_skip(skip_out, 10'b0000000001, 10'b0000000010, s_skip);
  mux2 #(10) mux_inc(inc_out, Offset, skip_out, s_inc);
  sum sumador_program_counter(NewPC, inc_out, CurrentPC);
  
  wire[3:0] WA3, RA2, RA1;
  wire[7:0] Inm, WD3, Output_ALU, RD1, RD2;
  assign Opcode = Instruction[15:10];
  assign Inm = Instruction[11:4];
  assign WA3 = Instruction[3:0];
  assign RA2 = Instruction[7:4];
  assign RA1 = Instruction[11:8];
  
  assign Offset = Instruction[9:0];
   
  mux2 #(8) mux_inm(WD3, Output_ALU, Inm, s_inm);
  alu alu1(Output_ALU, zero, carry, RD1, RD2, ALUOp);
  regfile regfile1(RD1, RD2, clk, we, RA1, RA2, WA3, WD3);

endmodule