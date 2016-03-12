library verilog;
use verilog.vl_types.all;
entity bios is
    port(
        clock           : in     vl_logic;
        Data            : out    vl_logic_vector(31 downto 0)
    );
end bios;
