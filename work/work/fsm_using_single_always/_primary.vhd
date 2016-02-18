library verilog;
use verilog.vl_types.all;
entity fsm_using_single_always is
    generic(
        SIZE            : integer := 3;
        IDLE            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        GNT0            : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        GNT1            : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0)
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        req_0           : in     vl_logic;
        req_1           : in     vl_logic;
        gnt_0           : out    vl_logic;
        gnt_1           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of GNT0 : constant is 1;
    attribute mti_svvh_generic_type of GNT1 : constant is 1;
end fsm_using_single_always;
