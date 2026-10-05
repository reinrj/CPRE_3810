-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- extender.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
-- extend things yay
--
-- NOTES:
-- 
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity extender is
   port(
	ctl	: in std_logic := '0';
	imm	: in std_logic_vector(31 downto 0);
	ext_imm	: out std_logic_vector(31 downto 0)
	);
end extender;





architecture structural of extender is



















begin














end structural;
