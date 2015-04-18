clear all;close all;clc;
% load gong.mat;
x=1:pi/5:4000;

y(1:2000)=cos(x(1:2000));
y(2001:6000)=cos(2*x(2001:6000));
n=80;
L=length(y);
Fs=pi/10;
dt=1/Fs;
t0=n*dt;
l=ceil(L/n);
wf=zeros(l,n);
for m=1:l-1
    
    ytemp=y(1+n*(m-1):n*m);
    ftemp=fft(ytemp);
    wf(m,:)=abs(fftshift(ftemp));
end

surf(wf)
