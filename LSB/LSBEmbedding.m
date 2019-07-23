picture=imread('lena.bmp');
logo=imread('logo.bmp');
picturegrey=rgb2gray(picture);
logo2=im2bw(logo);
a = imresize(picturegrey, [512 512]);
c = imresize(logo2, [512 512]);
w = bitset(a,1,c);
subplot(3,3,1);
imshow(w);
title('result');


