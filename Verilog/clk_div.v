module clk_div(in_clk, out_clk);
  input  in_clk;
  output out_clk;
  reg    out_clk;

initial begin
  out_clk = 1'b0;
end

always @(posedge in_clk) begin
    out_clk = ~out_clk;
end
endmodule