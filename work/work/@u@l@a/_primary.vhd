library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(4 downto 0);
        zero            : out    vl_logic;
        \Out\           : out    vl_logic_vector(31 downto 0);
        Carry           : out    vl_logic
    );
end ULA;
