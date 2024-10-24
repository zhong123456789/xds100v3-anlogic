-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.dtsa_cj_pkg.all;  
entity dtsa_a3p060 is
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
end dtsa_a3p060; 
architecture RTL of dtsa_a3p060 is
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
component E48c
port ( 
P0 : in std_logic ; 
P1 : out std_logic ; 
P2 : in std_logic ; 
P3 : in std_logic ; 
P4 : in std_logic ; 
P5 : in std_logic ; 
P6 : in std_logic ; 
P7 : in std_logic ; 
P8 : out std_logic ; 
P9 : out std_logic ; 
P10 : in std_logic ; 
P11 : in std_logic ; 
P12 : out std_logic ; 
P13 : in std_logic ; 
P14 : out std_logic ; 
P15 : out std_logic ; 
P16 : in std_logic ; 
P17 : in std_logic ; 
P18 : in std_logic ; 
P19 : out std_logic ; 
P20 : in std_logic ; 
P21 : in std_logic ; 
P22 : in std_logic ; 
P23 : out std_logic ; 
P24 : out std_logic ; 
P25 : out std_logic ; 
P26 : in std_logic ; 
P27 : out std_logic ; 
P28 : out std_logic ; 
P29 : in std_logic ; 
P30 : out std_logic ; 
P31 : out std_logic ; 
P32 : out std_logic ; 
P33 : out std_logic ; 
P34 : in std_logic ; 
P35 : out std_logic ; 
P36 : out std_logic_vector ( K65 downto 0 ); 
P37 : out std_logic ; 
P38 : out std_logic ; 
P39 : out std_logic ; 
P40 : out std_logic 
);
end component E48c; 
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
signal S52 : std_logic ; 
signal S53 : std_logic_vector ( 3 downto 0 ); 
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
signal S66 : std_logic ; 
begin
S38 <= not dtsa_byp_n ; 
I82:E557
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
P10 => S50 , 
P11 => S53 , 
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
S44 <= ( suspend_n AND por_n_pin ); 
I83:pll_x48
port map ( 
POWERDOWN => S44 , 
CLKA => clk_2m , 
LOCK => open , 
GLA => S41 ); 
shdn_n <= '0' when suspend_n = '0' else 'Z' ; 
I84:E578
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
P8 => S56 , 
P9 => S43 ); 
I85:E360
port map ( 
P0 => S45 , 
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
S63 <= ctlr_tms_pin when S30 = '1' else ext_tms_pin ; 
S62 <= ctlr_tck_pin when S30 = '1' else ext_tck_pin ; 
S64 <= ctlr_tdi_pin when S30 = '1' else ext_tdi_pin ; 
S61 <= ctlr_ntrst_pin when S30 = '1' else ext_ntrst_pin ; 
S55 <= ctlr_tdi_pin when S39 = '1' else 
S54 ; 
tdo_to_ctlr <= S55 when S38 = '1' else 
S65 ; 
tdo_to_ext <= S65 when S30 = '0' else 
S3 ; 
ctlr_rtck_pin <= S59 when S38 = '1' else 
S66 ; 
ext_rtck_pin <= ext_tck_pin when S30 = '1' else 
S66 ; 
S15 <= ( not S42 ) OR S39 ; 
S14 <= ( dts_tdis_pin OR not S30 ) AND not S39 ; 
ext_tvd_pin <= not S32 when S2 = '1' else 
S30 OR S56 ; 
ext_tdis_pin <= S31 when S2 = '1' else 
dts_tdis_pin AND not S30 ; 
S28 <= not ext_emu0_pin when S30 = '0' else 
not S10 AND S11 ; 
S29 <= not ext_emu1_pin when S30 = '0' else 
not S10 AND S12 ; 
SIM_GEN:if( SIM_MODE = 1 ) generate 
S54 <= dts_tdo_pin AND S1 ; 
S57 <= dts_tmsc_pin AND S1 ; 
S46 <= dts_rtck_pin AND S1 ; 
S50 <= not dts_nsrst_pin AND S1 ; 
end generate SIM_GEN;
SIM_NOGEN:if( SIM_MODE = 0 ) generate 
S54 <= dts_tdo_pin ; 
S57 <= dts_tmsc_pin ; 
S46 <= dts_rtck_pin ; 
S50 <= not dts_nsrst_pin ; 
end generate SIM_NOGEN;
S35 <= S42 OR S39 OR S6 ; 
S59 <= S20 when S35 = '1' else 
(S46 OR S34 ); 
I86:E48c
port map ( 
P0 => por_n_pin , 
P1 => S45 , 
P2 => S41 , 
P3 => S5 , 
P4 => S62 , 
P5 => S61 , 
P6 => S63 , 
P7 => S64 , 
P8 => S65 , 
P9 => S66 , 
P10 => S43 , 
P11 => S7 , 
P12 => S6 , 
P13 => S38 , 
P14 => S47 , 
P15 => S52 , 
P16 => S39 , 
P17 => S40 , 
P18 => dts_tdis_pin , 
P19 => S42 , 
P20 => S60 , 
P21 => S30 , 
P22 => S56 , 
P24 => S19 , 
P23 => S18 , 
P25 => S20 , 
P26 => S59 , 
P27 => S21 , 
P28 => S22 , 
P29 => S57 , 
P30 => S36 , 
P31 => S37 , 
P32 => S23 , 
P33 => S24 , 
P34 => S54 , 
P35 => clk_tst , 
P36 => S17 , 
P37 => S8 , 
P38 => S9 , 
P39 => io0_st_tst , 
P40 => S51 
);
dts_ntrst_pin <= S18 when S19 = '0' else 'Z' ; 
S25 <= ctlr_tck_pin when S38 = '1' else 
S20 ; 
dts_tck_pin <= S25 when S42 = '0' else 'Z' ; 
S26 <= ctlr_tms_pin when S38 = '1' else 
S22 ; 
S58 <= S42 when S38 = '1' else 
S21 ; 
dts_tmsc_pin <= S26 when S58 = '0' else 'Z' ; 
S27 <= ctlr_tdi_pin when S38 = '1' else 
S24 ; 
dts_tdi_pin <= S27 when S23 = '0' else 'Z' ; 
dts_keeper_pin <= S36 when S37 = '0' AND S2 = '0' 
else 'Z' ; 
dts_emu0_pin <= '0' when S28 = '1' else 
'Z' ; 
dts_emu1_pin <= '0' when S29 = '1' else 
'Z' ; 
S49 <= ctlr_nsrst_pin when S30 = '1' else '0' ; 
dts_nsrst_pin <= '0' when S49 = '1' AND S42 = '0' else 
'Z' ; 
S60 <= S47 OR not uart_en_n ; 
dts_emu3_pin <= txd_in when S60 = '1' else 'Z' ; 
dts_emu5_pin <= rts_in_n when S60 = '1' else 'Z' ; 
S48 <= dts_emu2_pin when S52 = '0' else S54 ; 
rxd_out <= S48 when S60 = '1' else 'Z' ; 
cts_out_n <= dts_emu4_pin when S60 = '1' else 'Z' ; 
adv_mode_led <= S51 when S2 = '0' else not S33 ; 
tmsc_out_tst <= S22 ; 
tmsc_oen_tst <= S21 ; 
ctl_lvl_2_tst <= S8 ; 
ctl_lvl_7_tst <= S9 ; 
std_mode_tst <= S51 ; 
test_pt1 <= S6 ; 
test_pt2 <= S60 ; 
S16 <= S17 ( K89 ); 
S53 <= K92 when S17 ( K91 ) = '1' else 
K93 when S17 ( K90 ) = '1' else 
K94 when ( S17 ( K82 ) and S16 ) = '1' else 
K95 when ( S17 ( K83 ) and S16 ) = '1' else 
K96 when ( S17 ( K84 ) and S16 ) = '1' else 
K97 when ( S17 ( K85 ) and S16 ) = '1' else 
K98 when ( S17 ( K86 ) and S16 ) = '1' else 
K99 when ( S17 ( K87 ) and S16 ) = '1' else 
K100 when ( S17 ( K88 ) and S16 ) = '1' else 
K101 when ( S17 ( K82 ) and not S16 ) = '1' else 
K102 when ( S17 ( K83 ) and not S16 ) = '1' else 
K103 when ( S17 ( K84 ) and not S16 ) = '1' else 
K104 when ( S17 ( K85 ) and not S16 ) = '1' else 
K105 when ( S17 ( K86 ) and not S16 ) = '1' else 
K106 when ( S17 ( K87 ) and not S16 ) = '1' else 
K107 when ( S17 ( K88 ) and not S16 ) = '1' else 
"XXXX" ; 
tap_st_tst <= S53 ; 
END RTL ; 
