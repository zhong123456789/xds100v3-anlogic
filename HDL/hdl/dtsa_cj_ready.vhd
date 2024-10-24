-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library IEEE; use IEEE.Std_Logic_1164.all; use IEEE.Std_Logic_arith.all; use IEEE.Std_Logic_unsigned.all; use work.dtsa_cj_pkg.all; entity E54c is port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; 
P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:out std_logic; P10:out std_logic ); end E54c; architecture RTL of E54c is signal S1:std_logic; signal S2:std_logic; 
signal S3:std_logic; signal S4:std_logic; signal S5:std_logic; signal S6:std_logic; signal S7:std_logic; signal S8:std_logic; signal S9:std_logic; signal S10:std_logic; signal S11:std_logic; signal S12:std_logic; signal S13:std_logic; 
signal S14:std_logic; signal S15:std_logic; begin S1<=P4 OR S2; process(P1,P0) begin if(P0='0')then S2<='0'; elsif(P1'event and P1='0')then S2<=not S1 AND P2; end if; 
end process; process(P1,P0) begin if(P0='0')then P9<='0'; elsif(P1'event and P1='0')then P9<=S2 AND S13; end if; end process; S4<=not(P5); S5<=S8 AND not S12; 
S6<=not P3 AND P6 AND P4; S7<='0'when P7='1'else (S6 OR S5); process(P1,P0) begin if(P0='0')then S8<='0'; elsif(P1'event and P1='0')then if(S4='1')then S8<=S7; end if; 
end if; end process; S3<=not(not S8 OR S12); S15<=P8; S14<=(S15 AND S3)when S2='0'else S13; process(P1,S8) begin if(S8='0')then S13<='0'; elsif(P1'event and P1='0')then 
if(S4='1')then S13<=S14; end if; end if; end process; S12<=(S13 AND S11)OR not S8; P10<=S12; S10<=S2 when P2='1'else '1'; S9<=not S12 AND S10; process(P1,P0) 
begin if(P0='0')then S11<='0'; elsif(P1'event and P1='0')then if(S4='1')then S11<=S9; end if; end if; end process; end RTL; 