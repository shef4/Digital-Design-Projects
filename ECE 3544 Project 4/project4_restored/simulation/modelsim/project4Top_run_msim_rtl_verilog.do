transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/sefun/Dev/Digital-Design-Projects/ECE\ 3544\ Project\ 4/project4_restored {C:/Users/sefun/Dev/Digital-Design-Projects/ECE 3544 Project 4/project4_restored/fsm_sefunmi.v}
vlog -vlog01compat -work work +incdir+C:/Users/sefun/Dev/Digital-Design-Projects/ECE\ 3544\ Project\ 4/project4_restored {C:/Users/sefun/Dev/Digital-Design-Projects/ECE 3544 Project 4/project4_restored/counter_clk_sefunmi.v}
vlog -vlog01compat -work work +incdir+C:/Users/sefun/Dev/Digital-Design-Projects/ECE\ 3544\ Project\ 4/project4_restored {C:/Users/sefun/Dev/Digital-Design-Projects/ECE 3544 Project 4/project4_restored/buttonpressed.v}
vlog -vlog01compat -work work +incdir+C:/Users/sefun/Dev/Digital-Design-Projects/ECE\ 3544\ Project\ 4/project4_restored {C:/Users/sefun/Dev/Digital-Design-Projects/ECE 3544 Project 4/project4_restored/hex_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/sefun/Dev/Digital-Design-Projects/ECE\ 3544\ Project\ 4/project4_restored {C:/Users/sefun/Dev/Digital-Design-Projects/ECE 3544 Project 4/project4_restored/decoder4to10_sefunmi.v}
vlog -vlog01compat -work work +incdir+C:/Users/sefun/Dev/Digital-Design-Projects/ECE\ 3544\ Project\ 4/project4_restored {C:/Users/sefun/Dev/Digital-Design-Projects/ECE 3544 Project 4/project4_restored/project4Top.v}

