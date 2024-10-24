# create_clock -add -name <string> -period <double> -waveform <string> target
# new input clock is 50 Mhz
create_clock  -period 20 -waveform {0 10} [get_ports i_clk_50m]
create_clock  -period 10 -waveform {0 5} [get_nets {pll_clk_u0/clkc_wire[0]}]

# fastest TCK can be is master_clk/2
create_generated_clock -name {internal_tck} -divide_by 2 -source [get_nets {pll_clk_u0/clkc_wire[0]}] [get_nets {dtsa_fpga/DTSK/TC0/tsm_pres_st[3]}]

# clock for BIST target
#create_clock -period 200 -waveform {0 100} [get_nets {dtsa_fpga/ext_tck_pin}]


#------------------------------------------------------
# False Paths Between Clocks
#------------------------------------------------------

#set_false_path -from clk_2m -to master_clk

# no existing path so don't need a constraint
#set_false_path -from ext_tck_pin -to master_clk
 
#------------------------------------------------------
# False Path Constraints to test points and LEDs
#------------------------------------------------------

set_false_path -to [get_ports { o_adv_mode_led}]

#set_false_path -to [get_ports { clk_tst}]
#set_false_path -to [get_ports { tmsc_out_tst} ]   
#set_false_path -to [get_ports { tmsc_oen_tst}]
#set_false_path -to [get_ports { tap_st_tst}]
#set_false_path -to [get_ports { ctl_lvl_2_tst}]
#set_false_path -to [get_ports { ctl_lvl_7_tst}]
#set_false_path -to [get_ports { io0_st_tst}]
#set_false_path -to [get_ports { std_mode_tst}]
#set_false_path -to [get_ports { test_pt1}]
#set_false_path -to [get_ports { test_pt2}]

#------------------------------------------------------
# False path to/from points with no real timing
#------------------------------------------------------

set_false_path -from [get_ports {io_dts_nsrst_pin}] -to [get_ports {o_clk_fail_pin}]
set_false_path -from [get_ports {i_ctlr_nsrst_pin}] -to [get_ports {io_dts_nsrst_pin} ]

#set_false_path -from [get_ports {ext_emu0_pin}] -to [get_ports {dts_emu0_pin}]
#set_false_path -from [get_ports {ext_emu1_pin}] -to [get_ports {dts_emu1_pin}]

set_false_path  -to [get_ports {o_ctlr_tvd_pin}]
set_false_path  -to [get_ports {o_ctlr_tdis_pin}]
set_false_path  -to [get_ports {o_clk_fail_pin}]

set_false_path -from [get_ports {i_ctlr_pod_rls_pin}] 
set_false_path -from [get_ports {i_dtsa_byp_n}] 
set_false_path -from [get_ports {i_ctlr_emu_en_pin}] 
set_false_path -from [get_ports {i_alt_function_n}]


set_false_path -from [get_ports {i_txd_in}]
set_false_path -to [get_ports {o_rxd_out}]
#set_false_path -from [get_ports {rts_in_n}]
#set_false_path -to [get_ports {cts_out_n}]
#set_false_path -from [get_ports {uart_en_n}]

#set_false_path -to [get_ports {ext_tvd_pin}]
#set_false_path -to [get_ports {ext_tdis_pin}]

set_false_path -from [get_ports {i_dts_emu2_pin}]
set_false_path -to [get_ports {o_dts_emu3_pin}]
#set_false_path -from [get_ports {dts_emu4_pin}]
#set_false_path -to [get_ports {dts_emu5_pin}]

#------------------------------------------------------
# Maximum Delay Constraints
#------------------------------------------------------

set_max_delay 25.00 -from [get_ports {i_ctlr_ntrst_pin}] -to [get_ports {o_dts_ntrst_pin}]
#set_max_delay 25.00 -from [get_ports {dts_tdis_pin}] -to [get_ports {ctlr_tdis_pin}]

#set_max_delay 25.00 -from [get_ports {ext_emu0_pin}] -to [get_ports {dts_emu0_pin}]
#set_max_delay 25.00 -from [get_ports {ext_emu1_pin}] -to [get_ports {dts_emu1_pin}]
#set_max_delay 25.00 -from [get_ports {dts_tdis_pin}] -to [get_ports {ext_tdis_pin}]