% Assignment: Lab1, Part 2 - Resistor Calculations (Parallel)
% Name: Jared Daniel
% Date: 9/4/2023
n = input('Enter number of resistors in parallel: ');
sum = 0;

for i = 1 : n
    r = input('Enter resistance (ohms): ');
    sum = sum + 1/r;
end

fprintf('Parallel Resistance: %0.2f \n', 1/sum);