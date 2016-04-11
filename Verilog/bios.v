// carrega instrucoes na memoria, inicializa os dispositivos e passa o controle para a Unidade de Controle
module bios (clock, captured_data, active);
input clock;
//output [31:0] Data;

integer data_file; // file handler
integer scan_file; // file handler
output reg [31:0] captured_data;
output reg active;
`define NULL 0

	always @(posedge clock) begin
		scan_file = $fscanf(data_file, "%b\n", captured_data);
		if (!$feof(data_file)) begin
			$display("Instruction: %b", captured_data);
		end else begin
			$display("Bios ended");
			active = 1'b0;
		end
	end
	
	//assign Data = captured_data;

	initial begin
		active = 1'b1;
		data_file = $fopen("work/instructions.dat", "r");
		if (data_file == `NULL) begin
			$display("data_file handle was NULL");
			$finish;
		end
	end
			
endmodule