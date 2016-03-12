library verilog;
use verilog.vl_types.all;
entity mux is
    port(
        din_0           : in     vl_logic_vector(31 downto 0);
        din_1           : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic;
        mux_out         : out    vl_logic_vector(31 downto 0)
    );
end mux;
