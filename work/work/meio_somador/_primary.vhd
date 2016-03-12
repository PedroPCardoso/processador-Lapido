library verilog;
use verilog.vl_types.all;
entity meio_somador is
    port(
        S               : out    vl_logic;
        C               : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic
    );
end meio_somador;
