-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- tb_extender12.vhd
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

entity tb_extender12 is
    generic(gCLK_HPER   : time := 50 ns);
end tb_extender12;



architecture structural of tb_extender12 is
  constant cCLK_PER  : time := gCLK_HPER * 2;




component extender12 is
   port(
	ctl	: in std_logic := '0';
	imm	: in std_logic_vector(11 downto 0);
	ext_imm	: out std_logic_vector(31 downto 0)
	);
end component;







signal s_CLK 	: std_logic;
signal s_ctl	: std_logic;
signal s_imm	: std_logic_vector(11 downto 0);
signal s_ext_imm : std_logic_vector(31 downto 0);




begin


  DUT: extender12
    port map(
	 ctl	=> s_ctl,
	 imm	=> s_imm,
	 ext_imm => s_ext_imm
	 );










P_CLK: process
  begin
    s_CLK <= '0';
    wait for gCLK_HPER;
    s_CLK <= '1';
    wait for gCLK_HPER;
  end process;
  
  -- Testbench process  
  P_TB: process
  begin
	s_ctl	<= '0';


	s_imm	<= x"800";
	wait for cCLK_PER;
	s_imm	<= x"000";
	wait for cCLK_PER;

	s_ctl	<= '1';
	wait for cCLK_PER;	

	s_imm	<= x"800";
	wait for cCLK_PER;
	s_imm	<= x"000";
	wait for cCLK_PER;
















    wait;
  end process;


end structural;