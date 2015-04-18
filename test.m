close all;clear all;clc;
I=imread('tank01.bmp');
G=imread('tank02.bmp');
[i j]=size(I);
k=zeros(i,j);
k=uint8(k);
for m=1:i
    for n=1:j
        k(m,n)=0.5*((I(m,n))+(G(m,n)));
        if I(m,n)<G(m,n)
            I(m,n)=I(m,n);
        else 
            I(m,n)=G(m,n);
        %k(m,n)=min(I(m,n),G(m,n));
        end
    end
end
figure ; imshow(I);
figure ;imshow(k);