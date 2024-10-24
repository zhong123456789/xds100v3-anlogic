-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; use ieee.std_logic_1164.all; use ieee.std_logic_unsigned.all; library work; entity E557 is port( P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:out std_logic; 
P5:in std_logic; P6:out std_logic; P7:in std_logic; P8:out std_logic; P9:in std_logic; P10:in std_logic; P11:in std_logic_vector(3 downto 0); P12:in std_logic; P13:out std_logic; P14:in std_logic; P15:out std_logic; 
P16:in std_logic; P17:out std_logic; P18:in std_logic; P19:out std_logic; P20:out std_logic; P21:out std_logic; P22:out std_logic ); end E557; architecture RTL of E557 is signal S1:std_logic; 
signal S2:std_logic; signal S3:std_logic; signal S4:std_logic; signal S5:std_logic; signal S6:std_logic; signal S7:std_logic_vector(2 downto 0); signal S8:std_logic_vector(1 downto 0); begin S8<=P16&P18; S7(2)<=P11(3)when S8="11"else S5 when S8="10"else 
P11(2)when S8="01"else S1; S7(1)<=P9 when S8="11"else S4 when S8="10"else P11(1)when S8="01"else S2; S7(0)<=P10 when S8="11"else S6 when S8="10"else P11(0)when S8="01"else S3; P4<=P3 when P2='1'else 
S7(2); P6<=P5 when P2='1'else S7(1); P8<=P7 when P2='1'else S7(0); process(P1,P0) begin if(P0='0')then P13<='0'; S1<='1'; S2<='1'; 
S3<='1'; elsif(P1'event AND P1='1')then if(P2='1')then P13<=P12; S1<=P14; S2<=P16; S3<=P18; end if; end if; end process; P15<=S1; 
P17<=S2; P19<=S3; process(P1,P0) begin if(P0='0')then S5<='0'; S4<='0'; S6<='0'; elsif(P1'event AND P1='1')then if(P2='0')AND(P12='1')then S5<=P14; 
S4<=P16; S6<=P18; end if; end if; end process; P21<=S5; P20<=S4; P22<=S6; END RTL; 