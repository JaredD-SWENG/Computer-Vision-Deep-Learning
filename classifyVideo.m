function classifyVideo(myNet)
    % Initialize webcam
    cam = webcam(1);
    
    % Create a figure to display the webcam feed
    figure;
    
    % Loop to continuously capture and classify images
    while ishandle(1)
        % Capture a frame from the webcam
        frame = snapshot(cam);
        
        % Resize the frame using the provided read function
        frame = readFunctionTrain(frame);
        
        % Classify the resized frame using the provided myNet
        predictedLabel = classify(myNet, frame);
        
        % Display the frame with the predicted label
        imshow(frame);
        title(['Predicted Label: ', char(predictedLabel)]);
        
        % Allow the figure to update
        drawnow;
    end
    
    % Close the webcam when the figure is closed
    clear cam;
end
