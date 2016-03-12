library verilog;
use verilog.vl_types.all;
entity RegistradorFlags is
    port(
        r               : in     vl_logic;
        cond            : in     vl_logic_vector(4 downto 0);
        flagsE          : in     vl_logic_vector(3 downto 0);
        flagsO          : out    vl_logic_vector(3 downto 0)
    );
end RegistradorFlags;
