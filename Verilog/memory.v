// RAM Model
// Adapted from:
// +-----------------------------+
// |    Copyright 1996 DOULOS    |
// |       Library: Memory       |
// |   designer : John Aynsley   |
// +-----------------------------+

module memory (Address, Data, CS, WE, OE, DataOut);

parameter AddressSize = 32;
parameter WordSize = 32;

input [AddressSize-1:0] Address;
input [WordSize-1:0] Data;
input CS;	// Chip Select
input WE;	// Write Enable
input OE;	// Output Enable
output [WordSize-1:0] DataOut;

reg [WordSize-1:0] Mem [0:255];

assign DataOut = (!CS && !OE) ? Mem[Address] : {WordSize{32'bz}};

always @(CS or WE)
  if (!CS && !WE) begin
    Mem[Address] = Data;
    $display("Data to mem");
    $display("%b",Data);
    $display("Mem Address");
    $display("%b",Address);
    $display("Data on mem");
    $display("%b",Mem[Address]);
  end

always @(WE or OE)
  if (!WE && !OE)
    $display("Operational error in RamChip: OE and WE both active");

endmodule