vcom -2008 -work work *.vhd

vsim -voptargs="+acc" work.tb_datapath2



add wave -position insertpoint  \
sim:/tb_datapath/s_CLK \
sim:/tb_datapath/s_RST \
sim:/tb_datapath/s_nAdd_Sub \
sim:/tb_datapath/s_ALUSrc \
sim:/tb_datapath/s_imm \
sim:/tb_datapath/s_rs1 \
sim:/tb_datapath/s_rs2 \
sim:/tb_datapath/s_ALUOut \
sim:/tb_datapath/s_rdsel \
sim:/tb_datapath/s_rs1sel \
sim:/tb_datapath/s_rs2sel

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x0/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x1/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x2/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x3/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x4/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x5/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x6/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x7/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x8/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x9/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x10/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x11/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x12/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x13/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x14/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x15/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x16/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x17/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x18/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x19/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x20/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x21/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/regfile/x22/o_Q

add wave -position insertpoint  \
sim:/tb_datapath/DUT/alu/i_A \
sim:/tb_datapath/DUT/alu/i_B \
sim:/tb_datapath/DUT/alu/i_Sub \
sim:/tb_datapath/DUT/alu/o_O \
sim:/tb_datapath/DUT/alu/o_C \
sim:/tb_datapath/DUT/alu/s_S \
sim:/tb_datapath/DUT/alu/s_Bi \
sim:/tb_datapath/DUT/alu/s_A

add wave -position insertpoint sim:/tb_datapath/DUT/alu/x3/G_NBit_FA1(0)/FA/x2/*


