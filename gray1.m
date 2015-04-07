clc;
clear all;
I=imread('aeit.png');
K=rgb2gray(I);
imshow(K);
a=min(min(K));
b=max(max(K));
%a=70;
%b=200;
c=30;
d=255;
[m, n]=size(K);
%J=zeros(m,n);
for i=1:m
    for j=1:n
        %J(i,j)=double((d-c))/double((b-a)).*(double(K(i,j))-double(a))+double(c);
        J(i,j)=uint8(2*log(1+double(I(i,j))));
    end
end
imshow(J,[ ]);