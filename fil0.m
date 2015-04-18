clear all;clc
I=imread('autumn.tif');
I=rgb2gray(I);
figure(3),imshow(I);
J=imnoise(I,'poisson');
%J=I;
figure(1),imshow(J);
%A=[0 -1 0;-1 4 -1;0 -1 0];
%A=[1 1 1;0 0 0;-1 -1 -1];
%A=[1 0 -1;1 0 -1;1 0 -1];
A=ones(2);
A=1/4*A;
% for i=2:(m-1)
%     for j=2:(n-1)
%         %for k=-1:1
%          %   for l=-1:1
%           J=      
%         max0=min(min(L));
%         K(i,j)=max0;
%     end
% end

        
K=imfilter(J,A,'conv');
%imshow(J);
%K=ordfilt2(J,7,ones(3,3));
figure(2),imshow(K,[]);