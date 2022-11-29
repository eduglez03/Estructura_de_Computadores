`timescale 1 ns / 10 ps
module microc_tb;

//declaracion de señales

reg t_s_inc, t_s_abs, t_s_inm, t_we3, t_wez; 
reg [2:0] t_op; //2 bits
wire [5:0] t_opcode; //6 bits
wire z;
reg reset;
reg clk;

//Reloj

always
begin  
    clk = 1'b1;
    #20;
    clk = 1'b0;
    #20;
end


//instancia del modulo a testear

microc mc(clk, reset, t_s_abs, t_s_inc, t_s_inm, t_we3, t_wez, t_op, t_z, t_opcode);

initial 
begin
$dumpfile("microc.vcd");
$dumpvars;
end
//Reset

initial
begin
    reset = 1'b1;
    #10;
    reset = 1'b0;
end

initial
begin
// LI 1,R5
#20;
t_s_inc = 1'b1;
t_s_abs = 1'b0;
t_s_inm = 1'b1;
t_we3 = 1'b1;
t_op = 3'b000;
t_wez = 1'b0;

#40;

// L1 1, R4

t_s_inc = 1'b1;
t_s_abs = 1'b0;
t_s_inm = 1'b1;
t_we3 = 1'b1;
t_op = 3'b000;
t_wez = 1'b0;

#40;

// LI 2, R2

t_s_inc = 1'b1;
t_s_abs = 1'b0;
t_s_inm = 1'b1;
t_we3 = 1'b1;
t_op = 3'b000;
t_wez = 1'b0;

#40;

// J CHECK

t_s_inc = 1'b0;
t_s_abs = 1'b1;
t_s_inm = 1'b0;
t_we3 = 1'b0;
t_op = 3'b000;
t_wez = 1'b0;

#40;

// ADD R5, R4, R5

t_s_inc = 1'b1;
t_s_abs = 1'b0;
t_s_inm = 1'b0;
t_we3 = 1'b1;
t_op = 3'b010;
t_wez = 1'b1;

#40;



// JNZ LOOP -> Z = 0

t_s_inc = 1'b1;
t_s_abs = 1'b1;
t_s_inm = 1'b0;
t_we3 = 1'b0;
t_op = 3'b000;
t_wez = 1'b0;

#40;

// JNZ LOOP -> Z = 1

t_s_inc = 1'b1;
t_s_abs = 1'b0;
t_s_inm = 1'b0;
t_we3 = 1'b0;
t_op = 3'b000;
t_wez = 1'b0;

#40;

// SUB R5,R2,R0

t_s_inc = 1'b1;
t_s_abs = 1'b1;
t_s_inm = 1'b0;
t_we3 = 1'b1;
t_op = 3'b011;
t_wez = 1'b1;

#40;

// ADD R5, R4, R5

t_s_inc = 1'b1;
t_s_abs = 1'b0;
t_s_inm = 1'b0;
t_we3 = 1'b1;
t_op = 3'b010;
t_wez = 1'b1;

#40;


//JR END

t_s_inc = 1'b0;
t_s_abs = 1'b0;
t_s_inm = 1'b0;
t_we3 = 1'b0;
t_op = 3'b000;
t_wez = 1'b0;

#40;



$finish;

end 
endmodule