library verilog;
use verilog.vl_types.all;
entity registerFile is
    generic(
        bits_palavra    : integer := 32;
        end_registros   : integer := 4;
        num_registros   : integer := 16
    );
    port(
        enable          : in     vl_logic;
        OUT_A           : in     vl_logic_vector(3 downto 0);
        OUT_B           : in     vl_logic_vector(3 downto 0);
        IN_C            : in     vl_logic_vector(3 downto 0);
        reset           : in     vl_logic;
        updateB         : in     vl_logic;
        A               : out    vl_logic_vector;
        B               : out    vl_logic_vector;
        E               : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bits_palavra : constant is 1;
    attribute mti_svvh_generic_type of end_registros : constant is 1;
    attribute mti_svvh_generic_type of num_registros : constant is 1;
end registerFile;
