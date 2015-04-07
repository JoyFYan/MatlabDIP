close all;clear all;
% syms x;
% y=sin(2*pi*50*x)+sin(2*pi*120*x);
% y1=y+rand;
% figure, ezplot(y,[0 0.0471]);
% figure, ezplot(y1,[0 0.0471]);
 %x=linspace(0,0.0412,200);
% x=linspace(0,0.1,1000);
% y=sin(x*2*pi*50)+sin(x*2*pi*120);
% figure,plot(x,y)
% f=zeros([1 1000]);
%u=-500:1:500;
%  y=[1,2,4,4];
% 
% for i=1:4
%     y(i)=y(i)*(-1)^i;
% end
% 
% N  = length(y);
% dt = 0.001; fs = 1./dt;
% df = fs/(N-1); % 频率间隔/精度
x=[1 2 4 4];
y=fft(x);
f=zeros([1 4]);
for m=1:4
    for n=1:4
    f(m)=f(m)+y(n)*exp(1i*2*pi*(n)*(m)/4);
    end
    f(m)=abs(f(m));
end



%u = df*(-(4-1)/2:(4-1)/2); % 对称频谱(含负频)
figure,plot(x,f)
