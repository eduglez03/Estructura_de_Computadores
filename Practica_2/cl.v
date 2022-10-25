module cl(output wire out, input wire a, input wire b, input wire [1:0] S);

  wire xor_door, not_door, and_door, or_door;
  xor xor1 (xor_door, a, b);
  and and1 (and_door, a, b);
  or or1 (or_door, a, b);
  not not1 (not_door, a);
  mux4_1 mux_used (out, and_door, or:door, xor_door, not_door, S);

endmodule