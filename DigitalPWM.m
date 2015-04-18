clear all;close all;clc;
data=input('data=');%输入数据
% data=double(data);
x=1;
temp=0;
p=1;
result=0;
while 1
     w = bitand(data,3);%数据取低二位
    data=bitshift(data, -2);%数据右移二位
   
    for m=1:3+w*3
        pwm(x)=1;
        x=x+1;
    end
    for m=3+w*3:14
        pwm(x)=0;
        x=x+1;
    end
    
    if data<=0
        break
    end
end
 bar(pwm)

 l=length(pwm)/15;
    for m=1:l
       result=result+((sum(pwm(1+(m-1)*15:m*15))-3)/3)*4^(m-1);
    end
disp('result is')
disp(result)
