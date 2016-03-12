library verilog;
use verilog.vl_types.all;
entity TestadorFlag is
    port(
        cond            : in     vl_logic_vector(2 downto 0);
        Flags           : in     vl_logic_vector(3 downto 0);
        sinalJump       : in     vl_logic;
        \out\           : out    vl_logic
    );
end TestadorFlag;
