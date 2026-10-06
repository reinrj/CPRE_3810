-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- barrel_shifter.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
-- 
--
-- NOTES:
-- 
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity barrel_shifter is
    port(
	 A_in	: in std_logic_vector(31 downto 0);
	 B_out	: out std_logic_vector(31 downto 0);
	 shift	: in std_logic_vector(4 downto 0);		-- if negative it implies left shift, by default it is right
	 l_a	: in std_logic				-- logical if 0, arithmatic if 1
	);
end barrel_shifter;


architecture structural of barrel_shifter is

-- cannot use single line solution, ie no shift_left()









begin













end structural; 