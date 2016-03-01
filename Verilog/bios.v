// inicializa o dispositivo e passa o controle para a Unidade de Controle
module bios (clock);
input clock;
reg [31:0] Address;
wire [31:0] Data;
reg CS;
reg WE;
reg OE;

integer data_file    ; // file handler
integer scan_file    ; // file handler
reg [31:0] captured_data;
`define NULL 0    

	//always @(posedge clk) begin
	always begin
	  #10
	  scan_file = $fscanf(data_file, "%b\n", captured_data); 
	  if (!$feof(data_file)) begin
		$display("Instruction: %b", captured_data);
		//use captured_data as you would any other wire or reg value;
	  end
	end

	initial begin
		data_file = $fopen("instructions.dat", "r");
		if (data_file == `NULL) begin
			$display("data_file handle was NULL");
			$finish;
		end
  
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