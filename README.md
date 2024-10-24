#  **`Anlogic EF2M45 XDS100V3国产化方案`**

XDS100V3的FPGA部分仅用作JTAG协议转换功能，因此可选择使用国产FPGA；目前选择Anlogic方案，EF2M45，EF2M45封装为LQFP48，且包含内部Flash，无需外挂外部Flash存储FPGA bit文件，且仅需要单相供电，可降低layout难度；  
因为封装偏小，需要裁剪原有的部分引脚，屏蔽部分功能，当前已完成测试，实物如下：  

![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/XDS100V3-ANLOGIC-bord.png)  

## 1.1、电路原理图

#### 电源部分
FPGA和FT2232仅需要1.8V、3.3V和VTAG  
* 3.3V电源电路，如下：     
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/xds3v3.png)  

* 1.8V电源，由FT2232 内部的LDO产生，后级VTAG仅需要1.8V作为参考，功耗不大   
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/xds1v8.png)  

* VTAG电源，根据JTAG TVD信号的电平，输出同步电压，给FPGA BANK0供电，实现与不同电平电路的互联
BANK0 手册要求供电电压>1.5V，建议D4使用低电压降的二极管，保证VTAG>1.5V  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/xdsVTAG.png)  

FPGA个BANK电压，BANK1-3供电电压为3.3V，BANK0为VTAG 

#### FPGA部分 BANK0、BANK1
* BANK0:  
DTS JTAG的所有信号，FPGA的JTAG Pin和XDS100V3的JTAG Pin复用，通过EF_PROG_EN_n和EF_JTAGEN信号切换功能；
* BANK1：
  串口信号;
  50M时钟信号（原版位100M，当前修改为50M，通过内部的PL锁定至100M）;
  POR_RST：复位信号； 
  PWERGOOD： TVD功能信号，当VTAG > 3V3/2时输出高电平，代表供电正常；  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/BANK0__BANK1.png)  

![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/xdsTVD.png)  

#### FPGA部分 BANK2、BANK3
* BANK2
ADV_MODE_LED：LED状态信号；
Alt_Func_n  : FT2232输出的Alt功能控制信号；
Dtsa_byp_n  : FT2232与FPGA间互联信号；
CTL_DIS     : FT2232与FPGA间互联信号；
* BANK3
FT2232与FPGA间互联的大部分信号  

![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/xdsBANK1_BANK2.png)  

#### FT2232电路
FT2232电路电路如下：  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/xdsFT2232.png)  


#### 注意
EF_JTAGEN建议使用<= 1K电阻下拉，否则会导致FPGA工作异常；  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/xdsJTE.png)  


## 1.2、FPGA VHDL文件综合
Anlogic EF2M45 使用Anlogic TangDynasty（简称TD）软件开发，因此我们需要使用TD软件重新综合VHDL文件；  

### 1.2.1、TD软件安装
[Anlogic官方TD下载链接](https://www.anlogic.com/support/tools-downloads)，官网下载需要升级到对应的权限，需要发邮件给Anlogic说明需求等待回复；建议下载仅包含Release的包，其他描述的可能不支持EF2M45器件  

![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/AnlogicTangDynasty.png)  

安装完成后复制license到安装目录即可使用；  

### 1.2.2、创建工程、添加VHDL文件
* 创建工程  
选择EF2M45LG48B器件  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/project-new-dev.png)  

* FPGA的JTAG作为普通IO  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/project-jtag.png)  

* 选择添加HDL文件  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/project-hdl.png)  

* 移除dtsa_a3p060.vhd文件  
不需要dtsa_a3p060.vhd文件，移除即可  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/dtsa_a3p060.png)  

* 设置xds-anlogic.vhdl为顶层文件  
该文件调用了dtsa_a3p125，配置dtsa_a3p125某些未使用的port为默认值  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/prj-xds-anlogic.png)  

### 1.2.3、添加PLL IP核

因为工程需要PLL将50M时钟信号锁频到100M，所以需要添加PLL IP核    
* 按照下图配置IP对应参数  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/PLLIP.png)  

* 确认参数后点击生成VHDL文件  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/pll_ip_2.png)  

![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/pll_ip_3.png)  

* 刷新检查VHDL文件语法，确认语法正常  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/VHDL_Check.png)  

### 1.2.4、添加引脚约束ADC文件
添加ADC引脚约束文件，分配配置FPGA引脚  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/ADCcon.png)  

