-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; use ieee.std_logic_1164.all; use ieee.std_logic_signed.all; library work; use work.dtsa_cj_pkg.all; entity E47a is port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; 
P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:out std_logic; P9:out std_logic; P10:out std_logic; P11:out std_logic; P12:out std_logic; P13:out std_logic ); end E47a; 
architecture RTL of E47a is signal S1:std_logic; signal S2:std_logic; signal S3:std_logic; signal S4:std_logic; signal S5:std_logic_vector(K158 downto 0); signal S6:std_logic; signal S7:std_logic; signal S8:std_logic; signal S9:std_logic; signal S10:std_logic; 
signal S11:std_logic; signal S12:std_logic; signal S13:std_logic_vector(K158 downto 0); begin S3<=P7 OR S8; S1<=(not P3 AND (P5 OR P4)); S7<=(S8 AND not S12); S6<=(S1 AND P6)OR (S7 AND not P6); I5:process(P1,P0) 
begin if(P0='0')then S8<='0'; elsif(P1'event AND P1='0')then if(S3='1')then S8<=S6; end if; end if; end process I5; P11<=S8; I6:process(P0,P1) 
begin if(P0='0')then S2<='0'; elsif(P1'event and P1='0')then S2<=(S2 AND not S9) OR S10; end if; end process I6; P9<=not S2 AND S12; I7:process(P1,P0) begin 
if(P0='0')then S13<=K159; elsif(P1'event AND P1='0')then S13<=S5; end if; end process I7; process(S13,P2,S8,P7) begin CASE S13 IS WHEN K159=> if(S8 AND P7)='1'then 
S5<=K161; else S5<=K159; end if; WHEN K161=> S5<=K162; WHEN K162=> S5<=K163; WHEN K163=> S5<=K164; WHEN K164=> 
if(P2='1')then S5<=K159; else S5<=K160; end if; WHEN K160=> if(S8 AND P7)='1'then S5<=K161; else S5<=K160; end if; 
WHEN others=> S5<=K159; END CASE; end process; S9<=S13(K165); S10<=S13(K166); S11<=S13(K168); S12<=S13(K169); P13<=S11; S4<=S9 OR S10; P8<=S8 AND not S4; 
P10<=S9; I8:process(P1,P0) begin if(P0='0')then P12<='0'; elsif(P1'event AND P1='0')then P12<=S12 AND P2; end if; end process I8; end RTL; 