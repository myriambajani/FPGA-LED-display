# FPGA LED Display – "GO BEIRUT 🙂"

## Overview
This project implements a combinational logic circuit that drives a seven-segment LED display to show the custom phrase **"GO BEIRUT 🙂"**.  
The design was built in structural Verilog, simulated in Quartus, and implemented on a DE10-Lite FPGA board. The project combines Boolean logic simplification, Karnaugh maps, and technology mapping to minimize transistor count while meeting design requirements.

## Features
- Displays a **10-character custom message**: `GO BEIRUT🙂`
- Uses a **4-bit input → 7-bit output** mapping for the seven-segment display
- Fully structural Verilog design
- Active-low seven-segment logic
- Optimized with **NAND-only mapping** to reduce transistor count
- Implemented and tested on the **DE10-Lite FPGA board**

## Methodology
1. Designed a character set of 10 unique symbols, including letters, space, and a smiley 🙂.
2. Derived a **truth table** for all 16 possible input combinations.
3. Created **Karnaugh maps** for each of the 7 output segments.
4. Derived minimized SOP expressions for each output.
5. Performed **technology mapping** to NAND + inverter implementations to reduce transistor counts.
6. Verified design correctness via Quartus simulation and FPGA implementation.

## Results
- All input combinations correctly map to the intended display outputs.
- Transistor count reduced significantly after technology mapping.
- Message displays clearly on the FPGA board, conveying a positive note for Beirut.

## Files
- **[code/ssd.v](./code/ssd.v)** – Structural Verilog code for the seven-segment LED driver.
- **figures/**
  - **[waveform.png](./figures/waveform.png)** – Final simulation waveform results showing correct segment outputs for digits 0–9.
  - **[truth_table.png](./figures/truth_table.png)** – Character set design table with 4-bit codes mapped to the seven-segment LED display.

## Tools & Technologies
- Verilog 
- Intel Quartus Prime
- DE10-Lite FPGA Board
- CMOS logic optimization (NAND + inverter mapping)
