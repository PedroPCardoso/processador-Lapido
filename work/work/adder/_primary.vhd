library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        dataA           : in     vl_logic_vector(31 downto 0);
        dataB           : in     vl_logic_vector(31 downto 0);
        cin             : in     vl_logic;
        cout            : out    vl_logic;
        result          : out    vl_logic_vector(31 downto 0)
    );
end adder;
