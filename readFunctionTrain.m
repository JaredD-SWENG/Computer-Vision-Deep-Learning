% function I = readFunctionTrain(filename)
% % Resize the images to the size required by the Alexnet network.
% I = imread(filename);
% I = imresize(I, [227 227]);
function I = readFunctionTrain(frame)
    % Resize the images to the size required by the network.
    I = imresize(frame, [227 227]);
end
