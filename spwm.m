%SPWM
close all;clear all;
x=linspace(0,10*pi,1000);
y1=sin(0.5*x)+1;
%x = 0:0.01:5;
%y2 = mod(x, 0.003);
y2 =sawtooth(2*pi*x,pi/10)+1;
figure;plot(x,y1)
figure ;plot(x,y2)
z=zeros(1,1000);
 for m=1:1000
     if(y1(m)>y2(m))
         z(m)=0;
     else 
         z(m)=1;
     end
 end
 figure;plot(z)
 
