-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library IEEE; use IEEE.Std_Logic_1164.all; use IEEE.Std_Logic_arith.all; use IEEE.Std_Logic_unsigned.all; use work.dtsa_cj_pkg.all; entity E6e4 is port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; 
P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:in std_logic; P10:in std_logic; P11:in std_logic; P12:out std_logic; P13:out std_logic; P14:out std_logic; P15:out std_logic; 
P16:out std_logic ); end E6e4; architecture RTL of E6e4 is signal S1:std_logic; signal S2:std_logic; signal S3:std_logic; signal S4:std_logic; signal S5:std_logic; signal S6:std_logic; signal S7:std_logic; 
signal S8:std_logic; signal S9:std_logic; signal S10:std_logic; signal S11:std_logic; signal S12:std_logic; signal S13:std_logic; signal S14:std_logic; signal S15:std_logic; begin S15<=P3 OR P4; S13<=S14 when P8='0'else 
S15; process(P1,P0) begin if(P0='0')then S14<='0'; elsif(P1'event and P1='0')then S14<=S13; end if; end process; P12<=S14; S3<=(P6 AND not S2)when P2='0'else 
(P7); S1<=S3 when P8='1'else S2; process(P1,P0) begin if(P0='0')then S2<='0'; elsif(P1'event and P1='0')then S2<=S1; end if; end process; 
P16<=S2; S6<=(P5 AND P9 AND P10); S7<=(S9 AND S12); S8<=S6 when P8='1'else S7; process(P1,P0) begin if(P0='0')then S9<='0'; elsif(P1'event and P1='0')then S9<=S8; 
end if; end process; P13<=S9; S10<=(S12 AND not P11); S11<=S6 when P8='1'else S10; process(P1,P0) begin if(P0='0')then S12<='0'; elsif(P1'event and P1='0')then 
S12<=S11; end if; end process; P14<=S12; S4<=S6 when P8='1'else S5; process(P1,P0) begin if(P0='0')then S5<='0'; elsif(P1'event and P1='0')then 
S5<=S4; end if; end process; P15<=S5; end RTL; 