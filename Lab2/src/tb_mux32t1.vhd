-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- tb_mux32t1.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a simple VHDL testbench for the
-- edge-triggered flip-flop with parallel access and reset.
--
--
-- NOTES:
-- 8/19/16 by JAZ::Design created.
-- 11/25/19 by H3:Changed name to avoid name conflict with Quartus
--          primitives.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_mux32t1 is
  generic(gCLK_HPER   : time := 50 ns);
end tb_mux32t1;

architecture behavior of tb_mux32t1 is
  
  -- Calculate the clock period as twice the half-period
  constant cCLK_PER  : time := gCLK_HPER * 2;
  constant N : integer := 32;


  component mux32t1
    port(i_S           : in std_logic_vector(4 downto 0);
        i_D0           : in std_logic_vector(31 downto 0);
	i_D1           : in std_logic_vector(31 downto 0);
	i_D2           : in std_logic_vector(31 downto 0);
	i_D3           : in std_logic_vector(31 downto 0);
	i_D4           : in std_logic_vector(31 downto 0);
	i_D5           : in std_logic_vector(31 downto 0);
	i_D6           : in std_logic_vector(31 downto 0);
	i_D7           : in std_logic_vector(31 downto 0);
	i_D8           : in std_logic_vector(31 downto 0);
	i_D9           : in std_logic_vector(31 downto 0);
	i_D10          : in std_logic_vector(31 downto 0);
	i_D11          : in std_logic_vector(31 downto 0);
	i_D12          : in std_logic_vector(31 downto 0);
	i_D13          : in std_logic_vector(31 downto 0);
	i_D14          : in std_logic_vector(31 downto 0);
	i_D15          : in std_logic_vector(31 downto 0);
	i_D16          : in std_logic_vector(31 downto 0);
	i_D17          : in std_logic_vector(31 downto 0);
	i_D18          : in std_logic_vector(31 downto 0);
	i_D19          : in std_logic_vector(31 downto 0);
	i_D20          : in std_logic_vector(31 downto 0);
	i_D21          : in std_logic_vector(31 downto 0);
	i_D22          : in std_logic_vector(31 downto 0);
	i_D23          : in std_logic_vector(31 downto 0);
	i_D24          : in std_logic_vector(31 downto 0);
	i_D25          : in std_logic_vector(31 downto 0);
	i_D26          : in std_logic_vector(31 downto 0);
	i_D27          : in std_logic_vector(31 downto 0);
	i_D28          : in std_logic_vector(31 downto 0);
	i_D29          : in std_logic_vector(31 downto 0);
	i_D30          : in std_logic_vector(31 downto 0);
	i_D31          : in std_logic_vector(31 downto 0);
        o_O            : out std_logic_vector(31 downto 0));
  end component;

  signal s_CLK : std_logic;
  signal s_O : std_logic_vector(31 downto 0);
  signal s_S : std_logic_vector(4 downto 0);
  signal s_D0, s_D1, s_D2, s_D3, s_D4, s_D5, s_D6, s_D7, s_D8, s_D9, s_D10, s_D11, s_D12, s_D13, s_D14, s_D15, s_D16, s_D17, s_D18, s_D19, s_D20, s_D21, s_D22, s_D23, s_D24, s_D25, s_D26, s_D27, s_D28, s_D29, s_D30, s_D31 : std_logic_vector(31 downto 0);
  signal one : std_logic_vector(4 downto 0) := "00001";

begin

  DUT: mux32t1 
  port map(i_S	=> s_S	,
        i_D0 	=> s_D0	,
	i_D1 	=> s_D1	,
	i_D2 	=> s_D2	,
	i_D3 	=> s_D3	,
	i_D4 	=> s_D4	,
	i_D5 	=> s_D5	,
	i_D6 	=> s_D6	,
	i_D7 	=> s_D7	,
	i_D8 	=> s_D8	,
	i_D9 	=> s_D9	,
	i_D10 	=> s_D10,
	i_D11 	=> s_D11,
	i_D12 	=> s_D12,
	i_D13 	=> s_D13,
	i_D14 	=> s_D14,
	i_D15 	=> s_D15,
	i_D16 	=> s_D16,
	i_D17 	=> s_D17,
	i_D18 	=> s_D18,
	i_D19 	=> s_D19,
	i_D20 	=> s_D20,
	i_D21 	=> s_D21,
	i_D22 	=> s_D22,
	i_D23 	=> s_D23,
	i_D24 	=> s_D24,
	i_D25 	=> s_D25,
	i_D26 	=> s_D26,
	i_D27 	=> s_D27,
	i_D28 	=> s_D28,
	i_D29 	=> s_D29,
	i_D30 	=> s_D30,
	i_D31 	=> s_D31,
        o_O     => s_O);

  -- This process sets the clock value (low for gCLK_HPER, then high
  -- for gCLK_HPER). Absent a "wait" command, processes restart 
  -- at the beginning once they have reached the final statement.
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


s_S	<= "00000";
s_D0	<= x"00000000";
s_D1	<= x"00000001";
s_D2	<= x"00000002";
s_D3	<= x"00000003";
s_D4	<= x"00000004";
s_D5	<= x"00000005";
s_D6	<= x"00000006";
s_D7	<= x"00000007";
s_D8	<= x"00000008";
s_D9	<= x"00000009";
s_D10	<= x"0000000a";
s_D11	<= x"0000000b";
s_D12	<= x"0000000c";
s_D13	<= x"0000000d";
s_D14	<= x"0000000e";
s_D15	<= x"0000000f";
s_D16	<= x"00000010";
s_D17	<= x"00000011";
s_D18	<= x"00000012";
s_D19	<= x"00000013";
s_D20	<= x"00000014";
s_D21	<= x"00000015";
s_D22	<= x"00000016";
s_D23	<= x"00000017";
s_D24	<= x"00000018";
s_D25	<= x"00000019";
s_D26	<= x"0000001a";
s_D27	<= x"0000001b";
s_D28	<= x"0000001c";
s_D29	<= x"0000001d";
s_D30	<= x"0000001e";
s_D31	<= x"0000001f";
--s_O	<= x"00000000";



	-- trying to test every case with a loop
    --s_D <= "00000";
    --one <= "00001";
	wait for cCLK_PER;
	wait for cCLK_PER/2;
    for i in 0 to 31 loop
	
	s_S <= std_logic_vector(resize(unsigned(s_S) + unsigned(one), 5));
	
	wait for cCLK_PER;
    end loop;
    

    wait;
  end process;
  
end behavior;