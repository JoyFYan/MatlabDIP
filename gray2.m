clc,clf,clear all;
I=imread('aeit.png');

%a=uint8(min(min(I)));
%b=uint8(max(max(I)));
a=70;
b=200;
c=30;
d=255;
[m, n]=size(I);
J=(zeros(m,n/3));
for i=1:m
    for j=1:n
        if I(i,j)<100
            I(i,j)=0;
        else if I(i,j)<200
            I(i,j)=130;
        else 
            I(i,j)=255;
            end
        end
        
        
       % I(i,j)=(d-c)/(b-a)*(I(i,j))+c;
        %I(i,j)=uint8(15*log(1+double(I(i,j))));
       %I(i,j)=uint8(0.4*I(i,j)^2);
    end
end

imshow(I)