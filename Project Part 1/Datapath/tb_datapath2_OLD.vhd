-------------------------------------------------------------------------
-- Rose Reinhart
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- datapath.vhd
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

entity tb_datapath2 is
	generic(gCLK_HPER   : time := 50 ns;
        DATA_WIDTH : natural := 32;
        ADDR_WIDTH : natural := 10;
        BYTE_WIDTH : natural := 8
    );
end tb_datapath2;


architecture behavior of tb_datapath2 is
  constant cCLK_PER  : time := gCLK_HPER * 2;


component datapath2 is

    port(CLK 	: in std_logic;
	 RST 	: in std_logic;
	 --rd 	: in std_logic_vector(31 downto 0);
	 rdsel 	: in std_logic_vector(4 downto 0);
	 rs1sel : in std_logic_vector(4 downto 0);
	 rs2sel : in std_logic_vector(4 downto 0);
	 rs1 	: out std_logic_vector(31 downto 0);
	 rs2 	: out std_logic_vector(31 downto 0);
	 ctl	: in std_logic := '0';
	 immsel : in std_logic := '0';
	 imm	: in std_logic_vector(11 downto 0);	
	 imm2	: in std_logic_vector(19 downto 0);
	 load	: in std_logic := '0';
	 nAdd_Sub : in std_logic := '0';
	 ALUSrc	: in std_logic := '0';
	 ALUOut : out std_logic_vector(31 downto 0);
	 --addr	: in std_logic_vector(9 downto 0);
	 be	: in std_logic_vector(3 downto 0) := x"F";
	 we	: in std_logic
	 );
end component;

signal s_CLK, s_RST, s_nAdd_Sub, s_ALUSrc, s_ctl, s_immsel, s_load, s_we : std_logic;
signal s_rs1, s_rs2 : std_logic_vector(31 downto 0) := (others => '0');
signal s_imm : std_logic_vector(11 downto 0);
signal s_imm2 : std_logic_vector(19 downto 0);
signal s_ALUOut : std_logic_vector(31 downto 0);
signal s_rdsel, s_rs1sel, s_rs2sel : std_logic_vector(4 downto 0) := (others => '0');
signal s_be : std_logic_vector(3 downto 0);
signal one : std_logic_vector(0 downto 0) := "1";

