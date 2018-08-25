clear;clc;close all;

%% 显示 分水岭分割后图像 和 分水岭 
water_line=load('water_line.mat');
water_line=water_line.water_line;
img=imread('gecko.bmp');

img_gray=myrgb2gray(img);

img_add_temp=(water_line~=0);
img_add_temp=uint8(~img_add_temp);
img_gray=img_gray.*img_add_temp+uint8(water_line*255);
figure
imshow(img_gray)
figure
imshow(water_line)