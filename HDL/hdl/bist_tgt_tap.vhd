-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; use ieee.std_logic_1164.all; library work; use work.dtsa_cj_pkg.all; entity E504 is PORT(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:out std_logic_vector(3 downto 0) ); END E504; 
architecture behavior of E504 is signal S1:std_logic_vector(3 downto 0); signal S2:std_logic_vector(3 downto 0); BEGIN process(P1,P0) begin if(P0='0')then S2<=K90; elsif(P1'event and P1='1')then S2<=S1; end if; 
end process; P3<=S2; process(S2,P2) begin CASE S2 IS WHEN K90=> if(P2='0')then S1<=K91; else S1<=K90; end if; 
WHEN K91=> if(P2='0')then S1<=K91; else S1<=K92; end if; WHEN K92=> if(P2='0')then S1<=K93; else S1<=K99; 
end if; WHEN K99=> if(P2='0')then S1<=K100; else S1<=K90; end if; WHEN K93=> if(P2='0')then S1<=K94; else 
S1<=K95; end if; WHEN K94=> if(P2='0')then S1<=K94; else S1<=K95; end if; WHEN K95=> if(P2='0')then S1<=K96; 
else S1<=K98; end if; WHEN K96=> if(P2='0')then S1<=K96; else S1<=K97; end if; WHEN K97=> if(P2='0')then 
S1<=K94; else S1<=K98; end if; WHEN K98=> if(P2='0')then S1<=K91; else S1<=K92; end if; WHEN K100=> 
if(P2='0')then S1<=K101; else S1<=K102; end if; WHEN K101=> if(P2='0')then S1<=K101; else S1<=K102; end if; 
WHEN K102=> if(P2='0')then S1<=K103; else S1<=K105; end if; WHEN K103=> if(P2='0')then S1<=K103; else S1<=K104; 
end if; WHEN K104=> if(P2='0')then S1<=K101; else S1<=K105; end if; WHEN K105=> if(P2='0')then S1<=K91; else 
S1<=K92; end if; WHEN others=> S1<=K90; END CASE; end process; END behavior; 