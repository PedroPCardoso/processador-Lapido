module clockFSM();

  reg clk;
  initial begin
    clk=1;
  end

  always @ (posedge clk) begin
    #5;
    clk=~clk;

  end

endmodule;
