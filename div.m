% close all;clear all;clc;
%I=[1:5;5:-1:1;2,2,2,2,2;2:6;4:8];
I=double(imread('cameraman.tif'));
figure,imshow(I,[]);
[m n]=size(I);
% zeros()
for i=1:m-1
    for j=1:n
        M(i,j)=I(i+1,j)-I(i,j);
    end
end
for i=1:n
    M(m,i)=-I(m,i);
end

% mask1=[1,1,1;1,-8,1;1,1,1];
mask1=[-1,-2,-1;0,0,0;1,2,1];
  mask1 = mask1';%转置后进行相关运算
%  mask1 = rot90(mask1,-2);
% R=I+I-conv2(I,mask1,'same');
 R=conv2(I,mask1,'same');
mask2=[-1,-1,-1;-1,9,-1;-1,-1,-1];
S=conv2(I,mask2,'valid');
for i=1:m
    for j=1:n-1
        N(i,j)=I(i,j+1)-I(i,j);
    end
end
for i=1:m
    N(i,n)=-I(i,n);
end

for i=1:m
    for j=1:n
        O(i,j)=sqrt(double(M(i,j))*double(M(i,j))+double(N(i,j))*double(N(i,j)));
        P(i,j)=abs(M(i,j))+abs(N(i,j));
    end
end
T=I+O;
% figure,imshow(abs(M),[]);
figure,imshow((R),[]);
%mat2gray(O)
%figure,imshow(uint8(O));
% figure,imshow(O,[]);
%figure,imshow(P,[]);
% figure,imshow(P,[]);
% figure,imshow(abs(R),[]);
% figure,imshow(abs(S),[]);
% figure,imshow(T,[]);