-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_unsigned.all;
 library work;
 entity E578 is generic(SIM_MODE:integer range 0 to 1:=0);
 port( 
    P0:in std_logic;
 P1:in std_logic;
 P2:in std_logic;
 P3:in std_logic;
 
P4:in std_logic;
 P5:in std_logic;
 P6:out std_logic;
 P7:out std_logic;
 P8:out std_logic;
 P9:out std_logic );
 end E578;
 architecture RTL of E578 is CONSTANT S1:std_logic_vector(2 downto 0):="000";
 CONSTANT S2:std_logic_vector(2 downto 0):="001";
 
CONSTANT S3:std_logic_vector(2 downto 0):="010";
 CONSTANT S4:std_logic_vector(2 downto 0):="011";
 CONSTANT S5:std_logic_vector(2 downto 0):="100";
 signal S6:std_logic_vector(7 downto 0);
 signal S7:std_logic;
 signal S8:std_logic;
 signal S9:std_logic;
 signal S10:std_logic_vector(7 downto 0);
 signal S11:std_logic;
 signal S12:std_logic;
 signal S13:std_logic;
 
signal S14:std_logic;
 signal S15:std_logic;
 signal S16:std_logic_vector(2 downto 0);
 signal S17:std_logic;
 signal S18:std_logic_vector(2 downto 0);
 signal S19:std_logic;
 signal S20:std_logic;
 signal S21:std_logic_vector(3 downto 0);
 signal S22:std_logic;
 signal S23:std_logic;
 begin 
process(P1,P0) begin if(P0='0')then S6<=(others=>'0');
 elsif(P1'event AND P1='1')then S6<=S6+"01";
 end if;
 end process;
 S8<='1'when S6="11111111"else'0';
 process(P1,P0) begin 
if(P0='0')then S9<='0';
 elsif(P1'event AND P1='1')then S9<=S8;
 end if;
 end process;
 process(P1,P0) begin if(P0='0')then S10<=(others=>'0');
 elsif(P1'event AND P1='1')then 
if(S9='1')then S10<=S10+"01";
 end if;
 end if;
 end process;
 S12<='1'when S10="11111111"else'0';
 S11<='1'when S10(1 downto 0)="11"else'0';
 process(P1,P0) begin if(P0='0')then P6<='0';
 
elsif(P1'event AND P1='1')then P6<=S9 AND S11;
 end if;
 end process;
 process(P1,P0) begin if(P0='0')then S13<='0';
 elsif(P1'event AND P1='1')then S13<=S9 AND S12;
 end if;
 
end process;
 SIM_GEN:if(SIM_MODE=1)generate S15<=S9;
 end generate SIM_GEN;
 NOSIM_GEN:if(SIM_MODE=0)generate S15<=S13;
 end generate NOSIM_GEN;
 P7<=S15;
 process(P1,P0) begin if(P0='0')then 
S21<=(others=>'0');
 elsif(P1'event AND P1='1')then if(S15='1')then S21<=S21(2 downto 0)&P5;
 end if;
 end if;
 end process;
 S22<='1'when S21="1111"else'0';
 S23<='1'when S21="0000"else'0';
 process(P1,P0) begin 
if(P0='0')then S20<='0';
 elsif(P1'event AND P1='1')then if(S22='1')then S20<='1';
 elsif(S23='1')then S20<='0';
 end if;
 end if;
 end process;
 P8<=S20;
 
S7<='1'when S6(2 downto 0)="111"else'0';
 process(P1,P0) begin if(P0='0')then S19<='0';
 elsif(P1'event AND P1='1')then S19<=S7;
 end if;
 end process;
 process(P1,P0) begin 
if(P0='0')then S14<='0';
 elsif(P1'event AND P1='1')then S14<=P2;
 end if;
 end process;
 process(P1,P0) begin if(P0='0')then S18<=S1;
 elsif(P1'event and P1='1')then 
if S19='1'then S18<=S16;
 end if;
 end if;
 end process;
 process(S18,S14,S20) begin CASE S18 IS WHEN S1=> if(S14='0')then S16<=S2;
 
else S16<=S1;
 end if;
 WHEN S2=> if(S14='1')then S16<=S3;
 else S16<=S2;
 end if;
 WHEN S3=> if(S14='0')then 
S16<=S4;
 else S16<=S3;
 end if;
 WHEN S4=> if(S14='1')then S16<=S5;
 else S16<=S4;
 end if;
 WHEN S5=> 
if(S20='0')then S16<=S1;
 else S16<=S5;
 end if;
 WHEN others=> S16<=S1;
 END CASE;
 end process;
 S17<=P4 when P3='1'else S18(2);
 
process(P1,P0) begin if(P0='0')then P9<='0';
 elsif(P1'event and P1='1')then P9<=S17;
 end if;
 end process;
 END RTL;
 