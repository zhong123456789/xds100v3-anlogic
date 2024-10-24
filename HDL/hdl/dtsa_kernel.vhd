-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
library work;
use work.dtsa_cj_pkg.all;
entity dtsa_kernel is
port(
por_n_pin:in std_logic;
reset_n_out:out std_logic;
master_clk:in std_logic;
clk_1500:in std_logic;
ctlr_tck_pin:in std_logic;
ctlr_ntrst_pin:in std_logic;
ctlr_tms_pin:in std_logic;
ctlr_tdi_pin:in std_logic;
ctlr_tdo_pin:out std_logic;
ctlr_rtck_pin:out std_logic;
pod_release:in std_logic;
clk_fail_en:in std_logic;
clk_fail:out std_logic;
loop_around:in std_logic;
ser_port_en:out std_logic;
swo_select:out std_logic;
loopback_en:in std_logic;
isolate_tgt:in std_logic;
dts_tdis_pin:in std_logic;
output_en_n:out std_logic;
uart_en_stat:in std_logic;
ext_select_n:in std_logic;
tgt_volt_good:in std_logic;
dts_ntrst_out:out std_logic;
dts_ntrst_oen:out std_logic;
dts_tck_out:out std_logic;
ts_rtck_pin:in std_logic;
dts_tmsc_oen:out std_logic;
dts_tmsc_out:out std_logic;
tmsc_from_tgt_pin:in std_logic;
keeper_val:out std_logic;
keeper_oe_n:out std_logic;
dts_tdi_oen:out std_logic;
dts_tdi_out:out std_logic;
tdo_from_tgt_pin:in std_logic;
clk_tst:out std_logic;
dts_tap_state_tst:out std_logic_vector(K63 downto 0);
cmd_ctl_lvl_tst:out std_logic;
dts_cmd_lvl_tst:out std_logic;
io0_st_tst:out std_logic;
std_mode_tst:out std_logic
);
end dtsa_kernel;
architecture RTL of dtsa_kernel is
component E42e
port(por_n:in std_logic;
master_clk:in std_logic;
itck:in std_logic;
ctlr_ntrst_pin:in std_logic;
ctlr_tms_pin:in std_logic;
ctlr_tdi_pin:in std_logic;
loop_around:in std_logic;
por_n_sync:out std_logic;
reset_n:out std_logic;
reset_n_fe:out std_logic;
trst_na:out std_logic;
trst_sync:out std_logic
);
end component E42e;
component E3ce
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
P10:out std_logic;
P11:out std_logic;
P12:out std_logic_vector(7 downto 0);
P13:in std_logic_vector(7 downto 0);
P14:out std_logic_vector(7 downto 0)
);
end component E3ce;
component dtsa_tclk_ctrl
port(reset_n:in std_logic;
reset_n_fe:in std_logic;
master_clk:in std_logic;
wr_clr_det:in std_logic;
ctr_limit:in std_logic_vector(5 downto 0);
tck_cfg_mode:in std_logic_vector(K29 downto K30);
clk_1500:in std_logic;
jscan_fmt:in std_logic;
csm_to_std:in std_logic;
ts_rtck_pin:in std_logic;
ctlr_tck_pin:in std_logic;
tck_en:in std_logic;
tap_adv:in std_logic;
csm_std_mode:in std_logic;
csm_run:in std_logic;
clr_clk_fail:in std_logic;
clk_fail:out std_logic;
clk_det:out std_logic;
clk_tst:out std_logic;
ctlr_rtck:out std_logic;
tck2tgt:out std_logic;
itck:out std_logic
);
end component dtsa_tclk_ctrl;
component E700
port(P0:in std_logic;
P1:in std_logic;
P2:in std_logic;
P3:in std_logic;
P4:in std_logic;
P5:in std_logic_vector(7 downto 0);
P6:in std_logic_vector(7 downto 0);
P7:out std_logic_vector(7 downto 0);
P8:in std_logic;
P9:out std_logic;
P10:in std_logic;
P11:in std_logic;
P12:in std_logic;
P13:in std_logic;
P14:in std_logic;
P15:in std_logic;
P16:in std_logic;
P17:in std_logic;
P18:in std_logic;
P19:out std_logic;
P20:out std_logic;
P21:out std_logic;
P22:in std_logic;
P23:in std_logic;
P24:out std_logic;
P25:out std_logic;
P26:out std_logic;
P27:out std_logic_vector(K29 downto K30);
P28:out std_logic_vector(5 downto 0)
);
end component E700;
component E70f
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
end component E70f;
CONSTANT S1:std_logic:='1';
signal S2:std_logic;
signal S3:std_logic;
signal S4:std_logic;
signal S5:std_logic;
signal S6:std_logic;
signal S7:std_logic;
signal S8:std_logic;
signal S9:std_logic_vector(5 downto 0);
signal S10:std_logic;
signal S11:std_logic;
signal S12:std_logic;
signal S13:std_logic;
signal S14:std_logic;
signal S15:std_logic;
signal S16:std_logic_vector(7 downto 0);
signal S17:std_logic_vector(7 downto 0);
signal S18:std_logic_vector(7 downto 0);
signal S19:std_logic;
signal S20:std_logic;
signal S21:std_logic;
signal S22:std_logic;
signal S23:std_logic;
signal S24:std_logic_vector(K63 downto 0);
signal S25:std_logic_vector(K29 downto K30);
signal S26:std_logic;
signal S27:std_logic;
signal S28:std_logic;
signal S29:std_logic;
signal S30:std_logic;
signal S31:std_logic;
signal S32:std_logic;
signal S33:std_logic;
signal S34:std_logic;
signal S35:std_logic;
signal S36:std_logic;
signal S37:std_logic;
signal S38:std_logic;
signal S39:std_logic;
signal S40:std_logic;
signal S41:std_logic;
signal S42:std_logic;
signal S43:std_logic;
signal S44:std_logic_vector(4 downto 0);
begin
RST0:E42e
port map(
por_n=>por_n_pin,
master_clk=>master_clk,
itck=>S11,
ctlr_ntrst_pin=>ctlr_ntrst_pin,
ctlr_tms_pin=>ctlr_tms_pin,
ctlr_tdi_pin=>ctlr_tdi_pin,
loop_around=>loop_around,
por_n_sync=>S13,
reset_n=>S21,
reset_n_fe=>S22,
trst_na=>S36,
trst_sync=>S37
);
reset_n_out<=S21;
S39<=S24(K81)AND S24(K87);
S40<=S24(K82)AND S24(K87);
S41<=S24(K86)AND S24(K87);
XCVR0:E3ce
port map(
P0=>S21,
P1=>S11,
P2=>S23,
P3=>S39,
P4=>S40,
P5=>S41,
P6=>S24(K88),
P7=>S8,
P8=>S28,
P9=>S38,
P10=>S19,
P11=>S20,
P12=>S16,
P13=>S18,
P14=>S17
);
S5<=not clk_fail_en OR S12;
TC0:dtsa_tclk_ctrl
port map(
reset_n=>S21,
reset_n_fe=>S22,
master_clk=>master_clk,
wr_clr_det=>S3,
ctr_limit=>S9,
tck_cfg_mode=>S25,
clk_1500=>clk_1500,
jscan_fmt=>S43,
csm_to_std=>S42,
ts_rtck_pin=>ts_rtck_pin,
ctlr_tck_pin=>ctlr_tck_pin,
tck_en=>S26,
tap_adv=>S23,
csm_std_mode=>S7,
csm_run=>S10,
clr_clk_fail=>S5,
clk_fail=>S4,
clk_det=>S2,
clk_tst=>clk_tst,
ctlr_rtck=>ctlr_rtck_pin,
tck2tgt=>dts_tck_out,
itck=>S11
);
clk_fail<=S4;
DAC0:E700
port map(
P0=>S21,
P1=>S13,
P2=>master_clk,
P3=>S11,
P4=>S20,
P5=>S16,
P6=>S17,
P7=>S18,
P8=>S2,
P9=>S3,
P10=>S4,
P11=>pod_release,
P12=>dts_tdis_pin,
P13=>tgt_volt_good,
P14=>uart_en_stat,
P15=>ext_select_n,
P16=>tmsc_from_tgt_pin,
P17=>S32,
P18=>S33,
P19=>S31,
P20=>ser_port_en,
P21=>swo_select,
P22=>loopback_en,
P23=>isolate_tgt,
P24=>S12,
P25=>S15,
P26=>S14,
P27=>S25,
P28=>S9
);
output_en_n<=S12;
CJCNV0:E70f
port map(
master_clk=>master_clk,
trst_na=>S36,
trst_sync=>S37,
itck=>S11,
tck_en=>S26,
ctlr_tdi=>ctlr_tdi_pin,
ctlr_tms=>ctlr_tms_pin,
ctlr_tdo=>ctlr_tdo_pin,
xcvr_tdo=>S38,
jtag_state=>S24,
noutput_enable=>S12,
tmsc_fe_oe_ctl=>S31,
re_select=>S15,
re_sample=>S14,
ctl_lvl_7=>S8,
tap_adv=>S23,
tdo_pin=>tdo_from_tgt_pin,
tmsc_pin=>tmsc_from_tgt_pin,
tmsc_fe_oe_n=>S32,
tmsc_out_fe=>S33,
tms_re_oe_n=>S34,
tms_out_re=>S35,
keeper_val=>keeper_val,
keeper_oe_n=>keeper_oe_n,
tdi_re_oe_n=>S29,
tdi_out_re=>S30,
tdi_fe_oe_n=>S27,
tdi_out_fe=>S28,
csm_run=>S10,
csm_to_std=>S42,
io0_state_tst=>io0_st_tst,
cmd_allowed_tst=>S6,
scanfmt_tst=>S44,
std_mode_out=>S7
);
S43<='1'when S44(4 downto 2)="000"else'0';
dts_tdi_out<=S30 when S15='1'else S28;
dts_tdi_oen<=S29 when S15='1'else S27;
dts_tmsc_out<=S35 when S15='1'else S33;
dts_tmsc_oen<=S34 when S15='1'else S32;
dts_ntrst_out<=ctlr_ntrst_pin;
dts_ntrst_oen<=S12 AND ctlr_ntrst_pin;
dts_tap_state_tst<=S24;
cmd_ctl_lvl_tst<=S6;
dts_cmd_lvl_tst<=S8;
std_mode_tst<=S7;
END RTL;
