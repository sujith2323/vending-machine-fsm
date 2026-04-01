# Vending Machine Controller (FSM) - SystemVerilog

## 📌 Overview

This project implements a vending machine controller using a Finite State Machine (FSM) in SystemVerilog. The system accepts coins and dispenses products based on the inserted amount.

## 💰 Features

* Accepts ₹5 and ₹10 coins
* Dispenses item at ₹15
* Returns change if excess amount inserted
* FSM-based design (Moore model)
* Debug logs using `$display`
* Waveform generation using VCD

## 🧠 Design

States:

* S0 → ₹0
* S5 → ₹5
* S10 → ₹10
* S15 → Dispense
* S20 → Dispense + Change

## 🧪 Simulation

Run using Icarus Verilog:

```bash
iverilog -g2012 src/vending_machine.sv tb/tb_vending.sv -o vm.out
vvp vm.out
gtkwave dump.vcd
```

## 📊 Tools Used

* Icarus Verilog
* GTKWave
* EDA Playground (initial testing)

## 🚀 Future Improvements

* Multiple product selection
* Display interface
* FPGA implementation

## 👨‍💻 Author

Sujith G
https://sujith2323.github.io/ptf/
