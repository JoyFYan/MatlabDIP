clc,clear all,close all;
h = [-1 -2 -1;0 0 0;1 2 1]';
Nx = 50; Ny = 50;% 任意改变输入尺寸！
%h = rot90(h,-2); % Unrotate filter since FIR filters are rotated.
center_h = ceil((size(h) + 1)/2);
% Pad A if necessary
if any(size(h) < [Ny Nx])
    h(Ny,Nx) = 0.0;
end
% Now circularly shift a to put the center element at the upper left corner.
row_indices = [center_h(1):Ny, 1:(center_h(1)-1)]';
col_indices = [center_h(2):Nx, 1:(center_h(2)-1)]';
h = h(row_indices, col_indices);
H = fftshift(fft2(h));
H = complex(0,imag(H));% 实部置零
Fa = imag(H);
%subplot(122)
imshow(Fa,[]);% 仅显示虚部，不能用abs
% =========================================================================
% 布局新的X-Y网格，显示滤波器3D图
% =========================================================================
dr = 10; dc = 10;
figure,surfl(Fa(1:dc:Ny,1:dr:Nx));
grid on 
%freqz2