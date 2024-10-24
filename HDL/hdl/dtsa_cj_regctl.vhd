-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library IEEE; use IEEE.std_logic_1164.all; use IEEE.std_logic_arith.all; use IEEE.std_logic_unsigned.all; library work; use work.dtsa_cj_pkg.all; entity E5b8 is port(P0:in std_logic; P1:in std_logic; P2:in std_logic_vector(K63 downto 0); P3:in std_logic; 
P4:in std_logic; P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:out std_logic_vector(9 downto 0); P9:out std_logic; P10:out std_logic; P11:out std_logic; P12:out std_logic ); end E5b8; 
architecture RTL of E5b8 is CONSTANT S1:std_logic_vector(2 downto 0):="000"; CONSTANT S2:std_logic_vector(2 downto 0):="111"; CONSTANT S3:std_logic_vector(2 downto 0):="001"; CONSTANT S4:std_logic_vector(2 downto 0):="110"; CONSTANT S5:std_logic_vector(2 downto 0):="011"; CONSTANT S6:std_logic_vector(2 downto 0):="100"; signal S7:std_logic; signal S8:std_logic; signal S9:std_logic; signal S10:std_logic_vector(K106 downto 0); 
signal S11:std_logic_vector(K107 downto 0); signal S12:std_logic; signal S13:std_logic_vector(2 downto 0); signal S14:std_logic_vector(2 downto 0); signal S15:std_logic; signal S16:std_logic; signal S17:std_logic; signal S18:std_logic; signal S19:std_logic; signal S20:std_logic; signal S21:std_logic; 
signal S22:std_logic; signal S23:std_logic; signal S24:std_logic; signal S25:std_logic; signal S26:std_logic; begin S20<=P2(K89); S7<=P2(K81)AND P2(K87); S19<=P2(K82)AND P2(K87); S23<=P2(K86); S24<=P2(K81); 
S25<=P2(K80); S26<=P2(K87)OR P2(K88); I18:process(P1,P0) begin if(P0='0')then S11<=(others=>'0'); elsif(P1'event and P1='0')then if(P5='1')then if(S7 OR S20 OR not S15)='1'then S11<=(others=>'0'); elsif(S19 AND S15)='1'then 
S11<=S11+"00001"; end if; end if; end if; end process I18; I19:process(P1,P0) begin if(P0='0')then S10<=(others=>'0'); elsif(P1'event and P1='0')then if(P5='1')then 
if(S16='1')then S10<=S11; end if; end if; end if; end process I19; P8<=S10&S11; S18<='1'when S10=K118 else'0'; S17<='1'when S10=K117 else'0'; S8<='1'when S10=K119 else'0'; I20:process(P1,P0) 
begin if(P0='0')then S12<='0'; elsif(P1'event and P1='0')then if(P5='1')then S12<=S18 OR S17 OR S8; end if; end if; end process I20; I21:process(P1,P0) begin 
if(P0='0')then S14<=S1; elsif(P1'event and P1='0')then if(P5='1')then if((S26='1')AND(P4='1'))then S14<=S13; else S14<=S1; end if; end if; end if; 
end process I21; I22:process(S14,S23,S25,S9,S24,S12) begin case S14 is when S1=> if(S25='1')then S13<=S2; else S13<=S1; end if; when S2=> 
if(S23='1')then S13<=S3; else S13<=S2; end if; when S3=> if(S24='1')then S13<=S4; else S13<=S3; end if; 
when S4=> if(S9='1')then if(S12='1')then S13<=S5; else S13<=S1; end if; else S13<=S4; end if; when S5=> 
S13<=S6; when S6=> if(S23='1')then S13<=S1; else S13<=S6; end if; when others=> S13<=S1; end case; end process I22; 
S15<=S14(2); S21<=S14(1)AND not S14(0); S16<=S14(1)AND S14(0); I23:process(P1,P0) begin if(P0='0')then S9<='0'; elsif(P1'event and P1='0')then if(P5='1')then S9<=S21 AND P3; end if; 
end if; end process I23; P9<=S9; I24:process(P1,P0) begin if(P0='0')then S22<='0'; elsif(P1'event and P1='0')then if(P5='1')then S22<=P6; end if; 
end if; end process I24; P10<=S21 AND P3 AND not S22; I25:process(P1,P0) begin if(P0='0')then P11<='0'; elsif(P1'event and P1='0')then if(P5='1')then P11<=S21 AND P3 AND not S22; end if; 
end if; end process I25; P12<=S21 AND P3 AND P7; end rtl; 