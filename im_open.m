im = imread('blocks2.bmp');
imshow(im)
size(im);
se = strel('disk', 12);
im2 = imclose(im, se);
figure, imshow(im2)