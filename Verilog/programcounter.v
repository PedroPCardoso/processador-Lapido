module programcounter (enablePC, memAddress, memAddressOut);
input enablePC;
input [31:0] memAddress;
output [31:0] memAddressOut;
reg [31:0] memAddressOut;
	
	initial begin
		memAddressOut=32'b0;
	end

	always @(posedge enablePC)
	begin
		memAddressOut = memAddress;
	end
			
endmodule