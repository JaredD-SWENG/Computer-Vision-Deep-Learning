cam = webcam(3); % Initialize webcam

% Create a figure to display the video feed
figure;

% Define video parameters
outputVideo = VideoWriter(fullfile("C:\Users\Jared\OneDrive - The Pennsylvania State University\Documents\Penn State\6th Semester\CMPSC 497", 'output_video.mp4'), 'MPEG-4');
outputVideo.FrameRate = 30; % Adjust the frame rate as needed
open(outputVideo);

startTime = tic;
while toc(startTime) <= 20 % Record for 8 seconds
    % Acquire a single frame from video.
    RGB = snapshot(cam);
    
    r = RGB(:, :, 1);
    g = RGB(:, :, 2);
    b = RGB(:, :, 3);
    
    red = (r > 2 * g) & (r > 2 * b) & (r > 30);
    
    se = strel('disk', 5);
    red = imclose(red, se);
    red = bwareaopen(red, 1000);
    bw = bwlabel(red);
    
    stats = regionprops(bw, 'BoundingBox', 'Centroid', 'Area');
    
    if isempty(stats)
        fprintf("No red objects\n");
    else
        areas = [];
        for object = 1:length(stats)
            areas(object) = stats(object).Area;
        end
        maxArea = max(areas);
        maxIndex = find(areas == maxArea);
        S = vertcat(stats(maxIndex).Centroid);
        
        imshow(RGB);
        hold on;
        plot(S(:, 1), S(:, 2), '+');
        bb = stats(maxIndex).BoundingBox;
        bc = stats(maxIndex).Centroid;
        rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 2);
        plot(bc(1), bc(2), '-m+');
        a = text(bc(1) + 15, bc(2), strcat('X: ', num2str(round(bc(1))), ' Y: ', num2str(round(bc(2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
        hold off;
    end
    
    % Write frame to video
    writeVideo(outputVideo, getframe(gcf));
end

close(outputVideo); % Close the video writer

% Release the webcam when done
clear cam;
