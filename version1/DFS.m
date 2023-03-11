clc;
clear all;
close all;
k = -3:1:3;
x(k == -3) = -3i;
x(k == -2) = -2i;
x(k == -1) = -i;
x(k == 0) = 0;
x(k == 1) = i;
x(k == 2) = 2i;
x(k == 3) = 3i;
N = length(x);
n0=3;
k=0:1:6;
basis= exp((-i*2*pi*k*n0)/N);
x1 = ifft(x,N);
% xn = ifftshift(x1);
% disp(xn);
xn = x1.*basis;
disp('op seq xn');
disp(xn);