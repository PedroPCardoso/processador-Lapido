module SignExtend(clk, extend, extended);

input[15:0] extend;
input clk;
output[31:0] extended;

reg[31:0] extended;
wire[15:0] extend;

always @(posedge clk) begin
    extended[15:0] = extend[15:0];
    extended[31:16] = {16{extend[15]}};
end

endmodule