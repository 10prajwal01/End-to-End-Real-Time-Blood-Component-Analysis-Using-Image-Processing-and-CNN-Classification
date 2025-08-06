function [RBC_count,Platelets_count, WBC_count] =  countComponents(img)


% This is used to calculate the RBC,WBC and platelets from blood sample

% % Refresh
% clc;
% clear all;
% close all force;

% Load an image and resize
% img = imread("image6.png");
resizeFactor = [600 800];
img = imresize(img,resizeFactor);

% Extract RGB planes
img_Red = img(:,:,1); img_Green = img(:,:,2); img_Blue = img(:,:,3); %#ok<NASGU> 
figure; subplot(221); imshow(img); title('Blood sample image');
subplot(222);imshow(img_Red); title('Red plane');
subplot(223);imshow(img_Green); title('Green plane');
subplot(224);imshow(img_Blue); title('Blue plane');

% RGB to HSV conversion
[img_Hue,img_Saturation,img_Value]  = rgb2hsv(img); %#ok<ASGLU> 
img_HSV  = rgb2hsv(img); %#ok<NASGU> 
figure; subplot(221); imshow(img_HSV); title('HSV converted image');
subplot(222);imshow(img_Hue); title('Hue plane');
subplot(223);imshow(img_Saturation); title('Saturation plane');
subplot(224);imshow(img_Value); title('Value plane');

% Binarise the Red or Hue plane
binarisation_threshold = 0.5;
img_binary = im2bw(img_Red,binarisation_threshold); %#ok<IM2BW> 

% RGB Pixel counting
approx_pixel_area_RBC = 650;
RBC_count = nnz(img_binary)/approx_pixel_area_RBC;

% Platelets count
small_objects_threshold = 300;
img_binary_1 = bwareaopen(img_binary,small_objects_threshold);
figure,imshow(img_binary_1); title('Image after small objects removal');

inverted_small_objects_threshold = 30;
img_binary_2 = bwareaopen(~img_binary_1,inverted_small_objects_threshold);
figure,imshow(img_binary_2); title('Inverted image after small objects removal');

stats=regionprops(img_binary_2,'Area');
Platelets_count = nnz(([stats.Area]>inverted_small_objects_threshold) .* ([stats.Area]<small_objects_threshold));

% WBC count
wbc_binarisation_threshold = 0.7;
img_Hue_binary = im2bw(img_Hue,wbc_binarisation_threshold); %#ok<IM2BW> 
wbc_small_objects_threshold = 10;
img_Hue_binary_1 = bwareaopen(img_Hue_binary,wbc_small_objects_threshold);
figure;imshow(img_Hue_binary_1); 

stats2=regionprops(img_Hue_binary_1,'Area');
WBC_count = sum([stats2.Area])/numel([stats2.Area]);

end