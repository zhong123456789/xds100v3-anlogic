-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library ieee; use ieee.std_logic_1164.all; use ieee.std_logic_arith.all; use ieee.std_logic_unsigned.all; library work; use work.dtsa_cj_pkg.all; entity E360 is port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; 
P4:in std_logic; P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:in std_logic; P10:in std_logic; P11:in std_logic; P12:in std_logic; P13:in std_logic; P14:out std_logic; 
P15:out std_logic; P16:out std_logic; P17:out std_logic; P18:out std_logic; P19:out std_logic ); end E360; architecture synth of E360 is component E504 PORT(P0:in std_logic; P1:in std_logic; 
P2:in std_logic; P3:out std_logic_vector(3 downto 0) ); end component; CONSTANT S1:std_logic_vector(7 downto 0):="01101101"; CONSTANT S2:std_logic_vector(1 downto 0):="00"; CONSTANT S3:std_logic_vector(1 downto 0):="01"; CONSTANT S4:std_logic_vector(1 downto 0):="10"; CONSTANT S5:std_logic_vector(1 downto 0):="11"; signal S6:std_logic; signal S7:std_logic; 
signal S8:std_logic; signal S9:std_logic; signal S10:std_logic; signal S11:std_logic_vector(6 downto 0); signal S12:std_logic_vector(7 downto 0); signal S13:std_logic_vector(7 downto 0); signal S14:std_logic_vector(7 downto 0); signal S15:std_logic; signal S16:std_logic; signal S17:std_logic_vector(1 downto 0); signal S18:std_logic_vector(1 downto 0); 
signal S19:std_logic; signal S20:std_logic_vector(1 downto 0); signal S21:std_logic_vector(1 downto 0); signal S22:std_logic; signal S23:std_logic; signal S24:std_logic; signal S25:std_logic; signal S26:std_logic; signal S27:std_logic_vector(7 downto 0); signal S28:std_logic_vector(3 downto 0); signal S29:std_logic; 
signal S30:std_logic; signal S31:std_logic; signal S32:std_logic; signal S33:std_logic; signal S34:std_logic; begin S22<=P0 AND P4; I77:E504 port map( P0=>S22, P1=>P3, 
P2=>P5, P3=>S28); S25<='1'when(S28=K101)else'0'; S10<='1'when(S28=K100)else'0'; S31<='1'when(S28=K105)else'0'; S24<='1'when(S28=K94)else'0'; S9<='1'when(S28=K93)else'0'; S30<='1'when(S28=K98)else'0'; S16<='1'when(S28=K90)else'0'; process(P3,S22) begin 
if(S22='0')then S18<="00"; elsif(P3'event and P3='1')then if(S25='1')then S18<=P6&S18(1); elsif(S10='1')then S18<="01"; end if; end if; end process; process(P3,S22) 
begin if(S22='0')then S17<="00"; elsif(P3'event and P3='1')then if(S16='1')then S17<="00"; elsif(S31='1')then S17<=S18; end if; end if; end process; 
S15<='1'when S17="00"else'0'; S26<='1'when S17="01"else'0'; S6<='1'when S17="10"else'0'; S7<='1'when S17="11"else'0'; S12<=S27 when S26='1'else S1 when S15='1'else S13; process(P3,S22) begin if(S22='0')then S14<=(others=>'0'); 
elsif(P3'event and P3='1')then if(S9='1')then S14<=S12; elsif(S24='1')then S14<=P6&S14(7 downto 1); end if; end if; end process; process(P3,S22) begin if(S22='0')then 
S13<=(others=>'0'); elsif(P3'event and P3='1')then if(S30='1')and(S6='1')then S13<=S14; end if; end if; end process; process(P3,S22) begin if(S22='0')then S11<=(others=>'0'); 
elsif(P3'event and P3='1')then if(S30='1')and(S26='1')AND (S14(K49)='1')then S11<=S14(6 downto 0); end if; end if; end process; process(P3,S22,S34) begin if(S22='0')OR(S34='1')then S32<='0'; 
elsif(P3'event and P3='1')then if(S30='1')and(S26='1')AND (S14(K49)='1')then S32<='1'; end if; end if; end process; process(P1,S22) begin if(S22='0')then S33<='0'; 
S34<='0'; elsif(P1'event and P1='1')then S33<=S32; S34<=S33; end if; end process; process(P1,P0,P2) begin if(P0='0')OR(P2='0')then P14<='0'; P15<='0'; 
P16<='0'; P17<='0'; S23<='0'; P18<='0'; elsif(P1'event and P1='1')then if(S34='1')then P14<=S11(K50); P15<=S11(K51); P16<=S11(K52); P17<=S11(K53); S23<=S11(K54); 
P18<=S11(K55); end if; end if; end process; S27(K56)<=S19; S27(6)<='0'; S27(K57)<=P10; S27(K58)<=P11; S27(K59)<=P12; S27(K60)<=P9; S27(K61)<=P8; 
S27(K62)<=P7; process(P3,S22) begin if(S22='0')then S21<=S2; elsif(P3'event and P3='1')then S21<=S20; end if; end process; process(S21,P13,S23) begin 
CASE S21 IS WHEN S2=> if(P13='0')then S20<=S3; else S20<=S2; end if; WHEN S3=> if(P13='1')then S20<=S4; else 
S20<=S3; end if; WHEN S4=> if(P13='0')then S20<=S5; else S20<=S4; end if; WHEN S5=> if(S23='1')then S20<=S2; 
else S20<=S5; end if; WHEN others=> S20<=S2; END CASE; end process; S19<='1'when S21=S5 else'0'; process(P3,S22) begin if(S22='0')then 
S8<='0'; elsif(P3'event and P3='1')then if(S9='1')then S8<='0'; elsif(S24='1')then S8<=P6; end if; end if; end process; S29<=S18(0)when S25='1'else S8 when(S24='1')AND(S7='1')else 
S14(0)when S24='1'else '1'; process(P3,S22) begin if(S22='0')then P19<='1'; elsif(P3'event and P3='0')then P19<=S29; end if; end process; end synth; 
