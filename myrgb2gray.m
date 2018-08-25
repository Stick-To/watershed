function result=myrgb2gray(img)
img=double(img);
result=uint8(0.29900 *img(:,:,1)+0.58700 *img(:,:,2)+0.11400 *img(:,:,3));
%  0.29900 * R + 0.58700 * G + 0.11400 * B