-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.dtsa_cj_pkg.all;  
entity dtsa_a3p125 is
generic ( SIM_MODE : integer range 0 to 1 := 0 ); 
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
end dtsa_a3p125; 
architecture RTL of dtsa_a3p125 is
component pll_x48
port ( POWERDOWN : in std_logic ; 
CLKA : in std_logic ; 
LOCK : out std_logic ; 
GLA : out std_logic 
);
end component pll_x48; 
component E557
port ( 
P0 : in std_logic ; 
P1 : in std_logic ; 
P2 : in std_logic ; 
P3 : in std_logic ; 
P4 : out std_logic ; 
P5 : in std_logic ; 
P6 : out std_logic ; 
P7 : in std_logic ; 
P8 : out std_logic ; 
P9 : in std_logic ; 
P10 : in std_logic ; 
P11 : in std_logic_vector ( 3 downto 0 ); 
P12 : in std_logic ; 
P13 : out std_logic ; 
P14 : in std_logic ; 
P15 : out std_logic ; 
P16 : in std_logic ; 
P17 : out std_logic ; 
P18 : in std_logic ; 
P19 : out std_logic ; 
P20 : out std_logic ; 
P21 : out std_logic ; 
P22 : out std_logic 
);
end component E557; 
component E578
generic ( SIM_MODE : integer range 0 to 1 := 0 ); 
port ( 
P0 : in std_logic ; 
P1 : in std_logic ; 
P2 : in std_logic ; 
P3 : in std_logic ; 
P4 : in std_logic ; 
P5 : in std_logic ; 
P6 : out std_logic ; 
P7 : out std_logic ; 
P8 : out std_logic ; 
P9 : out std_logic 
);
end component E578; 
component dtsa_kernel
port ( 
por_n_pin : in std_logic ; 
reset_n_out : out std_logic ; 
master_clk : in std_logic ; 
clk_1500 : in std_logic ; 
ctlr_tck_pin : in std_logic ; 
ctlr_ntrst_pin : in std_logic ; 
ctlr_tms_pin : in std_logic ; 
ctlr_tdi_pin : in std_logic ; 
ctlr_tdo_pin : out std_logic ; 
ctlr_rtck_pin : out std_logic ; 
pod_release : in std_logic ; 
clk_fail_en : in std_logic ; 
clk_fail : out std_logic ; 
loop_around : in std_logic ; 
ser_port_en : out std_logic ; 
swo_select : out std_logic ; 
loopback_en : in std_logic ; 
isolate_tgt : in std_logic ; 
dts_tdis_pin : in std_logic ; 
output_en_n : out std_logic ; 
uart_en_stat : in std_logic ; 
ext_select_n : in std_logic ; 
tgt_volt_good : in std_logic ; 
dts_ntrst_out : out std_logic ; 
dts_ntrst_oen : out std_logic ; 
dts_tck_out : out std_logic ; 
ts_rtck_pin : in std_logic ; 
dts_tmsc_oen : out std_logic ; 
dts_tmsc_out : out std_logic ; 
tmsc_from_tgt_pin : in std_logic ; 
keeper_val : out std_logic ; 
keeper_oe_n : out std_logic ; 
dts_tdi_oen : out std_logic ; 
dts_tdi_out : out std_logic ; 
tdo_from_tgt_pin : in std_logic ; 
clk_tst : out std_logic ; 
dts_tap_state_tst : out std_logic_vector ( K63 downto 0 ); 
cmd_ctl_lvl_tst : out std_logic ; 
dts_cmd_lvl_tst : out std_logic ; 
io0_st_tst : out std_logic ; 
std_mode_tst : out std_logic 
);
end component dtsa_kernel; 
component E360
port ( P0 : in std_logic ; 
P1 : in std_logic ; 
P2 : in std_logic ; 
P3 : in std_logic ; 
P4 : in std_logic ; 
P5 : in std_logic ; 
P6 : in std_logic ; 
P7 : in std_logic ; 
P8 : in std_logic ; 
P9 : in std_logic ; 
P10 : in std_logic ; 
P11 : in std_logic ; 
P12 : in std_logic ; 
P13 : in std_logic ; 
P14 : out std_logic ; 
P15 : out std_logic ; 
P16 : out std_logic ; 
P17 : out std_logic ; 
P18 : out std_logic ; 
P19 : out std_logic 
);
end component E360; 
CONSTANT S1 : std_logic := '1' ; 
signal S2 : std_logic ; 
signal S3 : std_logic ; 
signal S4 : std_logic ; 
signal S5 : std_logic ; 
signal S6 : std_logic ; 
signal S7 : std_logic ; 
signal S8 : std_logic ; 
signal S9 : std_logic ; 
signal S10 : std_logic ; 
signal S11 : std_logic ; 
signal S12 : std_logic ; 
signal S13 : std_logic ; 
signal S14 : std_logic ; 
signal S15 : std_logic ; 
signal S16 : std_logic ; 
signal S17 : std_logic_vector ( 9 downto 0 ); 
signal S18 : std_logic ; 
signal S19 : std_logic ; 
signal S20 : std_logic ; 
signal S21 : std_logic ; 
signal S22 : std_logic ; 
signal S23 : std_logic ; 
signal S24 : std_logic ; 
signal S25 : std_logic ; 
signal S26 : std_logic ; 
signal S27 : std_logic ; 
signal S28 : std_logic ; 
signal S29 : std_logic ; 
signal S30 : std_logic ; 
signal S31 : std_logic ; 
signal S32 : std_logic ; 
signal S33 : std_logic ; 
signal S34 : std_logic ; 
signal S35 : std_logic ; 
signal S36 : std_logic ; 
signal S37 : std_logic ; 
signal S38 : std_logic ; 
signal S39 : std_logic ; 
signal S40 : std_logic ; 
signal S41 : std_logic ; 
signal S42 : std_logic ; 
signal S43 : std_logic ; 
signal S44 : std_logic ; 
signal S45 : std_logic ; 
signal S46 : std_logic ; 
signal S47 : std_logic ; 
signal S48 : std_logic ; 
signal S49 : std_logic ; 
signal S50 : std_logic ; 
signal S51 : std_logic ; 
signal S52 : std_logic_vector ( 3 downto 0 ); 
signal S53 : std_logic ; 
signal S54 : std_logic ; 
signal S55 : std_logic ; 
signal S56 : std_logic ; 
signal S57 : std_logic ; 
signal S58 : std_logic ; 
signal S59 : std_logic ; 
signal S60 : std_logic ; 
signal S61 : std_logic ; 
signal S62 : std_logic ; 
signal S63 : std_logic ; 
signal S64 : std_logic ; 
signal S65 : std_logic ; 

