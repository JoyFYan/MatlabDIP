clear all;close all;clc;
load gong.mat;
% wavplay(y,Fs);
con1=sqrt(2);
m=size(y,1);
figure,plot(y);
P=dct(y);
figure,plot(P);
f=zeros(2*m,1);
f(1:m)=y;
F=fft(f);
for n=1:2*m
    F(n)=F(n)*con1*exp(-1i*pi*(n-1)/2/m);
end
F=real(F)*sqrt(1/m);
R=zeros(m,1);
R(1:m)=F(1:m);
S=R-P;
figure,plot(R);
Q=idct(R);
% wavplay(Q,Fs);
S1=y-Q;
figure,plot(S1)