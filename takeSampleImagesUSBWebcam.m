% Capture sample images from the USB Webcam 

% Refresh
clc;
clear;
close all;

% Define the Microscope setup
lens1 = '10x'; % bottom
lens2 = '15x';

% Make a directory
dirName = ['sample_images_webcam_' lens1 '_' lens2];
if ~exist(dirName, 'dir')
  mkdir(dirName);
end

% Create raspi and webcam object
raspiObj = raspi();
camObj = webcam(raspiObj,1,'640x480');

% capture image and save
for idx=1:500
    img = snapshot(camObj);
    imshow(img);
    imwrite(img,[dirName '/image' num2str(idx) '.png']);
    drawnow;
end

clear camObj