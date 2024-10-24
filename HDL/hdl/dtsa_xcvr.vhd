-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; use ieee.std_logic_1164.all; use ieee.std_logic_arith.all; use ieee.std_logic_unsigned.all; library work; use work.dtsa_cj_pkg.all; entity E3ce is port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; 
P4:in std_logic; P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:out std_logic; P10:out std_logic; P11:out std_logic; P12:out std_logic_vector(7 downto 0); P13:in std_logic_vector(7 downto 0); P14:out std_logic_vector(7 downto 0) 
); end E3ce; architecture RTL of E3ce is signal S1:std_logic; signal S2:std_logic; signal S3:std_logic; signal S4:std_logic_vector(16 downto 0); begin S1<=(not S2 AND P7 AND P6)or (S2 AND P7); process(P0,P1) 
begin if(P0='0')then S2<='0'; elsif(P1'event and P1='1')then if(P2='1')then S2<=S1; end if; end if; end process; process(P0,P1) begin 
if(P0='0')then S4<=(Others=>'0'); elsif(P1'event and P1='1')then if(P2='1')then if(P3='1')then S4<=P13&'1'&S4(7 downto 0); elsif(P4='1')then S4<=P8&S4(16 downto 1); end if; end if; end if; 
end process; process(P0,P1) begin if(P0='0')then S3<='1'; elsif(P1'event and P1='0')then if(P2='1')then S3<=S4(0); end if; end if; end process; 
P9<=S3; process(P0,P1) begin if(P0='0')then P10<='0'; elsif(P1'event and P1='0')then P10<=P3 AND S4(8)AND S2 AND P2; end if; end process; P11<=P5 AND not S4(8)AND S2; P14<=S4(16 downto 9); 
P12<=S4(7 downto 0); end RTL; 