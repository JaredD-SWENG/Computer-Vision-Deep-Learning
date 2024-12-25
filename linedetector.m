% Assignment: Line Detector
% Name: Jared Daniel
% Date: 9/21/2023

im = imread('CenterLine.jpg'); % Image file name changed for test cases
inverted = imcomplement(im); % Invert image to make black line white
gray = rgb2gray(inverted); % Convert to grayscale as intermediate step
threshold = graythresh(gray); % Obtain possible threshold for binarization 
bw = imbinarize(gray, threshold+0.3); % Default threshold had to be changed to get better black & white image
final = bwareaopen(bw, 50); % Get rid of small splotches 
imshow(final)

[rows, cols, ~] = size(final); % Get the dimensions of the image

% Define the widths of the columns (center column is narrower than the sides)
leftWidth = floor(cols * 0.4);
centerWidth = floor(cols * 0.2);

% Extract the three columns
leftColumn = final(:, 1:leftWidth, :);
centerColumn = final(:, leftWidth+1:leftWidth+centerWidth, :);
rightColumn = final(:, leftWidth+centerWidth+1:end, :);

sums = [sum(sum(leftColumn)), sum(sum(centerColumn)), sum(sum(rightColumn))]; % Find the sum of values in each column
maximum = max(sums); % Find which column had the maximum sum
index = find(sums == maximum); % The column with the maximum sum is more than likely to contain the line

% Direct the “robot” accordingly
if (index == 1)
    fprintf("turn left\n");
elseif (index ==2)
    fprintf("go straight\n");
else
    fprintf("turn right\n")
end
