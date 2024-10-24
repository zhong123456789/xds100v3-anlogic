-- TI Proprietary Information - Internal Data.  Copyright (c) 2011, Texas Instruments Incorporated.  All rights reserved.
library IEEE; use IEEE.Std_Logic_1164.all; use work.dtsa_cj_pkg.all; entity E6f4 is port( P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:out std_logic; P4:in std_logic; P5:in std_logic; 
P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:in std_logic; P10:in std_logic; P11:in std_logic; P12:in std_logic; P13:in std_logic_vector(K157 downto 0); P14:in std_logic; P15:out std_logic; P16:out std_logic; 
P17:out std_logic; P18:out std_logic; P19:out std_logic; P20:out std_logic; P21:out std_logic; P22:out std_logic; P23:out std_logic; P24:out std_logic; P25:in std_logic; P26:in std_logic; P27:out std_logic; 
P28:out std_logic; P29:out std_logic; P30:out std_logic ); end E6f4; architecture RTL of E6f4 is component E47a port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; 
P4:in std_logic; P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:out std_logic; P9:out std_logic; P10:out std_logic; P11:out std_logic; P12:out std_logic; P13:out std_logic ); 
end component E47a; component E5ac port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; P5:out std_logic; P6:out std_logic; P7:out std_logic; P8:out std_logic 
); end component E5ac; component E6e4 port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; P5:in std_logic; P6:in std_logic; P7:in std_logic; 
P8:in std_logic; P9:in std_logic; P10:in std_logic; P11:in std_logic; P12:out std_logic; P13:out std_logic; P14:out std_logic; P15:out std_logic; P16:out std_logic ); end component E6e4; 
component E5bc port(P0:in std_logic; P1:in std_logic; P2:in std_logic_vector(K157 downto 0); P3:in std_logic; P4:in std_logic; P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:in std_logic; 
P10:in std_logic; P11:in std_logic; P12:in std_logic; P13:in std_logic; P14:in std_logic; P15:out std_logic; P16:out std_logic; P17:out std_logic; P18:out std_logic; P19:out std_logic; P20:out std_logic; 
P21:out std_logic; P22:out std_logic; P23:out std_logic; P24:out std_logic ); end component E5bc; component E54c port(P0:in std_logic; P1:in std_logic; P2:in std_logic; P3:in std_logic; 
P4:in std_logic; P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:out std_logic; P10:out std_logic ); end component E54c; component E4ee port(P0:in std_logic; 
P1:in std_logic; P2:in std_logic; P3:in std_logic; P4:in std_logic; P5:in std_logic; P6:in std_logic; P7:in std_logic; P8:in std_logic; P9:in std_logic; P10:in std_logic; P11:in std_logic; 
P12:in std_logic; P13:in std_logic; P14:in std_logic; P15:in std_logic; P16:in std_logic; P17:in std_logic; P18:in std_logic; P19:in std_logic; P20:in std_logic; P21:in std_logic; P22:in std_logic; 
P23:in std_logic; P24:out std_logic; P25:out std_logic; P26:out std_logic; P27:out std_logic ); end component E4ee; signal S1:std_logic; signal S2:std_logic; signal S3:std_logic; signal S4:std_logic; 
signal S5:std_logic; signal S6:std_logic; signal S7:std_logic; signal S8:std_logic; signal S9:std_logic; signal S10:std_logic; signal S11:std_logic; signal S12:std_logic; signal S13:std_logic; signal S14:std_logic; signal S15:std_logic; 
signal S16:std_logic; signal S17:std_logic; signal S18:std_logic; signal S19:std_logic; signal S20:std_logic; signal S21:std_logic; signal S22:std_logic; signal S23:std_logic; begin I65:E47a port map( 
P0=>P1, P1=>P2, P2=>P13(K147), P3=>S3, P4=>P9, P5=>P10, P6=>S15, P7=>S1, P8=>S2, P9=>S19, P10=>S23, 
P11=>S4, P12=>P17, P13=>P18 ); P19<=S23; P24<=S4; I66:E5ac port map( P0=>P1, P1=>P2, P2=>S7, 
P3=>S5, P4=>P25, P5=>S6, P6=>S8, P7=>S9, P8=>S10 ); P22<=S6; P15<=S20; P3<=not S6; I67:E6e4 
port map( P0=>P1, P1=>P2, P2=>P13(K147), P3=>P13(K150), P4=>P13(K153), P5=>P13(K148), P6=>P9, P7=>P10, P8=>S15, P9=>P6, 
P10=>P12, P11=>S8, P12=>S13, P13=>S7, P14=>S11, P15=>S5, P16=>S3 ); I68:E5bc port map( P0=>P1, 
P1=>P2, P2=>P13, P3=>P12, P4=>P5, P5=>P6, P6=>P8, P7=>S11, P8=>P9, P9=>S4, P10=>P10, P11=>S12, 
P12=>S21, P13=>S19, P14=>S23, P15=>S15, P16=>S1, P17=>S20, P18=>P16, P19=>P21, P20=>S18, P21=>S16, P22=>S17, 
P23=>S14, P24=>P23 ); I69:E54c port map( P0=>P1, P1=>P2, P2=>P13(K150), P3=>S16, P4=>S18, P5=>S11, 
P6=>S13, P7=>S15, P8=>P14, P9=>S12, P10=>S21 ); I70:E4ee port map( P0=>P1, P1=>P0, P2=>P4, 
P3=>P7, P4=>P2, P5=>P13(K147), P6=>P13(K156), P7=>P26, P8=>P11, P9=>P12, P10=>P25, P11=>P6, P12=>S13, P13=>S15, 
P14=>S18, P15=>S16, P16=>S17, P17=>S14, P18=>S21, P19=>S2, P20=>S7, P21=>S11, P22=>S10, P23=>S9, P24=>S22, 
P25=>P28, P26=>P29, P27=>P30 ); P27<=S22; P20<=S15; end RTL; 