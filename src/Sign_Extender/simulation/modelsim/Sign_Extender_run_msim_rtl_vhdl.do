transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Matheus/Desktop/processor_mips_8bits/Sign_Extender/Sign_Extender.vhd}

vcom -93 -work work {C:/Users/Matheus/Desktop/processor_mips_8bits/Sign_Extender/Sign_Extender_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Sign_Extender_tb

add wave *
view structure
view signals
run 30 us
