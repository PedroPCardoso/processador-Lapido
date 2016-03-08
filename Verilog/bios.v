// carrega instruções na memória, inicializa os dispositivos e passa o controle para a Unidade de Controle
module bios (clock, Data);
input clock;
output [31:0] Data;

integer data_file; // file handler
integer scan_file; // file handler
reg [31:0] captured_data;
`define NULL 0

	always @(posedge clock) begin
		scan_file = $fscanf(data_file, "%b\n", captured_data);
		if (!$feof(data_file)) begin
			$display("Instruction: %b", captured_data);
		end
	end
	
	assign Data = captured_data;

	initial begin
		data_file = $fopen("instructions.dat", "r");
		if (data_file == `NULL) begin
			$display("data_file handle was NULL");
			$finish;
		end
	end
			
endmodule