module ul4(output wire[3:0] Out, input wire[3:0] A, input wire[3:0] B, input wire [1:0] S);

  cl cl_0(Out[0], A[0], B[0], S);
  cl cl_1(Out[1], A[1], B[1], S);
  cl cl_2(Out[3], A[2], B[2], S);
  cl cl_3(Out[3], A[3], B[3], S);

endmodule



// NO ENTIENDO COMO SE IMPLEMENTA LA UNIDAD LOGICA