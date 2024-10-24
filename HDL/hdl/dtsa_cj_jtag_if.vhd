-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library IEEE; use IEEE.STD_LOGIC_1164.ALL; use work.dtsa_cj_pkg.all; entity E60b is port( P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; P5:in std_logic; 
P6:in std_logic; P7:in std_logic; P8:out std_logic; P9:in std_logic; P10:in std_logic; P11:in std_logic; P12:in std_logic; P13:out std_logic; P14:in std_logic; P15:in std_logic; P16:in std_logic; 
P17:in std_logic; P18:out std_logic; P19:out std_logic; P20:out std_logic; P21:out std_logic; P22:out std_logic; P23:out std_logic; P24:out std_logic; P25:out std_logic; P26:out std_logic ); 
end E60b; architecture RTL of E60b is signal S1:std_logic; signal S2:std_logic; signal S3:std_logic; signal S4:std_logic; signal S5:std_logic; signal S6:std_logic; signal S7:std_logic; signal S8:std_logic; signal S9:std_logic; 
signal S10:std_logic; begin P21<=not(not P5 AND P15 AND not P4); P20<=not(not P5 AND P15 AND P4); P18<=not(not P5 AND P15 AND P4 AND not P2); S10<=P9 when P10='1'else P11; I15:process(P0,P1) 
begin if(P0='0')then S6<='1'; elsif(P1'event and P1='1')then S6<=S10; end if; end process I15; I16:process(P0,P1) begin if(P0='0')then S9<='1'; 
elsif(P1'event and P1='0')then S9<=S6; end if; end process I16; I17:process(P0,P1) begin if(P0='0')then S1<='1'; elsif(P1'event and P1='0')then if(P17='1')then S1<=P12; 
end if; end if; end process I17; P8<=S9 when P14='1'else S1; process(P0,P1) begin if(P0='0')then P13<='1'; elsif(P1'event AND P1='1')then P13<=P12; 
end if; end process; process(P0,P1) begin if(P0='0')then S8<='1'; elsif(P1'event and P1='1')then if(P16='1')then S8<=P7; end if; end if; 
end process; S7<=S8 when(P3='1')else P7; process(P0,P1) begin if(P0='0')then S3<='1'; elsif(P1'event and P1='0')then if(P16='1')then S3<=S7; end if; 
end if; end process; P26<=S3; P24<=S3; process(P1,P0) begin if(P0='0')then P19<='1'; elsif(P1'event and P1='1')then P19<=S3; end if; 
end process; process(P0,P1) begin if(P0='0')then S5<='1'; elsif(P1'event and P1='1')then if(P16='1')then S5<=P6; end if; end if; end process; 
S4<=S5 when(P3='1')else P6; process(P0,P1) begin if(P0='0')then S2<='1'; elsif(P1'event and P1='0')then if(P16='1')then S2<=S4; end if; end if; 
end process; P25<=S2; process(P1,P0) begin if(P0='0')then P22<='1'; elsif(P1'event and P1='0')then P22<=S2; end if; end process; process(P1,P0) 
begin if(P0='0')then P23<='1'; elsif(P1'event and P1='1')then P23<=S2; end if; end process; end RTL; 