// inicializa o dispositivo e passa o controle para a Unidade de Controle
module bios (clock);
input clock;
reg [31:0] Address;
wire [31:0] Data;
reg CS;
reg WE;
reg OE;

	initial begin
		CS = 0;
		OE = 1;
		WE = 1;
	end
	
	memory memory(
		.Address(Address),
		.Data(Data),
		.CS(CS),
		.WE(WE),
		.OE(OE)
	);
	
	assign Data = 32'b0110011;

	//always @(posedge clock)
	always 
	begin
		#100
		WE=0;
		Address = 32'b0;
		
		// Carrega memória
		// Inicializa valores dos componentes
	end
			
endmodule