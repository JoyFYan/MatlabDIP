%==========================================================================
%                ͼ��FFTʾ������
%                name: FFTSample.m
%                School of Opto-Electronic Information, University of
%                Electronic Science and Technology of China
%                time: 2013.03.27
%                Author��zhenming peng
% =========================================================================
clc,clear all, close all;
% =========================================================================
% �����ֵ����ͼ
% =========================================================================
% f = zeros(56,56);
% f(15:55,30:34) = 1;

% =========================================================================
% ����ʵ��ͼ������
% =========================================================================
%f = imread('cameraman.tif');
f = (imread('cameraman.tif'));
% =========================================================================
% ��ʾͼ��
% =========================================================================
subplot(121)
imshow(f);
% =========================================================================
% FFT 
% =========================================================================
f=im2double(f);
for j = 1:size(f,2)
    for i = 1:size(f,1)
        f(i,j) = f(i,j)*(-1)^(i+j);
    end
end
F = fft2(f);
% F = fftshift(F);

% ���ֵ
Fa = abs(F);
% Fa = sqrt(real(F).^2 + imag(F).^2);
% =========================================================================
% ��ʾ2DƵ��
% =========================================================================
subplot(122)
 Fa=log(1+Fa);
imshow(Fa,[]);

% =========================================================================
% ��ʾ3DƵ��
% =========================================================================
Nx = size(Fa,2); Ny = size(Fa,1);
Dx = 4; Dy = 4; 
% Fx = ((0:Nx-1)-floor(Nx/2))/(Nx*Dx);
% Fy = ((0:Ny-1)-floor(Ny/2))/(Ny*Dy);
Fx = (0:Dx:Nx-1)-floor(Nx/2);
Fy = (0:Dy:Ny-1)-floor(Ny/2);
figure,
[x,y] = meshgrid(Fx, Fy);
surfl(x,y,Fa(1:Dy:Ny,1:Dx:Nx));
%mesh(x,y,Fa(1:Dy:Ny,1:Dx:Nx));
grid on