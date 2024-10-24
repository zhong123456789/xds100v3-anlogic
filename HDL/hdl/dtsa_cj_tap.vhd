-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; use ieee.std_logic_1164.all; library work; use work.dtsa_cj_pkg.all; entity E47c is port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; P5:out std_logic; 
P6:out std_logic; P7:out std_logic; P8:out std_logic; P9:out std_logic_vector(K63 downto 0) ); end E47c; architecture rtl of E47c is signal S1:std_logic_vector(K63 downto 0); signal S2:std_logic_vector(K63 downto 0); BEGIN process(P2,P0) 
begin if(P0='0')then S2<=K79; elsif(P2'event and P2='0')then if(P3='1')then S2<=S1; end if; end if; end process; P8<=S2(K89); P6<=S2(K82); 
P7<=S2(K86)AND S2(K87); process(S2,P4) begin CASE S2 IS WHEN K79=> if(P4='0')then S1<=K78; else S1<=K79; end if; WHEN K78=> 
if(P4='0')then S1<=K78; else S1<=K64; end if; WHEN K64=> if(P4='0')then S1<=K65; else S1<=K71; end if; 
WHEN K65=> if(P4='0')then S1<=K66; else S1<=K67; end if; WHEN K66=> if(P4='0')then S1<=K66; else S1<=K67; 
end if; WHEN K67=> if(P4='0')then S1<=K68; else S1<=K70; end if; WHEN K68=> if(P4='0')then S1<=K68; else 
S1<=K69; end if; WHEN K69=> if(P4='0')then S1<=K66; else S1<=K70; end if; WHEN K70=> if(P4='0')then S1<=K78; 
else S1<=K64; end if; WHEN K71=> if(P4='0')then S1<=K72; else S1<=K79; end if; WHEN K72=> if(P4='0')then 
S1<=K73; else S1<=K74; end if; WHEN K73=> if(P4='0')then S1<=K73; else S1<=K74; end if; WHEN K74=> 
if(P4='0')then S1<=K75; else S1<=K77; end if; WHEN K75=> if(P4='0')then S1<=K75; else S1<=K76; end if; 
WHEN K76=> if(P4='0')then S1<=K73; else S1<=K77; end if; WHEN K77=> if(P4='0')then S1<=K78; else S1<=K64; 
end if; WHEN others=> S1<=K79; END CASE; end process; process(P2,P0) begin if(P0='0')then P5<='0'; elsif(P2'event and P2='0')then if(P3='1')then 
P5<=(S2(K81)OR S2(K85))AND not P4; end if; end if; end process; process(P2,P1) begin if(P1='0')then P9<=K79; elsif(P2'event and P2='0')then if(P3='1')then 
P9<=S2; end if; end if; end process; END rtl; 