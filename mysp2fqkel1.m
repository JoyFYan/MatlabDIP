%==========================================================================
%  ��ѧ��ʾ���� Build the frequency domain filter from the small mask 
%                in spatial domain
%                name: mysp2fqkel.m
%                School of Opto-Electronic Information, University of
%                Electronic Science and Technology of China
%                Date: 2015.05.07
%                Author: Peng Zhenming 
% =========================================================================
% clc,clear all,close all;
% =========================================================================
% �ռ����˲�������
% =========================================================================
% h = fspecial('sobel');
h = [-1 -2 -1;0 0 0;1 2 1];
h = h';
% h = rot90(h,-2);% ���ͼ�������أ����Ǿ�������
% =========================================================================
% ����ʵ��ͼ��ߴ���������
% =========================================================================
M = 256; N = 256; %�趨����ĳߴ�,��ʵ�ʵĴ�����ͼ���й�
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
% 1) �ռ����˲��������������������,why ?
center_hp = ceil((size(hp)+1)/2);
sr = center_hp(1); sc = center_hp(2);
hp(sr-1:sr+1,sc-1:sc+1) = h; 

% =========================================================================
% �����˲�����ʾ
% =========================================================================
subplot(121)
imshow(hp);

% =========================================================================
% 2) �ռ���ƣ�ʵ��Ƶ�������Ļ�
% =========================================================================
for i = 1:Nx
    for j = 1:Ny
        hp(i,j) = hp(i,j).*(-1).^(i+j);
    end
end
% =========================================================================
% 3) �ռ��˲������������FFT
% =========================================================================
Hp = fft2(double(hp));
H = sqrt(-1).*imag(Hp);% ʵ������
%H = ifftshift(H);

% =========================================================================
% 4) Ƶ�׵ķ����Ļ�
% =========================================================================
for u = 1:size(H,1)
    for v = 1:size(H,2)
        Hp(u,v) = Hp(u,v).*(-1).^(u+v);
    end
end
Hp = imresize(Hp,[M,N]);
% ������ʾ�鲿������ʾ������ģ��һ��
Fa = imag(Hp);
% =========================================================================
% ��ʾƵ��2D�˲���
% =========================================================================
subplot(122)
imshow(Fa,[]);
% =========================================================================
% �����µ�X-Y������ʾ�˲���3Dͼ
% =========================================================================
dr = 10; dc = 10;
figure,surfl(Fa(1:dr:N,1:dc:M));
%axis=[-nc/2+1,nc/2,-nr/2+1,nr/2,0,200];
grid on