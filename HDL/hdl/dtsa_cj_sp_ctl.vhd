-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library IEEE; use IEEE.Std_Logic_1164.all; use IEEE.Std_Logic_arith.all; use IEEE.Std_Logic_unsigned.all; use work.dtsa_cj_pkg.all; entity E5bc is port(P0:in std_logic; P1:in std_logic; P2:in std_logic_vector(K157 downto 0); P3:in std_logic; P4:in std_logic; 
P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:in std_logic; P10:in std_logic; P11:in std_logic; P12:in std_logic; P13:in std_logic; P14:in std_logic; P15:out std_logic; 
P16:out std_logic; P17:out std_logic; P18:out std_logic; P19:out std_logic; P20:out std_logic; P21:out std_logic; P22:out std_logic; P23:out std_logic; P24:out std_logic ); end E5bc; 
architecture RTL of E5bc is signal S1:std_logic; signal S2:std_logic; signal S3:std_logic; signal S4:std_logic; signal S5:std_logic; signal S6:std_logic; signal S7:std_logic; signal S8:std_logic; signal S9:std_logic; signal S10:std_logic; 
signal S11:std_logic; signal S12:std_logic; signal S13:std_logic; signal S14:std_logic; signal S15:std_logic; signal S16:std_logic; signal S17:std_logic; signal S18:std_logic; signal S19:std_logic; signal S20:std_logic; signal S21:std_logic; 
signal S22:std_logic; signal S23:std_logic; signal S24:std_logic; signal S25:std_logic_vector(1 downto 0); signal S26:std_logic_vector(2 downto 1); signal S27:std_logic; signal S28:std_logic; signal S29:std_logic; signal S30:std_logic; signal S31:std_logic; signal S32:std_logic; 
signal S33:std_logic; signal S34:std_logic; begin S19<=(P12 AND not P7); S34<=P2(K147); S5<=P2(K150); S11<=P2(K149); S7<=P2(K151); S8<=P2(K152); S9<=P2(K154); S10<=P2(K155); 
S4<=P2(K156); S18<=S25(0)OR S28; S3<=P9 OR P7; S16<=not S3 AND P12 AND not S18; P15<=S16; process(P1,P0) begin if(P0='0')then P24<='1'; elsif(P1'event and P1='0')then 
P24<=S16; end if; end process; P16<=not P7 AND P12 AND not S18; process(P1,P0) begin if(P0='0')then S25(1)<='0'; elsif(P1'event and P1='0')then if(S19='1')then S25(1)<=(S16 AND S5); 
end if; end if; end process; S6<=(S8 AND not P5)OR S5; S17<=(S11 AND P6)OR(S7 AND P5); S13<=S17 or S6; process(P1,P0) begin if(P0='0')then S25(0)<='0'; elsif(P1'event and P1='0')then 
if(S19='1')then S25(0)<=(S16 AND S13) OR S25(1); end if; end if; end process; P21<=S25(0); S14<=S4 OR(S9 AND P5); S32<=S25(0)AND S28; S27<=S32 when S16='0'else S14; 
process(P1,P0) begin if(P0='0')then S28<='0'; elsif(P1'event and P1='0')then if(S19='1')then S28<=S27; end if; end if; end process; P20<=S28; 
process(P1,P0) begin if(P0='0')then S29<='0'; elsif(P1'event and P1='0')then if(S19='1')then S29<=(S28 AND not S16)OR (S14 AND S16); end if; end if; end process; 
process(P1,P0) begin if(P0='0')then S2<='0'; elsif(P1'event and P1='0')then S2<=P7; end if; end process; P19<=(P11 AND S5)OR(P12 AND (not S5 AND S29 AND not S28 and not S2)); process(P1,P0) 
begin if(P0='0')then S24<='0'; elsif(P1'event and P1='0')then if(S19='1')then S24<=(S16 AND S14)OR (not S16 AND S24); end if; end if; end process; S22<=(S11 AND P4 AND P5)OR(S10 AND P5); 
S23<=S25(0)AND not S25(1)AND S24; S12<=S23; S20<=(S16 AND S22)OR (not S16 AND S12); process(P1,P0) begin if(P0='0')then S21<='0'; elsif(P1'event and P1='0')then if(P7='0')then S21<=S20; 
end if; end if; end process; P22<=S21; S15<=P3 when S16='1'else S26(2); process(P1,P0) begin if(P0='0')then S26(1)<='0'; elsif(P1'event and P1='0')then 
if(S19='1')then S26(1)<=S15; end if; end if; end process; P23<=S26(1); process(P1,P0) begin if(P0='0')then S26(2)<='0'; elsif(P1'event and P1='0')then 
if(S19='1')then S26(2)<=S16; end if; end if; end process; S33<=S34 AND not P14; P18<=S16 AND not(P8)AND not S33; S1<=not(P8 OR P10); S30<=((S16 AND S1)OR (not S16 AND P13)); process(P1,P0) 
begin if(P0='0')then S31<='1'; elsif(P1'event and P1='0')then S31<=S30; end if; end process; P17<=S31; end RTL; 