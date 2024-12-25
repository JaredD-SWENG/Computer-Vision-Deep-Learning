RGB = imread("red3.jpg");
% redness in the picture is defined. this equation can be changed
% according to application and desired results. etc.
r = RGB(:, :,1); g = RGB(:, : ,2); b = RGB(:, :, 3); % split r,g,b planes
red = (r > 2*g) & (r > 2*b) & (r > 30); % create a binary image (1's and 0's)
% heuristic algorithm (can adjust)
% group all red object within 5 pixels of each other as one object (may adjust)
se = strel('disk',5);
red = imclose(red,se);
% delete all objects smaller than 35 pixels in area (may adjust)
red = bwareaopen(red,1000);
bw = bwlabel(red);
figure, imshow(bw)
% take the centroids of all objects and store them in S
stats = regionprops(bw, 'BoundingBox', 'Centroid'); % you can add 'Area'
S = vertcat(stats.Centroid);
% plot the image and the centroids
figure
imshow(RGB) % show original image
hold on
plot(S(:,1), S(:,2), '+') % identify red objects with '+'
% This is a loop to bound the red objects in a rectangular box.
for object = 1:length(stats)
bb = stats(object).BoundingBox;
bc = stats(object).Centroid;
rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 2) % draw bounding box
plot(bc(1), bc(2), '-m+') % mark centroid (x, y) with '+'
a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), ' Y: ', num2str(round(bc(2)))));
set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
end % display centroid coordinates on image
% x = bc(1) is column value of centroid
zoom on
hold off

