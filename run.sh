#!/bin/bash

iverilog -g2012 src/vending_machine.sv tb/tb_vending.sv -o sim/vm.out
vvp sim/vm.out
gtkwave sim/dump.vcd