% Assignment: Lab1, Part 2 - Resistor Calculations (Series)
% Name: Jared Daniel
% Date: 9/4/2023
n = input('Enter number of resistors in series: ');
sum = 0;

for i = 1 : n
    r = input('Enter resistance (ohms): ');
    sum = sum + r;
end

fprintf('Series Resistance: %0.2f', sum);