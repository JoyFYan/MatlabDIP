clear all;close all;clc;
x=1;
dt=1/50000;
 data=input('data=');
temp=0;
p=1;
result=0;
while 1
    w = bitand(data,15);
    data=bitshift(data, -4);
    for m=1:w
        pwm(x)=1;
        x=x+1;
    end
%     t0=t0+dt*16/w;
    for m=w:14
        pwm(x)=0;
        x=x+1;
    end
    
    if data<=0
        break
    end
end
% t=0:dt:(x-2)*dt;
 bar(pwm)

 l=length(pwm)/15;
    for m=1:l
       result=result+sum(pwm(1+(m-1)*15:m*15))*16^(m-1);
    end    
result
 
