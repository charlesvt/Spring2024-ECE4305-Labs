# Lab 1 - Barrel Shifter
## Parameterized Barrel Shifter
Rotational Barrel Shifters parameterized with *N* representing the amount of bits to be shifted, and 2<sup>N</sup> representing the bit width of the input that is being shifted.\
[param_right_shifter](https://github.com/charlesvt/Spring2024-ECE4305-Labs/blob/main/Lab%201%20-%20%20Barrel%20Shifter/Source%20Files/param_right_shifter.sv)\
[param_left_shifter](https://github.com/charlesvt/Spring2024-ECE4305-Labs/blob/main/Lab%201%20-%20%20Barrel%20Shifter/Source%20Files/param_left_shifter.sv)

Test benches for the parameterized right and left barrel shifters respectively\
[param_right_shifter_tb](https://github.com/charlesvt/Spring2024-ECE4305-Labs/blob/main/Lab%201%20-%20%20Barrel%20Shifter/Simulation%20Files/param_right_shifter_tb.sv)\
[param_left_shifter_tb](https://github.com/charlesvt/Spring2024-ECE4305-Labs/blob/main/Lab%201%20-%20%20Barrel%20Shifter/Simulation%20Files/param_left_shifter_tb.sv)

## Multi-Function Barrel Shifter
Multi-function barrel shifter using a right shifter, left shifter, and an *N*-bit 2x1 MUX to select between right or left shift based on the signal *lr*.\
[multi_barrel_shifter_mux](https://github.com/charlesvt/Spring2024-ECE4305-Labs/blob/main/Lab%201%20-%20%20Barrel%20Shifter/Source%20Files/multi_barrel_shifter_mux.sv)

Multi-function barrel shifter using a single right shifter with pre-reverser and post-reverser modules.\
[multi_barrel_shifter_reverser](https://github.com/charlesvt/Spring2024-ECE4305-Labs/blob/main/Lab%201%20-%20%20Barrel%20Shifter/Source%20Files/multi_barrel_shifter_reverser.sv\
The following schematic was referenced for the multi_barrel_shifter_reverser module:\
![image](https://1.bp.blogspot.com/-WXk9YeOcVsk/V4myOmg3K3I/AAAAAAAABTI/Jat_0BKynv80BMy904cUwsbaMY8Np4WtACLcB/s1600/multifunction-barrel-shifter-reverse-bit.PNG)\
Schematic was obtained from this [site](https://embeddedsystemengineering.blogspot.com/2016/07/verilog-tutorial-1-modelsim.html?showComment=1636697692523).

## FPGA Implementation
|Module | LUTs |
|--- | --- |
|multi_barrel_shifter_mux | 24 | 
| multi_barrel_shifter_reverser | 24 |
