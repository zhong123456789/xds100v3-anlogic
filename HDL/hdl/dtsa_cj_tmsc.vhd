-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library IEEE; use IEEE.Std_Logic_1164.all; use IEEE.Std_Logic_arith.all; use IEEE.Std_Logic_unsigned.all; use work.dtsa_cj_pkg.all; entity E4ee is port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; 
P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:in std_logic; P10:in std_logic; P11:in std_logic; P12:in std_logic; P13:in std_logic; P14:in std_logic; P15:in std_logic; 
P16:in std_logic; P17:in std_logic; P18:in std_logic; P19:in std_logic; P20:in std_logic; P21:in std_logic; P22:in std_logic; P23:in std_logic; P24:out std_logic; P25:out std_logic; P26:out std_logic; 
P27:out std_logic ); end E4ee; architecture RTL of E4ee is signal S1:std_logic; signal S2:std_logic; signal S3:std_logic; signal S4:std_logic; signal S5:std_logic; signal S6:std_logic; signal S7:std_logic; 
signal S8:std_logic; signal S9:std_logic; signal S10:std_logic; signal S11:std_logic; signal S12:std_logic; signal S13:std_logic; signal S14:std_logic; signal S15:std_logic; signal S16:std_logic; signal S17:std_logic; signal S18:std_logic; 
signal S19:std_logic; signal S20:std_logic; signal S21:std_logic; signal S22:std_logic; signal S23:std_logic; begin S11<=P20 OR P18 OR P19; S12<=(P5 AND P9)OR (P3 AND not P2 AND P6); S13<=P5; S14<=not P8 when(P11 OR P6)='1'else 
P9; S15<=S12 OR(not P5 AND S14); S18<=S15 when P13='1'else S10; S7<=(P17 and P15)AND not P21; S8<=P15; S4<='0'; S1<=P21 and not P22 AND (P23 XOR S23); S10<=((S7 AND S8)OR 
(S4 AND not S8))OR S1; process(P4,P0) begin if(P0='0')then S23<='1'; elsif(P4'event and P4='0')then if(S11='1')then S23<=S18; end if; end if; 
end process; P25<=S23; S5<=S21 OR P5 OR P20; S6<=S5 OR P19; S9<=(P18 OR not P12)AND not P14; S20<=S6 OR(S9 OR P13); process(P4,S22) begin if(S22='0')then S21<='0'; elsif(P4'event and P4='0')then 
S21<=S20; end if; end process; S19<=not(P16)OR P21; process(P4,P0) begin if(P0='0')then S22<='1'; elsif(P4'event and P4='1')then S22<=S19; end if; 
end process; P24<=not((S21 OR P2)AND P7); process(P4,P0) begin if(P0='0')then S17<='0'; elsif(P4'event and P4='0')then if(S20='1')then S17<=S18; end if; end if; 
end process; P26<=S17 OR P5; S16<=(S17 XOR P10)AND not S21; process(P0,P1) begin if(P0='0')then S2<='0'; elsif(P1'event and P1='0')then S2<=S16; end if; end process; 
process(P0,P1) begin if(P0='0')then S3<='0'; elsif(P1'event and P1='1')then S3<=S16; end if; end process; P27<=not(P5 OR (not S2 AND not S3)); end RTL; 
