%==========================================================================
%  教学演示程序： Build the frequency domain filter from the small mask 
%                in spatial domain
%                name: mysp2fqkel.m
%                School of Opto-Electronic Information, University of
%                Electronic Science and Technology of China
%                Date: 2015.05.07
%                Author: Peng Zhenming 
% =========================================================================
% clc,clear all,close all;
% =========================================================================
% 空间域滤波器生成
% =========================================================================
% h = fspecial('sobel');
h = [-1 -2 -1;0 0 0;1 2 1];
h = h';
% h = rot90(h,-2);% 针对图像空域相关，而非卷积问题
% =========================================================================
% 根据实际图像尺寸扩充区域
% =========================================================================
M = 256; N = 256; %设定扩充的尺寸,与实际的待处理图像有关
oddm = mod(M,2);oddn = mod(M,2);
if oddm==1
    Nx=M+1;
else
    Nx=M;
end
if oddn==1
    Ny=N+1;
else
    Ny=N;
end
hp = zeros(Nx, Ny);
s = size(h);
sp = size(hp); 
%hp(1:s(1),1:s(2)) = h;
% 1) 空间域滤波器置于扩充区域的中心,why ?
center_hp = ceil((size(hp)+1)/2);
sr = center_hp(1); sc = center_hp(2);
hp(sr-1:sr+1,sc-1:sc+1) = h; 

% =========================================================================
% 空域滤波器显示
% =========================================================================
subplot(121)
imshow(hp);

% =========================================================================
% 2) 空间调制，实现频域谱中心化
% =========================================================================
for i = 1:Nx
    for j = 1:Ny
        hp(i,j) = hp(i,j).*(-1).^(i+j);
    end
end
% =========================================================================
% 3) 空间滤波器扩充区域的FFT
% =========================================================================
Hp = fft2(double(hp));
H = sqrt(-1).*imag(Hp);% 实部置零
%H = ifftshift(H);

% =========================================================================
% 4) 频谱的反中心化
% =========================================================================
for u = 1:size(H,1)
    for v = 1:size(H,2)
        Hp(u,v) = Hp(u,v).*(-1).^(u+v);
    end
end
Hp = imresize(Hp,[M,N]);
% 仅仅显示虚部，与显示复数的模不一样
Fa = imag(Hp);
% =========================================================================
% 显示频域2D滤波器
% =========================================================================
subplot(122)
imshow(Fa,[]);
% =========================================================================
% 布局新的X-Y网格，显示滤波器3D图
% =========================================================================
dr = 10; dc = 10;
figure,surfl(Fa(1:dr:N,1:dc:M));
%axis=[-nc/2+1,nc/2,-nr/2+1,nr/2,0,200];
grid on