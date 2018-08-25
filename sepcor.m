function result=sepcor(img,restrict,threshold)

%% 特殊膨胀算法
%img 需要膨胀的图像
%restrict 膨胀中心点限制区域
%threshold 分水岭数值



% if all(size(img)-size(restrict)==0)
sz=size(img);
temp=zeros(sz(1)+2,sz(2)+2);
temp(2:sz(1)+1,2:sz(2)+1)=img;
img=temp;
temp=zeros(sz(1)+2,sz(2)+2);
img_comp=zeros(sz(1)+2,sz(2)+2);
pad_restrict=zeros(sz(1)+2,sz(2)+2);
pad_restrict(2:sz(1)+1,2:sz(2)+1)=restrict;

while(~all(img(:)-img_comp(:)==0))    %如果前后两次膨胀结果相同，停止膨胀
    
    
for i=2:sz(1)+1    
    for j=2:sz(2)+1      
        eight_neighbor=unique([img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j-1) img(i,j) img(i,j+1) img(i+1,j-1) img(i+1,j) img(i+1,j+1)]);
        neighbor_diff_num=length(eight_neighbor);
      if img(i,j)==0 & pad_restrict(i,j)~=0 & neighbor_diff_num>=2
          if neighbor_diff_num==2 & min(eight_neighbor)==0                               
                      img(i,j)=max(eight_neighbor);     
          else
                      temp(i,j)=threshold;
          end
       end
    end
end
img_comp=img;

for i=2:sz(1)+1
    for j=2:sz(2)+1      
        eight_neighbor=unique([img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j-1) img(i,j) img(i,j+1) img(i+1,j-1) img(i+1,j) img(i+1,j+1)]);
        neighbor_diff_num=length(eight_neighbor);
      if img(i,j)==0 & pad_restrict(i,j)~=0 & neighbor_diff_num>=2
          if neighbor_diff_num==2 & min(eight_neighbor)==0                               
                      img(i,j)=max(eight_neighbor);     
          else
                      temp(i,j)=threshold;
          end
       end
    end
end
end

result=temp(2:sz(1)+1,2:sz(2)+1);


% end

