library verilog;
use verilog.vl_types.all;
entity programcounter is
    port(
        enablePC        : in     vl_logic;
        memAddress      : in     vl_logic_vector(31 downto 0);
        memAddressOut   : out    vl_logic_vector(31 downto 0)
    );
end programcounter;
