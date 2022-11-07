module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);

  always@(Inp[3:0]) begin
    if (clp == 1) begin 
      Out = ~Inp;
    end
    else begin
      Out = Inp;
    end
  end

endmodule