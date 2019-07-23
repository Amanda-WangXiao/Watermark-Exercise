function [ji] = jicheck(c,h,w)
%∆Ê–£—È
sum=0;
for i=1:h
    for j=1:w
        for k=2:8
            sum=sum+bitget(c(i,j),k);
        end
        if(rem(sum,2)==1)
            ji(i,j)=0;
        else
            ji(i,j)=1;
        end
        sum=0;
    end
end
end
