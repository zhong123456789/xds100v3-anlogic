-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library IEEE; use IEEE.Std_Logic_1164.all; use IEEE.Std_Logic_arith.all; use IEEE.Std_Logic_unsigned.all; use work.dtsa_cj_pkg.all; entity E5ac is port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; 
P5:out std_logic; P6:out std_logic; P7:out std_logic; P8:out std_logic ); end E5ac; architecture RTL of E5ac is CONSTANT S1:std_logic_vector(2 downto 0):="000"; CONSTANT S2:std_logic_vector(2 downto 0):="010"; CONSTANT S3:std_logic_vector(2 downto 0):="100"; CONSTANT S4:std_logic_vector(2 downto 0):="101"; 
CONSTANT S5:std_logic_vector(2 downto 0):="001"; CONSTANT S6:integer:=2; CONSTANT S7:integer:=0; signal S8:std_logic; signal S9:std_logic_vector(2 downto 0); signal S10:std_logic_vector(2 downto 0); signal S11:std_logic_vector(2 downto 0); signal S12:std_logic_vector(2 downto 0); signal S13:std_logic; signal S14:std_logic; signal S15:std_logic; 
signal S16:std_logic; signal S17:std_logic; signal S18:std_logic; begin S18<='1'; I9:process(P0,P1) begin if(P0='0')then S9<=S1; elsif(P1'event and P1='0')then S9<=S10; 
end if; end process I9; S11(2)<=not P3; S11(1)<='0'; S11(0)<='0'; I10:process(P0,P1) begin if(P0='0')then S12<=(others=>'0'); elsif(P1'event and P1='0')then if(S9(1)='1')then 
S12<=S11; elsif(P2='1')then S12<=S12-"001"; end if; end if; end process I10; S8<='1'when S12="000"else'0'; process(S9,P2,S8,S17) begin case S9 is when S1=> 
if(P2='0')then S10<=S1; else S10<=S2; end if; when S2=> S10<=S3; when S3=> if(S8='0')then S10<=S3; else 
if(S17='1')then S10<=S5; else S10<=S4; end if; end if; when S4=> S10<=S5; when S5=> if(P2='1')then S10<=S5; 
else S10<=S1; end if; when Others=> S10<=S1; end case; end process; P7<=S9(S6); S16<='1'when(S9=S1)else'0'; I11:process(P0,P1) begin 
if(P0='0')then P8<='0'; elsif(P1'event and P1='0')then P8<=S16; end if; end process I11; P5<=(P2 AND not S15); S13<=S9(S7); I12:process(P0,P1) begin if(P0='0')then 
S14<='0'; elsif(P1'event and P1='0')then S14<=S13; end if; end process I12; I13:process(P0,P1) begin if(P0='0')then S15<='0'; elsif(P1'event and P1='1')then S15<=S14; 
end if; end process I13; P6<=S13; I14:process(P0,P1) begin if(P0='0')then S17<='0'; elsif(P1'event and P1='0')then if(S9=S1)then S17<=P4 AND S18; end if; 
end if; end process I14; end RTL; 