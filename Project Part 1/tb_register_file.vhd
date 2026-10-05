-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- tb_register_file.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
-- putting the pieces together
--
-- NOTES:
-- 
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity tb_register_file is
	generic(gCLK_HPER   : time := 50 ns);
end tb_register_file;


architecture behavior of tb_register_file is
  constant cCLK_PER  : time := gCLK_HPER * 2;


component register_file is
    port(CLK 	: in std_logic;
	 RST 	: in std_logic;
	 rd 	: in std_logic_vector(31 downto 0);
	 rdsel 	: in std_logic_vector(4 downto 0);
	 rs1sel : in std_logic_vector(4 downto 0);
	 rs2sel : in std_logic_vector(4 downto 0);
	 rs1 	: out std_logic_vector(31 downto 0);
	 rs2 	: out std_logic_vector(31 downto 0));
end component;

signal s_CLK, s_RST : std_logic;
signal s_rd, s_rs1, s_rs2, s_D : std_logic_vector(31 downto 0) := (others => '0');
signal s_rdsel, s_rs1sel, s_rs2sel : std_logic_vector(4 downto 0) := (others => '0');
signal one : std_logic_vector(0 downto 0) := "1";

begin

  DUT : register_file
    port map(
	CLK	=> s_CLK,
	RST	=> s_RST,
	rd	=> s_rd,
	rdsel	=> s_rdsel,
	rs1sel	=> s_rs1sel,
	rs2sel	=> s_rs2sel,
	rs1	=> s_rs1,
	rs2	=> s_rs2
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

	-- reset everything initially
	s_RST 	<= '1';
	wait for cCLK_PER;
	s_RST	<= '0';
	s_rd   	<= x"00000000";
	s_rdsel <= "00000";


    -- write to every register to test
	wait for cCLK_PER;
	--wait for cCLK_PER/2;
    for i in 0 to 31 loop
	
	wait for cCLK_PER;
	s_rd <= std_logic_vector(resize(unsigned(s_rd) + unsigned(one), 32));
	s_rdsel <= std_logic_vector(resize(unsigned(s_rdsel) + unsigned(one), 5));
    end loop;

    for i in 0 to 31 loop
	
	wait for cCLK_PER;
	s_rs1sel <= std_logic_vector(resize(unsigned(s_rs1sel) + unsigned(one), 5));
	s_rs2sel <= std_logic_vector(resize(unsigned(s_rs2sel) + unsigned(one), 5));
    end loop;
    

    wait;
  end process;

end behavior;