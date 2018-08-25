function result=myblur(img)
%模板是 
% 1 2 1
% 2 4 2
% 1 2 1
%mask=[1 2 1;2 4 2;1 2 1]./16;
sz=size(img);
if length(sz)==3
    error('只接受灰度图')
end
img=double(img);
img_=zeros([sz 9]);

result=zeros(sz);

img_(2:end,2:end,1)=img(1:end-1,1:end-1)./16;
img_(1:end-1,1:end-1,2)=img(2:end,2:end)./16;

img_(2:end,:,3)=img(1:end-1,:)./8;
img_(1:end-1,:,4)=img(2:end,:)./8;

img_(:,2:end,5)=img(:,1:end-1)./8;
img_(:,1:end-1,6)=img(:,2:end)./8;


img_(1:end-1,2:end,7)=img(2:end,1:end-1)./16;
img_(2:end,1:end-1,8)=img(1:end-1,2:end)./16;

img_(:,:,9)=img./4;

for i=1:9
    result=result+img_(:,:,i);
end
