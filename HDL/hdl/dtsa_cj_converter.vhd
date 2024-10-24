-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
library work;
use work.dtsa_cj_pkg.all;
entity E70f is
port(
master_clk:in std_logic;
trst_na:in std_logic;
trst_sync:in std_logic;
itck:in std_logic;
tck_en:out std_logic;
ctlr_tdi:in std_logic;
ctlr_tms:in std_logic;
ctlr_tdo:out std_logic;
xcvr_tdo:in std_logic;
jtag_state:out std_logic_vector(K63 downto 0);
noutput_enable:in std_logic;
tmsc_fe_oe_ctl:in std_logic;
re_select:in std_logic;
re_sample:in std_logic;
ctl_lvl_7:out std_logic;
tap_adv:out std_logic;
tdo_pin:in std_logic;
tmsc_pin:in std_logic;
tmsc_fe_oe_n:out std_logic;
tmsc_out_fe:out std_logic;
tms_re_oe_n:out std_logic;
tms_out_re:out std_logic;
keeper_val:out std_logic;
keeper_oe_n:out std_logic;
tdi_re_oe_n:out std_logic;
tdi_out_re:out std_logic;
tdi_fe_oe_n:out std_logic;
tdi_out_fe:out std_logic;
csm_run:out std_logic;
csm_to_std:out std_logic;
io0_state_tst:out std_logic;
cmd_allowed_tst:out std_logic;
scanfmt_tst:out std_logic_vector(K129 downto 0);
std_mode_out:out std_logic
);
end E70f;
architecture RTL of E70f is
component E47c
port(P0:in std_logic;
P1:in std_logic;
P2:in std_logic;
P3:in std_logic;
P4:in std_logic;
P5:out std_logic;
P6:out std_logic;
P7:out std_logic;
P8:out std_logic;
P9:out std_logic_vector(K63 downto 0)
);
end component E47c;
component E613
port(P0:in std_logic;
P1:in std_logic;
P2:in std_logic;
P3:in std_logic;
P4:in std_logic;
P5:in std_logic;
P6:in std_logic;
P7:in std_logic;
P8:in std_logic;
P9:out std_logic;
P10:out std_logic
);
end component E613;
component E5b8
port(P0:in std_logic;
P1:in std_logic;
P2:in std_logic_vector(K63 downto 0);
P3:in std_logic;
P4:in std_logic;
P5:in std_logic;
P6:in std_logic;
P7:in std_logic;
P8:out std_logic_vector(9 downto 0);
P9:out std_logic;
P10:out std_logic;
P11:out std_logic;
P12:out std_logic
);
end component E5b8;
component E4e8
port(P0:in std_logic;
P1:in std_logic;
P2:in std_logic;
P3:in std_logic_vector(K108 downto 0);
P4:in std_logic;
P5:in std_logic;
P6:in std_logic;
P7:out std_logic;
P8:out std_logic;
P9:out std_logic_vector(K129 downto 0);
P10:out std_logic_vector(K157 downto 0)
);
end component E4e8;
component E60b
port(
P0:in std_logic;
P1:in std_logic;
P2:in std_logic;
P3:in std_logic;
P4:in std_logic;
P5:in std_logic;
P6:in std_logic;
P7:in std_logic;
P8:out std_logic;
P9:in std_logic;
P10:in std_logic;
P11:in std_logic;
P12:in std_logic;
P13:out std_logic;
P14:in std_logic;
P15:in std_logic;
P16:in std_logic;
P17:in std_logic;
P18:out std_logic;
P19:out std_logic;
P20:out std_logic;
P21:out std_logic;
P22:out std_logic;
P23:out std_logic;
P24:out std_logic;
P25:out std_logic;
P26:out std_logic
);
end component E60b;
component E6f4
port(
P0:in std_logic;
P1:in std_logic;
P2:in std_logic;
P3:out std_logic;
P4:in std_logic;
P5:in std_logic;
P6:in std_logic;
P7:in std_logic;
P8:in std_logic;
P9:in std_logic;
P10:in std_logic;
P11:in std_logic;
P12:in std_logic;
P13:in std_logic_vector(K157 downto 0);
P14:in std_logic;
P15:out std_logic;
P16:out std_logic;
P17:out std_logic;
P18:out std_logic;
P19:out std_logic;
P20:out std_logic;
P21:out std_logic;
P22:out std_logic;
P23:out std_logic;
P24:out std_logic;
P25:in std_logic;
P26:in std_logic;
P27:out std_logic;
P28:out std_logic;
P29:out std_logic;
P30:out std_logic
);
end component E6f4;
signal csm_prereq_adv:std_logic;
signal csm_req_adv:std_logic;
signal csm_req_std:std_logic;
signal csm_upd_sf:std_logic;
signal cmd_allowed:std_logic;
signal cmd_write:std_logic;
signal csm_std_mode:std_logic;
signal dts_cmd_allowed:std_logic;
signal ecl_cmd:std_logic;
signal esc_busy:std_logic;
signal in_tlr_m1:std_logic;
signal opcode:std_logic_vector(K108 downto 0);
signal pipe_adv:std_logic;
signal scanmode_vec:std_logic_vector(K157 downto 0);
signal scanfmt:std_logic_vector(K129 downto 0);
signal shift_entry_m1:std_logic;
signal sp_1st_bit_nxt:std_logic;
signal std2advfmtchg:std_logic;
signal tap_adv_i:std_logic;
signal tap_st_f:std_logic_vector(K63 downto 0);
signal tdi_m1:std_logic;
signal tdo_latchen:std_logic;
signal tms_2_tap:std_logic;
signal tms_m1:std_logic;
signal tmsc_re:std_logic;
signal shift_m1:std_logic;
signal update_dr_m1:std_logic;
signal capture_dr:std_logic;
signal select_ir:std_logic;
signal shift_dr:std_logic;
signal update_dr:std_logic;
begin
I71:E47c
PORT map(
P0=>trst_na,
P1=>trst_sync,
P2=>itck,
P3=>pipe_adv,
P4=>tms_2_tap,
P5=>shift_entry_m1,
P6=>shift_m1,
P7=>update_dr_m1,
P8=>in_tlr_m1,
P9=>tap_st_f
);
update_dr<=tap_st_f(K86)AND tap_st_f(K87);
capture_dr<=tap_st_f(K81)AND tap_st_f(K87);
shift_dr<=tap_st_f(K82)AND tap_st_f(K87);
select_ir<=tap_st_f(K80)AND not tap_st_f(K87);
I72:E613
PORT map(
P0=>trst_sync,
P1=>itck,
P2=>capture_dr,
P3=>select_ir,
P4=>shift_dr,
P5=>tap_st_f(K89),
P6=>update_dr,
P7=>sp_1st_bit_nxt,
P8=>ecl_cmd,
P9=>cmd_allowed,
P10=>dts_cmd_allowed
);
I73:E5b8
PORT map(
P0=>trst_sync,
P1=>itck,
P2=>tap_st_f,
P3=>update_dr_m1,
P4=>cmd_allowed,
P5=>sp_1st_bit_nxt,
P6=>scanmode_vec(K147),
P7=>std2advfmtchg,
P8=>opcode,
P9=>cmd_write,
P10=>csm_prereq_adv,
P11=>csm_req_adv,
P12=>csm_req_std
);
I74:E4e8
PORT map(
P0=>trst_sync,
P1=>itck,
P2=>tap_st_f(K89),
P3=>opcode,
P4=>cmd_write,
P5=>csm_upd_sf,
P6=>sp_1st_bit_nxt,
P7=>ecl_cmd,
P8=>std2advfmtchg,
P9=>scanfmt,
P10=>scanmode_vec
);
scanfmt_tst<=scanfmt;
I75:E60b
PORT map(
P0=>trst_sync,
P1=>itck,
P2=>esc_busy,
P4=>re_select,
P3=>re_sample,
P5=>noutput_enable,
P6=>ctlr_tdi,
P7=>ctlr_tms,
P8=>ctlr_tdo,
P9=>xcvr_tdo,
P10=>dts_cmd_allowed,
P12=>tmsc_pin,
P13=>tmsc_re,
P11=>tdo_pin,
P14=>scanmode_vec(K147),
P15=>csm_std_mode,
P16=>pipe_adv,
P17=>tdo_latchen,
P18=>tms_re_oe_n,
P19=>tms_out_re,
P21=>tdi_fe_oe_n,
P20=>tdi_re_oe_n,
P23=>tdi_out_re,
P22=>tdi_out_fe,
P24=>tms_m1,
P25=>tdi_m1,
P26=>tms_2_tap
);
I76:E6f4
PORT map(
P0=>master_clk,
P1=>trst_sync,
P2=>itck,
P3=>tck_en,
P4=>tap_st_f(K89),
P5=>tap_st_f(K82),
P6=>shift_m1,
P7=>in_tlr_m1,
P8=>shift_entry_m1,
P9=>csm_req_adv,
P10=>csm_req_std,
P11=>tdi_m1,
P12=>tms_m1,
P13=>scanmode_vec,
P14=>tmsc_re,
P15=>tap_adv_i,
P16=>pipe_adv,
P17=>csm_to_std,
P18=>csm_upd_sf,
P19=>csm_std_mode,
P20=>sp_1st_bit_nxt,
P21=>tdo_latchen,
P22=>esc_busy,
P23=>io0_state_tst,
P24=>csm_run,
P25=>tmsc_pin,
P26=>tmsc_fe_oe_ctl,
P27=>tmsc_fe_oe_n,
P28=>tmsc_out_fe,
P29=>keeper_val,
P30=>keeper_oe_n
);
cmd_allowed_tst<=cmd_allowed;
ctl_lvl_7<=dts_cmd_allowed;
std_mode_out<=csm_std_mode;
tap_adv<=tap_adv_i;
jtag_state<=tap_st_f;
END RTL;
