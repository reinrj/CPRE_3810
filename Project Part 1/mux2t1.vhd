-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- mux2t1.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
--
--
-- NOTES:
-- 
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity mux2t1 is
  port(i_S          : in std_logic;
       i_D0         : in std_logic;
       i_D1         : in std_logic;
       o_O          : out std_logic);

end mux2t1;

architecture structural of mux2t1 is

component invg is

  port(i_A          : in std_logic;
       o_F          : out std_logic);

end component;

component andg2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component;

component org2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component;

signal p1_out, p2_out, p3_out, p4_out : std_logic;

begin
    x1: invg port map 	(i_A => i_S,
			 o_F => p1_out);

    x2: andg2 port map 	(i_A => p1_out,
			 i_B => i_D0,
			 o_F => p2_out);

    x3: andg2 port map	(i_A => i_S,
			 i_B => i_D1,
			 o_F => p3_out);

    x4: org2 port map	(i_A => p2_out,
			 i_B => p3_out,
			 o_F => o_O);
  
end structural;