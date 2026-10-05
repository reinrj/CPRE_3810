-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- register_file.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
-- putting the pieces together
--
-- NOTES:
-- 
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity register_file is
    port(CLK 	: in std_logic;
	 RST 	: in std_logic;
	 rd 	: in std_logic_vector(31 downto 0) := (others => '0');
	 rdsel 	: in std_logic_vector(4 downto 0) := (others => '0');
	 rs1sel : in std_logic_vector(4 downto 0) := (others => '0');
	 rs2sel : in std_logic_vector(4 downto 0) := (others => '0');
	 rs1 	: out std_logic_vector(31 downto 0);
	 rs2 	: out std_logic_vector(31 downto 0));
end register_file;



architecture structural of register_file is


--signal WE0, WE1, WE2, WE3, WE4, WE5, WE6, WE7, WE8, WE9, WE10, WE11, WE12, WE13, WE14, WE15, WE16, WE17, WE18, WE19, WE20, WE21, WE22, WE23, WE24, WE25, WE26, WE27, WE28, WE29, WE30, WE31 : std_logic;


component mux32t1 is
  port (i_S            : in std_logic_vector(4 downto 0);
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


component dffg_N is
  port(	i_CLK        : in std_logic;     -- Clock input
       	i_RST        : in std_logic;     -- Reset input
       	i_WE         : in std_logic;     -- Write enable input
       	i_D          : in std_logic_vector(31 downto 0);     -- Data value input
       	o_Q          : out std_logic_vector(31 downto 0));   -- Data value output
end component;


component decoder5t32 is
  port(	D_IN : in std_logic_vector(4 downto 0);
	FOUT : out std_logic_vector(31 downto 0));  
end component;


signal FOUT : std_logic_vector(31 downto 0);
signal i_D0, i_D1, i_D2, i_D3, i_D4, i_D5, i_D6, i_D7, i_D8, i_D9, i_D10, i_D11, i_D12, i_D13, i_D14, i_D15, i_D16, i_D17, i_D18, i_D19, i_D20, i_D21, i_D22, i_D23, i_D24, i_D25, i_D26, i_D27, i_D28, i_D29, i_D30, i_D31 : std_logic_vector(31 downto 0); 


begin


  decoder : decoder5t32
	port map(
	D_IN	=> rdsel,
	FOUT	=> FOUT
	);


  mux1 : mux32t1
	port map(
	i_S            => rs1sel,
        i_D0           => i_D0,
	i_D1           => i_D1,
	i_D2           => i_D2,
	i_D3           => i_D3,
	i_D4           => i_D4,
	i_D5           => i_D5,
	i_D6           => i_D6,
	i_D7           => i_D7,
	i_D8           => i_D8,
	i_D9           => i_D9,
	i_D10          => i_D10,
	i_D11          => i_D11,
	i_D12          => i_D12,
	i_D13          => i_D13,
	i_D14          => i_D14,
	i_D15          => i_D15,
	i_D16          => i_D16,
	i_D17          => i_D17,
	i_D18          => i_D18,
	i_D19          => i_D19,
	i_D20          => i_D20,
	i_D21          => i_D21,
	i_D22          => i_D22,
	i_D23          => i_D23,
	i_D24          => i_D24,
	i_D25          => i_D25,
	i_D26          => i_D26,
	i_D27          => i_D27,
	i_D28          => i_D28,
	i_D29          => i_D29,
	i_D30          => i_D30,
	i_D31          => i_D31,
        o_O            => rs1
	);

  mux2 : mux32t1
	port map(
	i_S            => rs2sel,
        i_D0           => i_D0,
	i_D1           => i_D1,
	i_D2           => i_D2,
	i_D3           => i_D3,
	i_D4           => i_D4,
	i_D5           => i_D5,
	i_D6           => i_D6,
	i_D7           => i_D7,
	i_D8           => i_D8,
	i_D9           => i_D9,
	i_D10          => i_D10,
	i_D11          => i_D11,
	i_D12          => i_D12,
	i_D13          => i_D13,
	i_D14          => i_D14,
	i_D15          => i_D15,
	i_D16          => i_D16,
	i_D17          => i_D17,
	i_D18          => i_D18,
	i_D19          => i_D19,
	i_D20          => i_D20,
	i_D21          => i_D21,
	i_D22          => i_D22,
	i_D23          => i_D23,
	i_D24          => i_D24,
	i_D25          => i_D25,
	i_D26          => i_D26,
	i_D27          => i_D27,
	i_D28          => i_D28,
	i_D29          => i_D29,
	i_D30          => i_D30,
	i_D31          => i_D31,
        o_O            => rs2
	);


-- need to generate 32 registers
-- i dont think a loop is possible here because of the format of the mux


  x0 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => '1',
       	i_WE         => FOUT(0),
       	i_D          => rd,
       	o_Q          => i_D0
	);

  x1 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(1),
       	i_D          => rd,
       	o_Q          => i_D1
	);

  x2 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(2),
       	i_D          => rd,
       	o_Q          => i_D2
	);

  x3 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(3),
       	i_D          => rd,
       	o_Q          => i_D3
	);

  x4 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(4),
       	i_D          => rd,
       	o_Q          => i_D4
	);

  x5 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(5),
       	i_D          => rd,
       	o_Q          => i_D5
	);

  x6 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(6),
       	i_D          => rd,
       	o_Q          => i_D6
	);

  x7 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(7),
       	i_D          => rd,
       	o_Q          => i_D7
	);

  x8 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(8),
       	i_D          => rd,
       	o_Q          => i_D8
	);

  x9 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(9),
       	i_D          => rd,
       	o_Q          => i_D9
	);

  x10 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(10),
       	i_D          => rd,
       	o_Q          => i_D10
	);

  x11 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(11),
       	i_D          => rd,
       	o_Q          => i_D11
	);

  x12 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(12),
       	i_D          => rd,
       	o_Q          => i_D12
	);

  x13 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(13),
       	i_D          => rd,
       	o_Q          => i_D13
	);

  x14 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(14),
       	i_D          => rd,
       	o_Q          => i_D14
	);

  x15 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(15),
       	i_D          => rd,
       	o_Q          => i_D15
	);

  x16 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(16),
       	i_D          => rd,
       	o_Q          => i_D16
	);

  x17 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(17),
       	i_D          => rd,
       	o_Q          => i_D17
	);

  x18 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(18),
       	i_D          => rd,
       	o_Q          => i_D18
	);

  x19 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(19),
       	i_D          => rd,
       	o_Q          => i_D19
	);

  x20 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(20),
       	i_D          => rd,
       	o_Q          => i_D20
	);

  x21 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(21),
       	i_D          => rd,
       	o_Q          => i_D21
	);

  x22 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(22),
       	i_D          => rd,
       	o_Q          => i_D22
	);

  x23 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(23),
       	i_D          => rd,
       	o_Q          => i_D23
	);

  x24 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(24),
       	i_D          => rd,
       	o_Q          => i_D24
	);

  x25 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(25),
       	i_D          => rd,
       	o_Q          => i_D25
	);

  x26 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(26),
       	i_D          => rd,
       	o_Q          => i_D26
	);

  x27 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(27),
       	i_D          => rd,
       	o_Q          => i_D27
	);

  x28 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(28),
       	i_D          => rd,
       	o_Q          => i_D28
	);

  x29 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(29),
       	i_D          => rd,
       	o_Q          => i_D29
	);

  x30 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(30),
       	i_D          => rd,
       	o_Q          => i_D30
	);

  x31 : dffg_N
	port map(
	i_CLK        => CLK,
       	i_RST        => RST,
       	i_WE         => FOUT(31),
       	i_D          => rd,
       	o_Q          => i_D31
	);





end structural;