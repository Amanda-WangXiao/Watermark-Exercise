cover=imread('lena.bmp');
cover=rgb2gray(cover);
[h w]=size(cover);
 
ji_mark=jicheck(cover,h,w);
ji_cover=bitset(cover,1,ji_mark);
imshow(ji_cover);
imwrite(ji_cover,'ji_cover.jpg');
