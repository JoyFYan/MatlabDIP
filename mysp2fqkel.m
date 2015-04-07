%==========================================================================
%  教学演示程序： Build frequency domain filters from the small mask 
%                spatial domain
%                name: mysp2fqkel_2D.m
%                School of Opto-Electronic Information, University of
%                Electronic Science and Technology of China
%                time: 2015.05.07
%                Author：zhenming peng
% =========================================================================
%clc,clear all, close all;
% =========================================================================

% =========================================================================
% 空间域滤波器生成
% =========================================================================
%h = fspecial('sobel');'
h = [-1 -2 -1;0 0 0;1 2 1];
h = h';
% =========================================================================
% 根据实际图像尺寸扩充区域
% =========================================================================
M = 257; N = 256; %设定扩充的尺寸,与实际的待处理图像有关
hp = zeros(M, N);
s = size(h);
sp = size(hp); 
%hp(1:s(1),1:s(2)) = h;
% 1) 空间域滤波器置于扩充区域的中心
% sy = ceil((sp(1)-s(1))/2+1);
% sx = ceil((sp(2)-s(2))/2+1);
 sy =floor((sp(1)-s(1))/2+1);
sx = floor((sp(2)-s(2))/2+1);
hp(sy:sy+s(2)-1,sx:sx+s(1)-1) = h; 
% =========================================================================
% 空域滤波器显示
% =========================================================================
subplot(121)
imshow(hp);

% =========================================================================
% 2) 空间调制，实现频域谱中心化
% =========================================================================
for i = 1:M
    for j = 1:N
        hp(i,j) = hp(i,j).*(-1).^(i+j);
    end
end
% =========================================================================
% 3) 空间滤波器扩充区域的FFT
% =========================================================================
Hp = fft2(double(hp));
H = sqrt(-1).*imag(Hp);
% H = fftshift(H);

% =========================================================================
% 4) 频谱的反中心化
% =========================================================================
for u = 1:size(Hp,1)
    for v = 1:size(Hp,2)
        Hp(u,v) = Hp(u,v).*(-1).^(u+v);
    end
end

% 仅仅显示虚部，与显示模不一样
Fa = imag(Hp);
% =========================================================================
% 显示2D频谱
% =========================================================================
subplot(122)
% imshow(mat2gray(F2));
imshow(Fa,[]);
% =========================================================================
% 显示3D频谱
% =========================================================================

newfsize = 32;
Fa = imresize(Fa,[newfsize,newfsize],'bicubic');
figure
[x,y]=meshgrid(-1*newfsize/2+1:1:newfsize/2,-1*newfsize/2+1:1:newfsize/2);
%axis=([-31,32,-31,32,0,200]);
surfl(x,y,Fa);
grid on