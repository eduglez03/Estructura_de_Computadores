module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire l);

  wire op1_A, op2_B, cpl, cin0;
  wire [3:0] OP1, OP2, mux2_out, sum4_out, ul4_out;

  mux2_4 mux2_4_1 (OP1, 4'b0000, A, op1_A);
  mux2_4 mux2_4_2 (mux2_out, A, B, op2_B);
  compl1 compl1_1 (OP2, mux2_out, cpl);
  sum4 sum4_1 (sum4_out, carry, OP1, OP2, cin0);
  ul4 ul4_1 (ul4_out, OP1, OP2, ALUOp);
  mux2_4 mux2_4_3 (R, sum4_out, ul4_out, l);

  assign zero = ~(R[0]|R[1]|R[2]|R[3]); // se puede hacer con un operacdor ternario
  assign sign = R[3]; // Es un 3 por que es el bit mas significativo

  assign op1_A = l | ALUOp[1];
  assign op2_B = l | ALUOp[1] | ALUOp[0];
  assign cpl = ((~l) & (~ALUOp[1])) | ((~l) & ALUOp[0]);
  assign cin0 = (~ALUOp[1]) | ALUOp[0];

endmodule

// EJECUCION
// $ iverilog -o ripple ripple_carry_adder.v ripple_carry_adder_tb.v
// $ vvp ripple