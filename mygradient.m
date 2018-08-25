function [Gx Gy]=mygradient(img_gray)
%% ÇóÌİ¶È
sz=size(img_gray);
img_temp_x1=zeros(sz);
img_temp_x1(:,1:end-1)=img_gray(:,2:end);
img_temp_x1(:,end)=img_gray(:,end);

img_temp_x2=zeros(sz);
img_temp_x2(:,2:end)=img_gray(:,1:end-1);
img_temp_x2(:,1)=img_gray(:,1);

Gx=img_temp_x2-img_temp_x1;
Gx(:,2:end-1)=Gx(:,2:end-1)/2;

img_temp_y1=zeros(sz);
img_temp_y1(1:end-1,:)=img_gray(2:end,:);
img_temp_y1(end,:)=img_gray(end,:);

img_temp_y2=zeros(sz);
img_temp_y2(2:end,:)=img_gray(1:end-1,:);
img_temp_y2(1,:)=img_gray(1,:);

Gy=img_temp_y2-img_temp_y1;
Gy(2:end-1,:)=Gy(2:end-1,:)/2;


