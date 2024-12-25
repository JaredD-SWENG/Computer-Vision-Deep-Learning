% Assignment: Lab1, Part 1 - Data Analysis
% Name: Jared Daniel
% Date: 9/4/2023
voltages = [21.2, 19.5, 20.1, 18.3, 17.7, 15.0, 21.9, 24.7, 23.1, 20.2, 16.3, 22.8, 18.4, 23.5, 21.1];

minimum = min(voltages);
maximum = max(voltages);
avg = mean(voltages);
standard_deviation = std(voltages);
med = median(voltages);

fprintf('Minimum: %.2f\n', minimum);
fprintf('Maximum: %.2f\n', maximum);
fprintf('Average: %.2f\n', avg);
fprintf('Standard Deviation: %.2f\n', standard_deviation);
fprintf('Median: %.2f\n', med);

fprintf('Values greater than the average:\n');
index = find(voltages > avg);
greater_than_avg = voltages(index);
disp(voltages(index));

plot(voltages);
xlabel('index');
ylabel('voltages (volts)');
title('Raw Data Plot of Voltages');

figure;

histogram(voltages, 10);
xlabel('voltages (volts)');
ylabel('frequency');
title('Histogram of Voltages');

fprintf('Sorted values:\n');
sorted_voltages = sort(voltages);
fprintf('%.1f \n', sorted_voltages)