文件内容如下：  
```BASH
# bank 0 
set_pin_assignment	{ io_dts_keeper_pin }	{ LOCATION = P3 ; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = SLOW; DRIVESTRENGTH = 4; }
#set_pin_assignment	{ i_xdsvser_sel }	    { LOCATION = P6 ; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ io_dts_nsrst_pin }	{ LOCATION = P6 ; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; SLEWRATE = SLOW; DRIVESTRENGTH = 4; }
set_pin_assignment	{ o_dts_ntrst_pin }	    { LOCATION = P7 ; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = SLOW; DRIVESTRENGTH = 4; }
set_pin_assignment	{ o_dts_emu3_pin }	    { LOCATION = P9 ; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; SLEWRATE = SLOW; DRIVESTRENGTH = 4; }
set_pin_assignment	{ i_dts_emu2_pin }	    { LOCATION = P10; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ o_dts_tck_pin }	    { LOCATION = P11; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = FAST; DRIVESTRENGTH = 4; }
set_pin_assignment	{ i_dts_tdo_pin }	    { LOCATION = P12; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ;}
set_pin_assignment	{ o_dts_tdi_pin }	    { LOCATION = P13; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = FAST; DRIVESTRENGTH = 4; }
set_pin_assignment	{ io_dts_tmsc_pin }	    { LOCATION = P14; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = FAST; DRIVESTRENGTH = 4; }

#bank 1
#set_pin_assignment	{ io_dts_nsrst_pin }	{ LOCATION = P18; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; SLEWRATE = FAST; DRIVESTRENGTH = 20; }
set_pin_assignment	{ i_dts_tvd_pin }	    { LOCATION = P19; IOSTANDARD = LVCMOS33; PULLTYPE = PULLDOWN; }
set_pin_assignment	{ i_por_n_pin }	        { LOCATION = P21; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; }
set_pin_assignment	{ i_clk_50m }	        { LOCATION = P22; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ;  }
set_pin_assignment	{ o_rxd_out }	        { LOCATION = P24; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = FAST; DRIVESTRENGTH = 20; }
set_pin_assignment	{ i_txd_in }	        { LOCATION = P25; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ o_pll_clk_out }	    { LOCATION = P16; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = FAST; DRIVESTRENGTH = 20; }

#bank 2
set_pin_assignment	{ o_adv_mode_led }	    { LOCATION = P26; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = SLOW; DRIVESTRENGTH = 4; }
set_pin_assignment	{ i_alt_function_n }	{ LOCATION = P27; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ i_dtsa_byp_n }	    { LOCATION = P28; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ o_ctlr_tdis_pin }	    { LOCATION = P30; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = SLOW; DRIVESTRENGTH = 2; }

#bank 3
set_pin_assignment	{ i_ctlr_pod_rls_pin }	{ LOCATION = P34; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ i_ctlr_emu1_pin }	    { LOCATION = P36; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ o_ctlr_tvd_pin }	    { LOCATION = P37; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = FAST; DRIVESTRENGTH = 20; }
set_pin_assignment	{ o_clk_fail_pin }	    { LOCATION = P38; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = FAST; DRIVESTRENGTH = 20; }

set_pin_assignment	{ i_ctlr_nsrst_pin }	{ LOCATION = P39; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ o_ctlr_rtck_pin }	    { LOCATION = P40; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = FAST; DRIVESTRENGTH = 20; }
set_pin_assignment	{ i_ctlr_emu0_pin }	    { LOCATION = P41; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ i_ctlr_emu_en_pin }	{ LOCATION = P42; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }

set_pin_assignment	{ i_ctlr_ntrst_pin }	{ LOCATION = P43; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }

set_pin_assignment	{ i_ctlr_tms_pin }	    { LOCATION = P44; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ o_tdo_to_ctlr }	    { LOCATION = P45; IOSTANDARD = LVCMOS33; PULLTYPE = NONE    ; SLEWRATE = FAST; DRIVESTRENGTH = 20; }
set_pin_assignment	{ i_ctlr_tdi_pin }	    { LOCATION = P46; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
set_pin_assignment	{ i_ctlr_tck_pin }	    { LOCATION = P47; IOSTANDARD = LVCMOS33; PULLTYPE = PULLUP  ; }
```
### 1.2.5、添加时序约束SDC文件
参考3.2.4、添加引脚约束ADC文件，SDC文件内容如下  
```BASH
# create_clock -add -name <string> -period <double> -waveform <string> target
# new input clock is 50 Mhz
create_clock  -period 20 -waveform {0 10} [get_ports i_clk_50m]
create_clock  -period 10 -waveform {0 5} [get_nets {pll_clk_u0/clkc_wire[0]}]

# fastest TCK can be is master_clk/2
create_generated_clock -name {internal_tck} -divide_by 2 -source [get_nets {pll_clk_u0/clkc_wire[0]}] [get_nets {dtsa_fpga/DTSK/TC0/tsm_pres_st[3]}]


#------------------------------------------------------
# False Path Constraints to test points and LEDs
#------------------------------------------------------

set_false_path -to [get_ports { o_adv_mode_led}]


#------------------------------------------------------
# False path to/from points with no real timing
#------------------------------------------------------

set_false_path -from [get_ports {io_dts_nsrst_pin}] -to [get_ports {o_clk_fail_pin}]
set_false_path -from [get_ports {i_ctlr_nsrst_pin}] -to [get_ports {io_dts_nsrst_pin} ]

set_false_path  -to [get_ports {o_ctlr_tvd_pin}]
set_false_path  -to [get_ports {o_ctlr_tdis_pin}]
set_false_path  -to [get_ports {o_clk_fail_pin}]

set_false_path -from [get_ports {i_ctlr_pod_rls_pin}] 
set_false_path -from [get_ports {i_dtsa_byp_n}] 
set_false_path -from [get_ports {i_ctlr_emu_en_pin}] 
set_false_path -from [get_ports {i_alt_function_n}]


set_false_path -from [get_ports {i_txd_in}]
set_false_path -to [get_ports {o_rxd_out}]

set_false_path -from [get_ports {i_dts_emu2_pin}]
set_false_path -to [get_ports {o_dts_emu3_pin}]
#------------------------------------------------------
# Maximum Delay Constraints
#------------------------------------------------------

set_max_delay 25.00 -from [get_ports {i_ctlr_ntrst_pin}] -to [get_ports {o_dts_ntrst_pin}]
```

