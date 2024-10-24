-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.dtsa_cj_pkg.all;  

entity xds_anlogic is

generic ( SIM_MODE : integer range 0 to 1 := 0 ); 

port (
i_por_n_pin : in std_logic ; 
i_clk_50m : in std_logic ;

i_ctlr_tck_pin : in std_logic ; 
i_ctlr_tdi_pin : in std_logic ; 
o_tdo_to_ctlr : out std_logic ; 
i_ctlr_tms_pin : in std_logic ;

i_ctlr_ntrst_pin : in std_logic ; 
i_ctlr_emu_en_pin : in std_logic ;  
i_ctlr_emu0_pin : in std_logic ; 
o_ctlr_rtck_pin : out std_logic ; 

i_ctlr_nsrst_pin : in std_logic ;
o_clk_fail_pin : out std_logic ; 
o_ctlr_tvd_pin : out std_logic ; 
i_ctlr_emu1_pin : in std_logic ; 

i_ctlr_pod_rls_pin : in std_logic ; 
o_ctlr_tdis_pin : out std_logic ; 
i_alt_function_n : in std_logic ; 
i_dtsa_byp_n : in std_logic ; 

o_adv_mode_led : out std_logic ; 

i_txd_in : in std_logic ; 
o_rxd_out : out std_logic ; 
i_dts_tvd_pin : in std_logic ; 

io_dts_tmsc_pin : inout std_logic ; 
o_dts_tdi_pin : out std_logic ; 
i_dts_tdo_pin : in std_logic ;
o_dts_tck_pin : out std_logic ; 

i_dts_emu2_pin : in std_logic ; 
o_dts_emu3_pin : out std_logic ; 
o_dts_ntrst_pin : out std_logic ;
io_dts_nsrst_pin : inout std_logic ; 

io_dts_keeper_pin : inout std_logic;
o_pll_clk_out: out std_logic; 
i_xdsvser_sel: in std_logic
);
end xds_anlogic; 

architecture RTL_XDS of xds_anlogic is

component dtsa_a3p125
port ( 
por_n_pin : in std_logic ; 
clk_2m : in std_logic ; 
txd_in : in std_logic ; 
rxd_out : out std_logic ; 
rts_in_n : in std_logic ; 
cts_out_n : out std_logic ; 
uart_en_n : in std_logic ; 
ctlr_tck_pin : in std_logic ; 
ctlr_ntrst_pin : in std_logic ; 
ctlr_tms_pin : in std_logic ; 
ctlr_tdi_pin : in std_logic ; 
tdo_to_ctlr : out std_logic ; 
ctlr_rtck_pin : out std_logic ; 
ctlr_tvd_pin : out std_logic ; 
ctlr_tdis_pin : out std_logic ; 
ctlr_emu0_pin : in std_logic ; 
ctlr_emu1_pin : in std_logic ; 
ctlr_emu_en_pin : in std_logic ; 
dtsa_byp_n : in std_logic ; 
ctlr_pod_rls_pin : in std_logic ; 
clk_fail_pin : out std_logic ; 
ctlr_nsrst_pin : in std_logic ; 
alt_function_n : in std_logic ; 
suspend_n : in std_logic ; 
shdn_n : out std_logic ; 
ext_select_n : in std_logic ; 
ext_tck_pin : in std_logic ; 
ext_ntrst_pin : in std_logic ; 
ext_tms_pin : in std_logic ; 
ext_tdi_pin : in std_logic ; 
tdo_to_ext : out std_logic ; 
ext_rtck_pin : out std_logic ; 
ext_tvd_pin : out std_logic ; 
ext_tdis_pin : out std_logic ; 
ext_emu0_pin : in std_logic ; 
ext_emu1_pin : in std_logic ; 
ext_srst_pin : in std_logic ; 
dts_tdis_pin : in std_logic ; 
dts_emu0_pin : out std_logic ; 
dts_emu1_pin : out std_logic ; 
dts_emu2_pin : in std_logic ; 
dts_emu3_pin : out std_logic ; 
dts_emu4_pin : in std_logic ; 
dts_emu5_pin : out std_logic ; 
dts_nsrst_pin : inout std_logic ; 
dts_tvd_pin : in std_logic ; 
dts_ntrst_pin : out std_logic ; 
dts_tck_pin : out std_logic ; 
dts_tmsc_pin : inout std_logic ; 
dts_tdi_pin : out std_logic ; 
dts_tdo_pin : in std_logic ; 
dts_rtck_pin : in std_logic ; 
dts_keeper_pin : inout std_logic ; 
adv_mode_led : out std_logic ; 
clk_tst : out std_logic ; 
test_pt1 : out std_logic ; 
test_pt2 : out std_logic ; 
tap_st_tst : out std_logic_vector ( 3 downto 0 ); 
tmsc_out_tst : out std_logic ; 
tmsc_oen_tst : out std_logic ; 
ctl_lvl_2_tst : out std_logic ; 
ctl_lvl_7_tst : out std_logic ; 
io0_st_tst : out std_logic ; 
std_mode_tst : out std_logic 
);
end component dtsa_a3p125;     

