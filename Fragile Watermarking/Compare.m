function [out] = cmp(ji_mark,cover_n,h,w)
%检查原图像是否破坏，标出破坏位置
for i=1:h
    for j=1:w
        if(ji_mark(i,j)==cover_n(i,j))
            out(i,j)=1;
        else
            out(i,j)=0;
        end
    end
end
if(ji_mark==cover_n)
    disp('图像未被篡改');
else
    disp('图像被篡改');
end
end