### 1.2.6、综合VHDL文件
点击RUN按钮一键综合 HDL文件，可下方查看生产结构及资源消耗情况
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/TDrun.png)

### 1.2.7、烧录到FPGA FLASH
* 点击Download按钮,如果显示No hardware，可能是Anlogic USA JTAG下载器的驱动未安装需要手动安装，驱动目录位于 `软件安装目录/driver` 目录下  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/TDDownLoad.png)
* 安装完成驱动后，设备管理器，应该有`AL-Link` 设备  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/AL-Link.png)

* 将EF_JTAGEN信号拉高即可刷新出EF2M45B设备  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/EF2M45B-dev.png)

* 烧录到FPGA FLASH  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/bitfile.png)
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/download_run.png)

### 注意： ###   
因为FPGA的JTAG复用作为IO，但是与PCB上的丝印的映射不同，烧录下载时需要按下图连接下载器：  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/JTAG-SY.png)

## 1.3、FT2232 EEPROM设置
使用FTDI的官方软件[FT_Prog]()编辑配置FT2232，打开软件点击 `DEVICES` -> `Scan and Parse`，软件会自动扫描连接设备，按以下配置各参数：
* USB Device Descriptors:  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/USBDeviceDescriptors.png)

* USB Config Descriptors:  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/USBConfigDescriptors.png)

* USB String Descriptors:  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/USBStringDescriptors.png)

* PortA Hardware Specific  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/PortAHardwareSpecific.png)

* PortA Driver  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/PortADriver.png)

* PortB Hardware Specific  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/PortBHardwareSpecific.png)

* PortB  Driver  
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/PortBDriver.png)

修改完成后点击 `DEVICES` -> `Program`烧录配置到FT2232外挂的EEPROM中，然后再点击软件`DEVICES` -> `Scan and Parse`刷新读取FT2232外挂的EEPROM信息：
* EEPROM信息如下
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/ft2232_eeprom.png)

## 1.4、功能测试
使用TI 的CCS IDE测试XDS100V3，结果如下：   
![alt text](https://github.com/zhong123456789/jp-map/blob/main/xds100v3-anlogic/ccs_ide_xds100v3.png)
