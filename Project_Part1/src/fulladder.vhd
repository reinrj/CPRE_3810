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

entity fulladder is
  port(i_Aa          : in std_logic;
       i_Ba          : in std_logic;
       i_C          : in std_logic;
       o_O1         : out std_logic;
       o_O2         : out std_logic);

end fulladder;

architecture structural of fulladder is

component xorg2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
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

signal p1_out, p2_out, p3_out, p4_out : std_logic := '0';
signal i_Ax, i_Bx, o_Fx : std_logic_vector(1 downto 0);

begin

--    G_NBit_XORG: for i in 0 to 1 generate
--    XORG: xorg2 port map(
--              i_A      => i_Ax(i),      -- All instances share the same select input.
--              i_B      => i_Bx(i),  	-- ith instance's data 0 input hooked up to ith data 0 input.
--              o_F      => o_Fx(i));  	-- ith instance's data output hooked up to ith data output.
--    end generate G_NBit_XORG;
--
--    G_NBit_ANDG: for i in 0 to 1 generate
--    ANDG: andg2 port map(
--              i_A      => i_Aa(i),      -- All instances share the same select input.
--              i_B      => i_Ba(i),  	-- ith instance's data 0 input hooked up to ith data 0 input.
--              o_F      => o_Fa(i));  	-- ith instance's data output hooked up to ith data output.
--    end generate G_NBit_ANDG;



    x1: xorg2 port map 		(i_A => i_Aa,
				 i_B => i_Ba,
				 o_F => p1_out);

    x2: xorg2 port map 		(i_A => p1_out,
				 i_B => i_C,
				 o_F => o_O1);

    x3: andg2 port map 		(i_A => p1_out,
			 	 i_B => i_C,
				 o_F => p2_out);
	
    x4: andg2 port map		(i_A => i_Aa,
				 i_B => i_Ba,
				 o_F => p3_out);

    x5: org2 port map		(i_A => p2_out,
				 i_B => p3_out,
				 o_F => o_O2);
  
end structural;