%==========================================================================
%                ͼ��FFTʾ������
%                name: FFTSample.m
%                School of Opto-Electronic Information, University of
%                Electronic Science and Technology of China
%                time: 2013.03.27
%                Author��zhenming peng
% =========================================================================
clc,clear all;close all;
% ===============================================

% ===============================================
% �����ֵ����ͼ
% ===============================================

f = zeros(30,30);
f(5:24,13:17) = 1;

% ===============================================
% ����ʵ��ͼ������
% ===============================================
 f=imread('cameraman.tif');

% ===============================================
% ��ʾͼ��
% ===============================================
subplot(121)
imshow(f);
[M N]=size(f);
% imshow(f,'notruesize');
f=double(f);
for m=1:M
    for n=1:N
        f(m,n)=f(m,n)*(-1)^(m+n);
    end
end
imshow(f,[]);
% ===============================================
% FFT
% ===============================================
 
F = fft2(double(f));
%F = fftshift(F);

% ���ֵ
% F2 = log(abs(F));
ref=real(F);imf=imag(F);
A = sqrt(ref.^2+imf.^2);
e=0.0001;
A =(A-min(min(A)))./(max(max(A))-min(min(A))+e); % ���ݹ�һ��
A = A*255; % ��������255��
F2= A;

% ===============================================
% ��ʾƵ��
% ===============================================
subplot(122)
% imshow(F2,[-1 5],'notruesize'); 
% imshow(mat2gray(F2));
imshow(log(F2),[]);

% ===============================================
% ��ʾ3DƵ��
% ===============================================

newfsize=64;
%F2=imresize(F2,[newsize,newsize]);
F2=imresize(F2,[newfsize,newfsize],'bicubic');
% x=-1*newsize/2+1:1:newsize/2;
% y=-1*newsize/2+1:1:newsize/2;
% [X,Y]=meshgrid(x,y);
figure
[x,y]=meshgrid(-1*newfsize/2+1:1:newfsize/2,-1*newfsize/2+1:1:newfsize/2);
%axis=([-31,32,-31,32,0,200]);
surfl(x,y,F2);
grid on