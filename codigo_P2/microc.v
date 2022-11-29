`include "componentes.v"
`include "memprog.v"
`include "alu.v"

module microc(output wire [5:0] Opcode, output wire zero, carry, input wire clk, reset, s_skip, s_inc, s_inm, we, input wire [2:0] ALUOp);
//Microcontrolador sin memoria de datos de un solo ciclo
    wire [9:0] NewPC, mux_sum_out, mux_skip_out, CurrentPC;
    wire [15:0] Instruction;
    wire [7:0] wd3, rd1, rd2, alu_out, inm;


    mux2 #(10) mux_skip(mux_skip_out[9:0], 10'b1, 10'b2, s_skip); //La salida es mux_sum de acuerdo al archivo "componentes.v"
    sum sum1(NewPC, mux_sum_out, CurrentPC);
    mux2 #(10) mux_sum(mux_sum_out, mux_skip_out[9:0], Instruction);

	registro #(10) pc(CurrentPC, clk, reset, NewPC);

    memprog mp(Instruction, CurrentPC, clk);
	
    
    regfile banco_registro(rd1, rd2, clk, wd3, we, Instruction[11:8], Instruction[7:4], Instruction[3:0]);
	alu alu1(zero, carry, alu_out, ALUOp, rd1, rd2);
	mux2 #(8) mux_banco_registros(wd3, alu_out, Instruction[11:4], s_inm);
	
    
    
    ffd ffz(clk, reset, z_alu, wez, z); // FALTA ESTO QUE NO SE QUE ES

	assign opcode = Instruction [15:10];


endmodule