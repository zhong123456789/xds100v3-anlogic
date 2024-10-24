-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; use ieee.std_logic_1164.all; use ieee.std_logic_unsigned.all; use ieee.std_logic_arith.all; library work; use work.dtsa_cj_pkg.all; entity E613 is port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; 
P4:in std_logic; P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:out std_logic; P10:out std_logic ); end E613; architecture RTL of E613 is signal S1:std_logic; 
signal S2:std_logic; signal S3:std_logic; signal S4:std_logic; signal S5:std_logic; signal S6:std_logic; signal S7:std_logic; signal S8:std_logic; signal S9:std_logic; signal S10:std_logic_vector(2 downto 0); begin S2<=not(P5 OR P3 OR P8); 
I0:process(P1,P0) begin if(P0='0')then S1<='0'; elsif(P1'event and P1='0')then if(P7='1')then S1<=S2 AND(S1 OR P2) AND not P6 AND not S9; end if; end if; end process I0; 
I1:process(P1,P0) begin if(P0='0')then S9<='0'; elsif(P1'event and P1='0')then if(P7='1')then S9<=S2 AND(S9 OR P4); end if; end if; end process I1; S5<=P6 and S1 and not S9 and not S8; 
I2:process(P1,P0) begin if(P0='0')then S10<=(Others=>'0'); elsif(P1'event and P1='0')then if(P7='1')then if(S2='0')then S10<=(Others=>'0'); elsif(S5='1')then S10<=S10+"001"; end if; 
end if; end if; end process I2; S8<='1'when S10="111"else'0'; S3<='1'when S10="010"else'0'; I3:process(P1,P0) begin if(P0='0')then S4<='0'; elsif(P1'event and P1='0')then if(P7='1')then 
S4<=(S3 AND S9 AND S2)OR (S4 AND S2); end if; end if; end process I3; P9<=S4; S6<='1'when S10="111"else'0'; I4:process(P1,P0) begin if(P0='0')then S7<='0'; 
elsif(P1'event and P1='0')then if(P7='1')then S7<=(S6 AND S9 AND S2)OR (S7 AND S2); end if; end if; end process I4; P10<=S7; end RTL; 