module clockFSM();

  reg clk;
  initial begin
    clk=0;
  end

  always @ (clk) begin
    #5;
    clk=~clk;
  
  end

endmodule;
