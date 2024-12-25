% Define the video file
videoFile = 'MyLineVid.mp4'; % Replace with your video file

% Create a VideoReader object
videoReader = VideoReader(videoFile);

while hasFrame(videoReader)
    % Read the current frame
    frame = readFrame(videoReader);
    
    % Process the frame (similar to your original code)
    inverted = imcomplement(frame); % Invert image to make black line white
    gray = rgb2gray(inverted); % Convert to grayscale as intermediate step
    threshold = graythresh(gray); % Obtain possible threshold for binarization 
    bw = imbinarize(gray, threshold+0.2); % Default threshold had to be changed to get better black & white image
    final = bwareaopen(bw, 1000); % Get rid of small splotches 
        
    % Get the dimensions of the image
    [rows, cols, ~] = size(final); % Get the dimensions of the image

    columnWidth = floor(cols/5); % Each column takes 20% of the total width
    
    % Extract the five columns
    leftmostColumn = final(:, 1:columnWidth, :);
    leftColumn = final(:, columnWidth+1:2*columnWidth, :);
    centerColumn = final(:, 2*columnWidth+1:3*columnWidth, :);
    rightColumn = final(:, 3*columnWidth+1:4*columnWidth, :);
    rightmostColumn = final(:, 4*columnWidth+1:end, :);
    
    sums = [sum(sum(leftmostColumn)), sum(sum(leftColumn)), sum(sum(centerColumn)), sum(sum(rightColumn)), sum(sum(rightmostColumn))]; % Calculate the sums of pixel values in each column
    
    [~, index] = max(sums); % Find the column with the maximum sum (simpler method explained by GPT)
    
    % Direct the “robot” accordingly
    if (index == 1)
        fprintf("turn hard left\n");
    elseif (index == 2)
        fprintf("turn slight left\n");
    elseif (index == 3)
        fprintf("go straight\n");
    elseif (index == 4)
        fprintf("turn slight right\n");
    else
        fprintf("turn hard right\n");
    end
    
    % Display the processed frame (optional)
    figure, imshow(final);
end
