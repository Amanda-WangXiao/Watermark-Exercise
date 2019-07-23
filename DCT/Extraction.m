pic_dct=blkproc(picture,[8,8],'dct2');
 
gongji1=picture;
gongji1(1:300,1:200)=512;
pic_dct1=blkproc(gongji1,[8,8],'dct2');
subplot(2,3,4);
imshow(gongji1);
title('²Ã¼ô¹¥»÷');
 
gongji2=picture;
gongji2=imrotate(gongji2,180);
pic_dct2=blkproc(gongji2,[8,8],'dct2');
subplot(2,3,5);
imshow(gongji2);
title('Ğı×ª¹¥»÷');
 
gongji3=picture;
gongji3=imnoise(gongji3,'salt & pepper',0.1);
pic_dct3=blkproc(gongji3,[8,8],'dct2');
subplot(2,3,6);
imshow(gongji3);
title('ÔëÉù¹¥»÷');
 
message=zeros(64,64);
message1=zeros(64,64);
message2=zeros(64,64);
message3=zeros(64,64);
 
for i=1:64
    for j=1:64
    if(pic_dct(x1+(i-1)*8,y1+(j-1)*8)>pic_dct(x2+(i-1)*8,y2+(j-1)*8))
         message(i,j)=1;
     else message(i,j)=0;
     end
    end
end
 
count=0;
for i=1:64
    for j=1:64
        if(xulie(i,j)~=message(i,j)) 
            count=count+1;
        end
    end
end
 
 
for i=1:64
    for j=1:64
    if(pic_dct1(x1+(i-1)*8,y1+(j-1)*8)>pic_dct1(x2+(i-1)*8,y2+(j-1)*8))
         message1(i,j)=1;
     else message1(i,j)=0;
     end
    end
end
 
count1=0;
for i=1:64
    for j=1:64
        if(xulie(i,j)~=message1(i,j)) 
            count1=count1+1;
        end
    end
end
 
for i=1:64
    for j=1:64
    if(pic_dct2(x1+(i-1)*8,y1+(j-1)*8)>pic_dct2(x2+(i-1)*8,y2+(j-1)*8))
         message2(i,j)=1;
     else message2(i,j)=0;
     end
    end
end
count2=0;
for i=1:64
    for j=1:64
        if(xulie(i,j)~=message2(i,j)) 
            count2=count2+1;
        end
    end
end
 
for i=1:64
    for j=1:64
    if(pic_dct3(x1+(i-1)*8,y1+(j-1)*8)>pic_dct3(x2+(i-1)*8,y2+(j-1)*8))
         message3(i,j)=1;
     else message3(i,j)=0;
     end
    end
end
count3=0;
for i=1:64
    for j=1:64
        if(xulie(i,j)~=message3(i,j)) 
            count3=count3+1;
        end
    end
end
 
wumalv=count/4096;
wumalv1=count1/4096;
wumalv2=count2/4096;
wumalv3=count3/4096;
disp('Ô­Í¼ÎóÂëÂÊÎª£º');
disp(wumalv);
disp('²Ã¼ô¹¥»÷ÎóÂëÂÊÎª£º');
disp(wumalv1);
disp('Ğı×ª¹¥»÷ÎóÂëÂÊÎª£º');
disp(wumalv2);
disp('ÔëÉù¹¥»÷ÎóÂëÂÊÎª£º');
disp(wumalv3);
