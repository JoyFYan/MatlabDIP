 clc;clear all;close all;
D0=100;
I=imread('cameraman.tif');
figure
imshow(I);
[M, N]=size(I);
P=zeros(2*M,2*N);
P(1:M,1:N)=I;
for m=1:2*M
    for n=1:2*N
        P(m,n)=P(m,n)*(-1)^(m+n);
    end
end

Pf=fft2(P);
% h=ones(3,3);
 H=zeros(2*M,2*N);
 for m =1:2*M
     for n=1:2*N
         if((sqrt((m-M)^2+(n-N)^2))>D0)
             H(m,n)=1;
            D=sqrt((m-M)^2+(n-N)^2);
            H(m,n)=exp((-D^2)/(2*(D0)^2));
         end
     end
 end
% h = [-1 -2 -1;0 0 0;1 2 1];
%   h = h';
%   h = rot90(h,-2);
% H=freqz2(h,[512 512]);
figure
imshow(H,[])
G=Pf.*H;
imshow(log(1+(G)),[]);
G0=real(ifft2(G));
for m=1:2*M
    for n=1:2*N
        G0(m,n)=G0(m,n)*(-1)^(m+n);
    end
end
% I0=(real(ifftshift(ifft(G))));
R=G0(1:M,1:N);
figure
imshow((R),[]);
