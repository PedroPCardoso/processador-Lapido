module clk_div_tb;
  
  reg in_clk;
  wire out_clk;

  clk_div clk_div (
    .in_clk(in_clk), 
    .out_clk(out_clk)
  );

  always #5 in_clk =~in_clk;

  initial begin
    in_clk = 1;
  end   
endmodule