% Capture sample images from the cameraboard for different resolutions

% Refresh
clc;
clear;
close all;

% Define the Microscope setup
lens1 = '10x';
lens2 = '15x';

% Make a directory
dirName = ['sample_images_' lens1 '_' lens2];
if ~exist(dirName, 'dir')
  mkdir(dirName);
end

% Create raspi and cameraboard objects
raspiObj = raspi();
camObj = cameraboard(raspiObj,'Resolution','800x600');

% capture image and save
for idx=1:500
    img = snapshot(camObj);
    imshow(img);
    imwrite(img,[dirName '/image' num2str(idx) '.png']);
    drawnow;
end

clear raspiObj camObj