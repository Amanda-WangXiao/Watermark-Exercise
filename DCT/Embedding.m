picture=imread('lena.bmp'); 
picture=imresize(picture, [512 512]);
pi_grey=rgb2gray(picture);
subplot(2,3,1);
imshow(picture);
title('原图');
subplot(2,3,2);
imshow(pi_grey);
title('灰度图');
pic_dct=blkproc(pi_grey,[8,8],'dct2');
xulie = randi([0,1],[1,64*64]); 
xulie=reshape(xulie,64,64);
%dlmwrite('test.txt', xulie);
 
x1=5;
y1=2;
x2=4;
y2=3;
 
for i=1:64
    for j=1:64
        if(xulie(i,j)==1) %(5,2)>(4,3)为1
            if(pic_dct(x1+(i-1)*8,y1+(j-1)*8)<pic_dct(x2+(i-1)*8,y2+(j-1)*8))
                temp=pic_dct(x2+(i-1)*8,y2+(j-1)*8);
               pic_dct(x2+(i-1)*8,y2+(j-1)*8)=pic_dct(x1+(i-1)*8,y1+(j-1)*8);
          pic_dct(x1+(i-1)*8,y1+(j-1)*8)=temp;
            else if(pic_dct(x1+(i-1)*8,y1+(j-1)*8)==pic_dct(x2+(i-1)*8,y2+(j-1)*8))
                   pic_dct(x2+(i-1)*8,y2+(j-1)*8)=pic_dct(x2+(i-1)*8,y2+(j-1)*8)-1;
                end
            end
        
        else
            if(pic_dct(x1+(i-1)*8,y1+(j-1)*8)>pic_dct(x2+(i-1)*8,y2+(j-1)*8))
              temp=pic_dct(x1+(i-1)*8,y1+(j-1)*8);
             pic_dct(x1+(i-1)*8,y1+(j-1)*8)= pic_dct(x2+(i-1)*8,y2+(j-1)*8);
            pic_dct(x2+(i-1)*8,y2+(j-1)*8)=temp;
                else if(pic_dct(x1+(i-1)*8,y1+(j-1)*8)==pic_dct(x2+(i-1)*8,y2+(j-1)*8))
                    pic_dct(x2+(i-1)*8,y2+(j-1)*8)=pic_dct(x2+(i-1)*8,y2+(j-1)*8)+1;
                end
            end
        end
    end
end
 
pic_idct=blkproc(pic_dct,[8,8],'idct2');
pi_grey(:,:,1)=pic_idct;
picture=pi_grey;
subplot(2,3,3);
imshow(picture);
title('嵌入后');
