-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- N_bit_adder.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
--
--
-- NOTES:
-- 
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity N_bit_adder is
	port(
	i_A1 : in std_logic_vector(31 downto 0) := (others => '0');
	i_B1 : in std_logic_vector(31 downto 0) := (others => '0');
	i_C1 : in std_logic := '0';
	o_O  : out std_logic_vector(31 downto 0);
	o_C  : out std_logic := '0');
end N_bit_adder;


architecture structural of N_bit_adder is

constant N : integer := 32;


component fulladder is
  port(i_Aa          : in std_logic;
       i_Ba          : in std_logic;
       i_C          : in std_logic;
       o_O1         : out std_logic;
       o_O2         : out std_logic);

end component;


signal o_Oc : std_logic_vector(N-1 downto 0);
--signal i_C1 : std_logic;

begin

    G_NBit_FA1: for i in 0 to 0 generate
    FA: fulladder port map(
              	i_Aa       => i_A1(i),
              	i_Ba       => i_B1(i),
		i_C       => i_C1,
              	o_O1      => o_O(i),
		o_O2      => o_Oc(i));
    end generate G_NBit_FA1;

    G_NBit_FA: for i in 1 to N-1 generate
    FA: fulladder port map(
              	i_Aa       => i_A1(i),
              	i_Ba       => i_B1(i),
		i_C       => o_Oc(i-1),
              	o_O1      => o_O(i),
		o_O2      => o_Oc(i));
    end generate G_NBit_FA;


	o_C <= o_Oc(31);

    
  
end structural;