

vsim -voptargs="+acc" work.tb_datapath2

add wave -position insertpoint  \
sim:/tb_datapath2/s_CLK \
sim:/tb_datapath2/s_RST \
sim:/tb_datapath2/s_nAdd_Sub \
sim:/tb_datapath2/s_ALUSrc \
sim:/tb_datapath2/s_ctl \
sim:/tb_datapath2/s_immsel \
sim:/tb_datapath2/s_load \
sim:/tb_datapath2/s_we \
sim:/tb_datapath2/s_rs1 \
sim:/tb_datapath2/s_rs2 \
sim:/tb_datapath2/s_imm \
sim:/tb_datapath2/s_imm2 \
sim:/tb_datapath2/s_ALUOut \
sim:/tb_datapath2/s_rdsel \
sim:/tb_datapath2/s_rs1sel \
sim:/tb_datapath2/s_rs2sel \
sim:/tb_datapath2/s_be

add wave -position insertpoint  \
sim:/tb_datapath2/DUT/CLK \
sim:/tb_datapath2/DUT/RST \
sim:/tb_datapath2/DUT/rdsel \
sim:/tb_datapath2/DUT/rs1sel \
sim:/tb_datapath2/DUT/rs2sel \
sim:/tb_datapath2/DUT/rs1 \
sim:/tb_datapath2/DUT/rs2 \
sim:/tb_datapath2/DUT/ctl \
sim:/tb_datapath2/DUT/immsel \
sim:/tb_datapath2/DUT/imm \
sim:/tb_datapath2/DUT/imm2 \
sim:/tb_datapath2/DUT/load \
sim:/tb_datapath2/DUT/nAdd_Sub \
sim:/tb_datapath2/DUT/ALUSrc \
sim:/tb_datapath2/DUT/ALUOut \
sim:/tb_datapath2/DUT/be \
sim:/tb_datapath2/DUT/we \
sim:/tb_datapath2/DUT/mux1_out \
sim:/tb_datapath2/DUT/AddSubOut \
sim:/tb_datapath2/DUT/ext_imm \
sim:/tb_datapath2/DUT/ext12_imm \
sim:/tb_datapath2/DUT/ext20_imm \
sim:/tb_datapath2/DUT/rd \
sim:/tb_datapath2/DUT/s_q

add wave -position insertpoint sim:/tb_datapath2/DUT/regfile/*

add wave -position insertpoint sim:/tb_datapath2/DUT/alu/*

mem load -infile dmem.hex -format hex /tb_datapath2/DUT/memory/ram

add wave -position insertpoint  \
sim:/tb_datapath2/DUT/memory/ram


