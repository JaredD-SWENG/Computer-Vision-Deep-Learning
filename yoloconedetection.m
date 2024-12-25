% Specify the video file path
videoFilePath = 'yolo1.mov'; % Update with your video file path

% Create a VideoReader object
videoReader = VideoReader(videoFilePath);

% Read the first frame to get video properties
firstFrame = readFrame(videoReader);
videoHeight = size(firstFrame, 1);
videoWidth = size(firstFrame, 2);

% Create a figure to display the results
figure;

% Process each frame in the video
while hasFrame(videoReader)
    % Read the current frame
    im = readFrame(videoReader);
    
    % Resize the frame
    im = imresize(im, [224, 224]);

    % Detect objects in the frame
    [bboxes, scores, labels] = detect(detector, im, 'Threshold', 0.415);

    % Display the results
    if ~isempty(bboxes)
        im2 = insertObjectAnnotation(im, 'rectangle', bboxes, cellstr(labels), 'Color', 'red');
        imshow(im2);
        title(['Number of Objects Detected: ' num2str(length(labels))]);
    else
        imshow(im);
        title('No Objects Detected');
    end
    
    drawnow; % Force the display to update
end
