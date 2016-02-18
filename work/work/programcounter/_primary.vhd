library verilog;
use verilog.vl_types.all;
entity programcounter is
    port(
        reset           : in     vl_logic;
        CLK             : in     vl_logic;
        D               : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0)
    );
end programcounter;
