function y = myDFT(x)
%==========================================================================
% function: y = mydft(x)
% y is the discrete Fourier transform of a column n-vector x.
%==========================================================================
N = length(x);
for u=1:length(x)
    y(u)=0;
    for n =1:length(x)
         y(u)=y(u)+x(n)*exp(((-1i)*2*pi*(n-1)*(u-1))/N);
    end
end