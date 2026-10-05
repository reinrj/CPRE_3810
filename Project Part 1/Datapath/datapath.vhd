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

entity datapath is
    port(CLK 	: in std_logic;
	 RST 	: in std_logic;
	 --rd 	: in std_logic_vector(31 downto 0);
	 rdsel 	: in std_logic_vector(4 downto 0);
	 rs1sel : in std_logic_vector(4 downto 0);
	 rs2sel : in std_logic_vector(4 downto 0);
	 rs1 	: out std_logic_vector(31 downto 0);
	 rs2 	: out std_logic_vector(31 downto 0);
	 imm	: in std_logic_vector(31 downto 0);	-- 32 bits now, but later it will be 12 bits and 20 bits separate.
	 nAdd_Sub : in std_logic := '0';
	 ALUSrc	: in std_logic := '0';
	 ALUOut : out std_logic_vector(31 downto 0)
	 );
end datapath;


architecture structural of datapath is

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

component N_Add_Sub is
   port(
	i_A : in std_logic_vector(31 downto 0);
	i_B : in std_logic_vector(31 downto 0);
	i_Sub : in std_logic;
	o_O  : out std_logic_vector(31 downto 0);
	o_C  : out std_logic);
end component;

component mux2t1_N is
  port(i_S          : in std_logic;
       i_D0         : in std_logic_vector(31 downto 0);
       i_D1         : in std_logic_vector(31 downto 0);
       o_O          : out std_logic_vector(31 downto 0));
end component;

component andg2 is
  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);
end component;



signal mux1_out, AddSubOut : std_logic_vector(31 downto 0) := (others => '0');
signal carry, imm_out : std_logic := '0';



begin



    mux1: mux2t1_N port map(
	i_S          => ALUSrc,
        i_D0         => rs2,
        i_D1         => imm,
        o_O          => mux1_out
	);

    alu: N_Add_Sub port map(
	i_A 	=> rs1,
	i_B 	=> mux1_out,
	i_Sub 	=> nAdd_Sub,
	o_O  	=> AddSubOut,
--	o_O	=> ALUOut,
	o_C  	=> carry
	);

    ag1: andg2 port map(
	i_A	=> nAdd_Sub,
        i_B 	=> ALUSrc,
        o_F 	=> imm_out
	);

--    with imm_out select
--	ALUOut <= imm when '1',		-- error on this line, "Error (suppressible): datapath.vhd(103): (vcom-1563) Choice in ordinary selected signal assignment must be locally static"
--	          AddSubOut when others;
	ALUOut <= AddSubOut;

-- maybe add logic to choose between using the ALU output to set rd to or to use input rd
-- perhaps when nAdd_Sub and ALUSrc are high it can use the immediate to load into rd? idk
-- Ian said to just write the imm to rd for the regfile. later it will need an extender and stuff but that is normal.
    

    regfile: register_file port map(
	 CLK 	=> CLK,
	 RST 	=> RST,
	 rd 	=> AddSubOut,		-- might need changed to output into this register
	 rdsel 	=> rdsel,
	 rs1sel => rs1sel,
	 rs2sel => rs2sel,
	 rs1 	=> rs1,
	 rs2 	=> rs2
	);




end structural;