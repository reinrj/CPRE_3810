-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- extender12.vhd
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


entity extender12 is
   port(
	ctl	: in std_logic := '0';
	imm	: in std_logic_vector(11 downto 0);
	ext_imm	: out std_logic_vector(31 downto 0) := (others => '0')
	);
end extender12;



architecture dataflow of extender12 is




begin

    with ctl select 
	ext_imm <= std_logic_vector(resize(signed(imm), 32)) when '1',
		   std_logic_vector(resize(unsigned(imm), 32)) when others;
	 	   


end dataflow;
