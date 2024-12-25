RGB = imread('tape.png');
imshow(RGB);
Rmin = 60; Rmax = 100; % need to supply estimate of radius (in pixels)!
[center, radius] = imfindcircles(RGB, [Rmin Rmax], 'Sensitivity', 0.9)
% output of imfindcircles()
% center = 236.9291 172.4747 (x, y of center of circle)
% radius = 79.5305 (radius of circle)
% Display the circle
viscircles(center, radius); % display circle
% Display the calculated center
hold on; plot(center(:,1), center(:,2), 'yx', 'LineWidth', 2);
hold off;
% display text 