begin

  DUT : datapath2
    port map(
	 CLK 	=> s_CLK,
	 RST 	=> s_RST,
	 rdsel 	=> s_rdsel,
	 rs1sel => s_rs1sel,
	 rs2sel => s_rs2sel,
	 rs1 	=> s_rs1,
	 rs2 	=> s_rs2,
	 ctl	=> s_ctl,
	 immsel => s_immsel,
	 imm	=> s_imm,
	 imm2	=> s_imm2,
	 load	=> s_load,
	 nAdd_Sub => s_nAdd_Sub,
	 ALUSrc	=> s_ALUSrc,
	 ALUOut => s_ALUOut,
	 be	=> s_be,
	 we	=> s_we
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
	s_imm  	<= x"000";
	s_imm2	<= x"00000";
	s_immsel <= '0';
	s_ctl	<= '1';
	s_load	<= '0';
	s_we	<= '0';
	s_be	<= x"F";
	s_rdsel <= "00000";
	s_nAdd_Sub <= '0';
	s_ALUSrc   <= '0';
	--s_ALUOut   <= x"00000000";
	wait for cCLK_PER;
	


	-- begin testing

	-- lui x25, 0x10010
	s_rdsel		<= "11001";
	s_rs1sel	<= "00000";
	s_rs2sel	<= "00000";
	s_imm		<= x"000";
	s_imm2		<= x"10010";
	s_immsel	<= '1';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	--wait for cCLK_PER/2;

	-- addi x25, x0, 0
	s_rdsel		<= "11001";
	s_rs1sel	<= "00000";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"000";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- extra instructin not listed to get x26 to have 0x10010000 as assumed
	-- lui x26, 0x10010
	s_rdsel		<= "11010";
	s_rs1sel	<= "00000";
	s_rs2sel	<= "00000";
	s_imm		<= x"000";
	s_imm2		<= x"10010";
	s_immsel	<= '1';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- addi x26, x0, 256
	s_rdsel		<= "11010";
	s_rs1sel	<= "00000";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"100";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- lw x1, 0(x25)
	s_rdsel		<= "00001";
	s_rs1sel	<= "11001";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"000";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '1';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- lw x2, 4(x25)
	s_rdsel		<= "00010";
	s_rs1sel	<= "11001";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"004";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '1';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- add x1, x1, x2
	s_rdsel		<= "00001";
	s_rs1sel	<= "00001";
	s_rs2sel	<= "00010";
	s_ctl		<= '1';
	s_imm		<= x"000";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '0';
	wait for cCLK_PER;

	-- sw x1, 0(x26)
	s_rdsel		<= "00000";
	s_rs1sel	<= "11010";
	s_rs2sel	<= "00001";
	s_ctl		<= '1';
	s_imm		<= x"000";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '1';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- lw x2, 8(x25)
	s_rdsel		<= "00010";
	s_rs1sel	<= "11001";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"008";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '1';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- add x1, x1, x2
	s_rdsel		<= "00001";
	s_rs1sel	<= "00001";
	s_rs2sel	<= "00010";
	s_ctl		<= '1';
	s_imm		<= x"000";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '0';
	wait for cCLK_PER;

	-- sw x1, 4(x26)
	s_rdsel		<= "00000";
	s_rs1sel	<= "11010";
	s_rs2sel	<= "00001";
	s_ctl		<= '1';
	s_imm		<= x"004";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '1';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- lw x2, 12(x25)
	s_rdsel		<= "00010";
	s_rs1sel	<= "11001";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"00C";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '1';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- add x1, x1, x2
	s_rdsel		<= "00001";
	s_rs1sel	<= "00001";
	s_rs2sel	<= "00010";
	s_ctl		<= '1';
	s_imm		<= x"000";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '0';
	wait for cCLK_PER;


	-- the addresses are wrong starting here



	-- sw x1, 8(x26)
	s_rdsel		<= "00000";
	s_rs1sel	<= "11010";
	s_rs2sel	<= "00001";
	s_ctl		<= '1';
	s_imm		<= x"008";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '1';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- lw x2, 16(x25)
	s_rdsel		<= "00010";
	s_rs1sel	<= "11001";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"010";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '1';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- add x1, x1, x2
	s_rdsel		<= "00001";
	s_rs1sel	<= "00001";
	s_rs2sel	<= "00010";
	s_ctl		<= '1';
	s_imm		<= x"000";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '0';
	wait for cCLK_PER;

	-- sw x1, 12(x26)
	s_rdsel		<= "00000";
	s_rs1sel	<= "11010";
	s_rs2sel	<= "00001";
	s_ctl		<= '1';
	s_imm		<= x"00C";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '1';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- lw x2, 20(x25)
	s_rdsel		<= "00010";
	s_rs1sel	<= "11001";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"014";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '1';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- add x1, x1, x2
	s_rdsel		<= "00001";
	s_rs1sel	<= "00001";
	s_rs2sel	<= "00010";
	s_ctl		<= '1';
	s_imm		<= x"000";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '0';
	wait for cCLK_PER;

	-- sw x1, 16(x26)
	s_rdsel		<= "00000";
	s_rs1sel	<= "11010";
	s_rs2sel	<= "00001";
	s_ctl		<= '1';
	s_imm		<= x"010";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '1';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- lw x2, 24(x25)
	s_rdsel		<= "00010";
	s_rs1sel	<= "11001";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"018";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '1';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- add x1, x1, x2
	s_rdsel		<= "00001";
	s_rs1sel	<= "00001";
	s_rs2sel	<= "00010";
	s_ctl		<= '1';
	s_imm		<= x"000";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '0';
	wait for cCLK_PER;

	-- extra instructin not listed to get x27 to have 0x10010000 as assumed
	-- lui x27, 0x10010
	s_rdsel		<= "11011";
	s_rs1sel	<= "00000";
	s_rs2sel	<= "00000";
	s_imm		<= x"000";
	s_imm2		<= x"10010";
	s_immsel	<= '1';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- addi x27, x0, 512
	s_rdsel		<= "11011";
	s_rs1sel	<= "00000";
	s_rs2sel	<= "00000";
	s_ctl		<= '1';
	s_imm		<= x"200";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '0';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- sw x1, -4(x27)
	s_rdsel		<= "00000";
	s_rs1sel	<= "11011";
	s_rs2sel	<= "00001";
	s_ctl		<= '1';
	s_imm		<= x"FFC";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '1';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;

	-- sw x1, -4(x27)
	s_rdsel		<= "00000";
	s_rs1sel	<= "11011";
	s_rs2sel	<= "00001";
	s_ctl		<= '1';
	s_imm		<= x"FFC";
	s_imm2		<= x"00000";
	s_immsel	<= '0';
	s_load		<= '0';
	s_we		<= '1';
	s_nAdd_Sub	<= '0';
	s_ALUSrc	<= '1';
	wait for cCLK_PER;


	

    wait;
  end process;

end behavior;