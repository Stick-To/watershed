%% 区域生长 遍历四次矩阵 没有保证区域生长后区域类标从1开始连续排列，本题也不需要，统一转化为uint16就可以
%img 输入图像  只接受二值
% result 输出类表矩阵  double
%num 连通区个数
function [result num]=regrow(img)
img=uint8(img);
sz=size(img);
img_temp=zeros(sz(1)+2,sz(2)+2);
img_temp(2:end-1,2:end-1)=img;
img=img_temp;
sz=size(img);

k=2;
for i=2:sz(1)-1
    for j=2:sz(2)-1
        if img(i,j)~=0
            if max([img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j) img(i,j-1) img(i,j+1) img(i+1,j-1) img(i+1,j) img(i+1,j+1)])==1
               img(i,j)=k;
               k=k+1;
            else
                img(i,j)=max([img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j) img(i,j-1) img(i,j+1) img(i+1,j-1) img(i+1,j) img(i+1,j+1)]);
            end
        end
    end
end

for i=sz(1)-1:-1:2
    for j=sz(2)-1:-1:2
        if img(i,j)~=0
                img(i,j)=max([img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j) img(i,j-1) img(i,j+1) img(i+1,j-1) img(i+1,j) img(i+1,j+1)]);
        end
    end
end

for i=2:sz(1)-1
    for j=2:sz(2)-1
        if img(i,j)~=0
                img(i,j)=max([img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j) img(i,j-1) img(i,j+1) img(i+1,j-1) img(i+1,j) img(i+1,j+1)]);
        end
    end
end

for i=sz(1)-1:-1:2
    for j=sz(2)-1:-1:2
        if img(i,j)~=0      
                img(i,j)=max([img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j) img(i,j-1) img(i,j+1) img(i+1,j-1) img(i+1,j) img(i+1,j+1)]);
        end
    end
end


result=img(2:end-1,2:end-1);
num=length(unique(result))-1;