signal reg1 : std_logic_vector ( 4 downto 0 ); 
signal tck_reg : std_logic_vector ( 15 downto 0 );
signal tck_reg_samp: std_logic_vector ( 2 downto 0 );
constant up_overflow:integer:=40000;
signal tck_div : std_logic ;
signal tck_active: std_logic ;

begin

process ( S5 , por_n_pin ) 
begin
if ( por_n_pin = '0' ) then 
reg1 <= "00000" ; 
elsif ( S5 'event and S5 = '1' ) then 
reg1 <= reg1 +1 ; 
end if ; 
end process ; 

process ( S5 , por_n_pin ) 
begin
if ( por_n_pin = '0' ) then 
tck_reg_samp <= "000" ; 
elsif ( S5 'event and S5 = '1' ) then 
    if( reg1(3) = '1') then
        tck_reg_samp <= tck_reg_samp(2 downto 1)&dts_tck_pin;
    end if;
end if ; 
end process ; 

process ( S5 , por_n_pin ) 
begin
if ( por_n_pin = '0' ) then 
tck_active <= '0' ; 
elsif ( S5 'event and S5 = '1' ) then 
    if( not(tck_reg_samp = "000") AND dts_tck_pin = '1') then
        tck_active<='1';
    else
        tck_active<='0';
    end if;
end if ; 
end process ; 

process ( dts_tck_pin , por_n_pin ) 
begin
if ( por_n_pin = '0' ) then 
    tck_reg <= "0000000000000000" ; 
    tck_div <= '0';
elsif ( dts_tck_pin 'event and dts_tck_pin = '1' ) then 
    tck_reg <= tck_reg + '1';
    if(tck_reg = up_overflow) then
        tck_reg <= "0000000000000000" ;
        tck_div <= not tck_div;
    end if;
end if ; 
end process ; 

adv_mode_led <= NOT (tck_div and tck_active); 
--adv_mode_led <= S50 ;--when S2 = '0' else not S33 ; 

S38 <= not dtsa_byp_n ; 
ALTFUNC0:E557
port map ( 
P0 => por_n_pin , 
P1 => S41 , 
P2 => alt_function_n , 
P3 => S15 , 
P4 => ctlr_tvd_pin , 
P5 => S14 , 
P6 => ctlr_tdis_pin , 
P7 => S6 , 
P8 => clk_fail_pin , 
P9 => ext_select_n , 
P10 => S49 , 
P11 => S52 , 
P12 => ctlr_pod_rls_pin , 
P13 => S13 , 
P14 => ctlr_emu_en_pin , 
P15 => S10 , 
P16 => ctlr_emu1_pin , 
P17 => S12 , 
P18 => ctlr_emu0_pin , 
P19 => S11 , 
P20 => S39 , 
P21 => S40 , 
P22 => S7 
);
S41 <= clk_2m ; 
shdn_n <= '0' when suspend_n = '0' else 'Z' ; 
FILT0:E578
generic map ( SIM_MODE => SIM_MODE ) 
port map ( 
P0 => por_n_pin , 
P1 => S41 , 
P2 => ext_tck_pin , 
P3 => ext_select_n , 
P4 => S13 , 
P5 => dts_tvd_pin , 
P6 => S4 , 
P7 => S5 , 
P8 => S55 , 
P9 => S43 ); 
BT0:E360
port map ( 
P0 => S44 , 
P1 => S4 , 
P2 => S30 , 
P3 => ext_tck_pin , 
P4 => ext_ntrst_pin , 
P5 => ext_tms_pin , 
P6 => ext_tdi_pin , 
P7 => ext_emu0_pin , 
P8 => ext_emu1_pin , 
P9 => dts_emu2_pin , 
P10 => txd_in , 
P11 => rts_in_n , 
P12 => dts_emu4_pin , 
P13 => dts_keeper_pin , 
P14 => S2 , 
P15 => S31 , 
P16 => S32 , 
P17 => S33 , 
P18 => S34 , 
P19 => S3 
);


process ( S41 , por_n_pin ) 
begin

if ( por_n_pin = '0' ) then 
S30 <= '1' ; 
elsif ( S41 'event and S41 = '1' ) then 
S30 <= ext_select_n ; 
end if ; 
end process ; 
S62 <= ctlr_tms_pin when S30 = '1' else ext_tms_pin ; 
S61 <= ctlr_tck_pin when S30 = '1' else ext_tck_pin ; 
S63 <= ctlr_tdi_pin when S30 = '1' else ext_tdi_pin ; 
S60 <= ctlr_ntrst_pin when S30 = '1' else ext_ntrst_pin ; 
S54 <= ctlr_tdi_pin when S39 = '1' else 
S53 ; 
tdo_to_ctlr <= S54 when S38 = '1' else 
S64 ; 
tdo_to_ext <= S64 when S30 = '0' else 
S3 ; 
ctlr_rtck_pin <= S58 when S38 = '1' else 
S65 ; 
ext_rtck_pin <= ext_tck_pin when S30 = '1' else 
S65 ; 
S15 <= ( not S42 ) OR S39 ; 
S14 <= ( dts_tdis_pin OR not S30 ) AND not S39 ; 
ext_tvd_pin <= not S32 when S2 = '1' else 
S30 OR S55 ; 
ext_tdis_pin <= S31 when S2 = '1' else 
dts_tdis_pin AND not S30 ; 
S28 <= not ext_emu0_pin when S30 = '0' else 
not S10 AND S11 ; 
S29 <= not ext_emu1_pin when S30 = '0' else 
not S10 AND S12 ; 
SIM_GEN:if( SIM_MODE = 1 ) generate 
S53 <= dts_tdo_pin AND S1 ; 
S56 <= dts_tmsc_pin AND S1 ; 
S45 <= dts_rtck_pin AND S1 ; 
S49 <= not dts_nsrst_pin AND S1 ; 
end generate SIM_GEN;
SIM_NOGEN:if( SIM_MODE = 0 ) generate 
S53 <= dts_tdo_pin ; 
S56 <= dts_tmsc_pin ; 
S45 <= dts_rtck_pin ; 
S49 <= not dts_nsrst_pin ; 
end generate SIM_NOGEN;
S35 <= S42 OR S39 OR S6 ; 
S58 <= S20 when S35 = '1' else 
(S45 OR S34 ); 
DTSK:dtsa_kernel
port map ( 
por_n_pin => por_n_pin , 
reset_n_out => S44 , 
master_clk => S41 , 
clk_1500 => S5 , 
ctlr_tck_pin => S61 , 
ctlr_ntrst_pin => S60 , 
ctlr_tms_pin => S62 , 
ctlr_tdi_pin => S63 , 
ctlr_tdo_pin => S64 , 
ctlr_rtck_pin => S65 , 
pod_release => S43 , 
clk_fail_en => S7 , 
clk_fail => S6 , 
loop_around => S38 , 
ser_port_en => S46 , 
swo_select => S51 , 
loopback_en => S39 , 
isolate_tgt => S40 , 
dts_tdis_pin => dts_tdis_pin , 
output_en_n => S42 , 
uart_en_stat => S59 , 
ext_select_n => S30 , 
tgt_volt_good => S55 , 
dts_ntrst_oen => S19 , 
dts_ntrst_out => S18 , 
dts_tck_out => S20 , 
ts_rtck_pin => S58 , 
dts_tmsc_oen => S21 , 
dts_tmsc_out => S22 , 
tmsc_from_tgt_pin => S56 , 
keeper_val => S36 , 
keeper_oe_n => S37 , 
dts_tdi_oen => S23 , 
dts_tdi_out => S24 , 
tdo_from_tgt_pin => S53 , 
clk_tst => clk_tst , 
dts_tap_state_tst => S17 , 
cmd_ctl_lvl_tst => S8 , 
dts_cmd_lvl_tst => S9 , 
io0_st_tst => io0_st_tst , 
std_mode_tst => S50 
);
dts_ntrst_pin <= S18 when S19 = '0' else 'Z' ; 
S25 <= ctlr_tck_pin when S38 = '1' else 
S20 ; 
dts_tck_pin <= S25 when S42 = '0' else 'Z' ; 
S26 <= ctlr_tms_pin when S38 = '1' else 
S22 ; 
S57 <= S42 when S38 = '1' else 
S21 ; 
dts_tmsc_pin <= S26 when S57 = '0' else 'Z' ; 
S27 <= ctlr_tdi_pin when S38 = '1' else 
S24 ; 
dts_tdi_pin <= S27 when S23 = '0' else 'Z' ; 
dts_keeper_pin <= S36 when S37 = '0' AND S2 = '0' 
else 'Z' ; 
dts_emu0_pin <= '0' when S28 = '1' else 
'Z' ; 
dts_emu1_pin <= '0' when S29 = '1' else 
'Z' ; 
S48 <= ctlr_nsrst_pin when S30 = '1' else ext_srst_pin ; 
dts_nsrst_pin <= '0' when S48 = '1' AND S42 = '0' else 
'Z' ; 
S59 <= S46 OR not uart_en_n ; 
dts_emu3_pin <= txd_in when S59 = '1' else 'Z' ; 
dts_emu5_pin <= rts_in_n when S59 = '1' else 'Z' ; 
S47 <= dts_emu2_pin when S51 = '0' else S53 ; 
rxd_out <= S47 when S59 = '1' else 'Z' ; 
cts_out_n <= dts_emu4_pin when S59 = '1' else 'Z' ; 

tmsc_out_tst <= S22 ; 
tmsc_oen_tst <= S21 ; 
ctl_lvl_2_tst <= S8 ; 
ctl_lvl_7_tst <= S9 ; 
std_mode_tst <= S50 ; 
test_pt1 <= S6 ; 
test_pt2 <= S59 ; 
S16 <= S17 ( K87 ); 
S52 <= K90 when S17 ( K89 ) = '1' else 
K91 when S17 ( K88 ) = '1' else 
K92 when ( S17 ( K80 ) and S16 ) = '1' else 
K93 when ( S17 ( K81 ) and S16 ) = '1' else 
K94 when ( S17 ( K82 ) and S16 ) = '1' else 
K95 when ( S17 ( K83 ) and S16 ) = '1' else 
K96 when ( S17 ( K84 ) and S16 ) = '1' else 
K97 when ( S17 ( K85 ) and S16 ) = '1' else 
K98 when ( S17 ( K86 ) and S16 ) = '1' else 
K99 when ( S17 ( K80 ) and not S16 ) = '1' else 
K100 when ( S17 ( K81 ) and not S16 ) = '1' else 
K101 when ( S17 ( K82 ) and not S16 ) = '1' else 
K102 when ( S17 ( K83 ) and not S16 ) = '1' else 
K103 when ( S17 ( K84 ) and not S16 ) = '1' else 
K104 when ( S17 ( K85 ) and not S16 ) = '1' else 
K105 when ( S17 ( K86 ) and not S16 ) = '1' else 
"XXXX" ; 
tap_st_tst <= S52 ; 
END RTL ; 