component pll_clk
port ( 
refclk : IN STD_LOGIC;
reset : IN STD_LOGIC;
extlock : OUT STD_LOGIC;
clk0_out : OUT STD_LOGIC;
clk1_out : OUT STD_LOGIC 
);
end component pll_clk;    

signal clk_100m : std_logic ;
signal ready : std_logic ;
signal extlock : std_logic;


signal s_dts_ntrst_pin : std_logic ;
signal s_dts_tck_pin : std_logic ;
signal s_dts_tmsc_pin : std_logic ;
signal s_dts_tdi_pin : std_logic ;
signal s_tdo_to_ctlr : std_logic ;

begin

--io_dts_tmsc_pin <= i_ctlr_tms_pin when i_xdsvser_sel = '0' else s_dts_tmsc_pin;
--o_dts_tdi_pin <= i_ctlr_tdi_pin when i_xdsvser_sel = '0' else s_dts_tdi_pin; 
--o_tdo_to_ctlr <= i_dts_tdo_pin when i_xdsvser_sel = '0' else s_tdo_to_ctlr;
--o_dts_tck_pin <= i_ctlr_tck_pin when i_xdsvser_sel = '0' else s_dts_tck_pin;
--o_dts_ntrst_pin <= i_ctlr_ntrst_pin when i_xdsvser_sel = '0' else s_dts_ntrst_pin;

pll_clk_u0:pll_clk
port map(
refclk => i_clk_50m,
reset => not i_por_n_pin,
extlock => extlock,
clk0_out => clk_100m,
clk1_out => o_pll_clk_out 
);
--o_pll_clk_out <= clk_10m;
ready <= i_por_n_pin AND extlock;
--o_pll_clk_out<=i_ctlr_tck_pin;
o_dts_emu3_pin <=i_txd_in ;
o_rxd_out <=i_dts_emu2_pin ;

dtsa_fpga:dtsa_a3p125
port map ( 
por_n_pin => ready, 
clk_2m => clk_100m, 
txd_in => '1',--i_txd_in, 
--rxd_out => o_rxd_out, 
rts_in_n => 'Z', 
--cts_out_n => , 
uart_en_n => '1', 
ctlr_tck_pin => i_ctlr_tck_pin, 
ctlr_ntrst_pin => i_ctlr_ntrst_pin, 
ctlr_tms_pin => i_ctlr_tms_pin, 
ctlr_tdi_pin => i_ctlr_tdi_pin, 
tdo_to_ctlr => o_tdo_to_ctlr, 
ctlr_rtck_pin => o_ctlr_rtck_pin, 
ctlr_tvd_pin => o_ctlr_tvd_pin, 
ctlr_tdis_pin => o_ctlr_tdis_pin, 
ctlr_emu0_pin => i_ctlr_emu0_pin, 
ctlr_emu1_pin => i_ctlr_emu1_pin, 
ctlr_emu_en_pin => i_ctlr_emu_en_pin, 
dtsa_byp_n => i_dtsa_byp_n, 
ctlr_pod_rls_pin => i_ctlr_pod_rls_pin, 
clk_fail_pin => o_clk_fail_pin, 
ctlr_nsrst_pin => i_ctlr_nsrst_pin, 
alt_function_n => i_alt_function_n, 
suspend_n => '1', 
--shdn_n => , 

ext_select_n => '1', 
ext_tck_pin => '1', 
ext_ntrst_pin => '0', 
ext_tms_pin => '1', 
ext_tdi_pin => '1', 
--tdo_to_ext => , 
--ext_rtck_pin => , 
--ext_tvd_pin => , 
--ext_tdis_pin => , 
ext_emu0_pin => '1', 
ext_emu1_pin => '1', 
ext_srst_pin => '1', 

dts_tdis_pin => '0', 
---dts_emu0_pin => , 
--dts_emu1_pin => , 
dts_emu2_pin => '1',--i_dts_emu2_pin, 
--dts_emu3_pin => o_dts_emu3_pin, 
dts_emu4_pin => '1', 
--dts_emu5_pin => , 
dts_nsrst_pin => io_dts_nsrst_pin, 
dts_tvd_pin => i_dts_tvd_pin, 
dts_ntrst_pin => o_dts_ntrst_pin, 
dts_tck_pin => o_dts_tck_pin, 
dts_tmsc_pin => io_dts_tmsc_pin, 
dts_tdi_pin => o_dts_tdi_pin, 
dts_tdo_pin => i_dts_tdo_pin, 
dts_rtck_pin => '1', 
dts_keeper_pin => io_dts_keeper_pin, 
adv_mode_led => o_adv_mode_led--, 
--clk_tst => , 
--test_pt1 => , 
--test_pt2 => , 
--tap_st_tst => , 
--tmsc_out_tst => , 
--tmsc_oen_tst => , 
--ctl_lvl_2_tst => , 
--ctl_lvl_7_tst => , 
--io0_st_tst => , 
--std_mode_tst => 
);

END RTL_XDS ; 
