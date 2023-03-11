clc;
clear all;
close all;
n = -3:1:3;
x(n == -3) = 0,
x(n == -2) = -5.7989;
x(n == -1) = 6.7444;
x(n == 0) = -5.858;
x(n == 1) = 5.858;
x(n == 2) = -6.7444;
x(n == 3) = 5.7989;

% x(n == -3) = -5.2247-2.5161i;
% x(n == -2) = 0;
% x(n == -1) = 5.2247-2.5161i;
% x(n == 0) = 4.2051-5.2731i;
% x(n == 1) = 1.3034-5.7108i;
% x(n == 2) = -1.3034-5.7108i;
% x(n == 3) = -4.2051-5.2731i;

N = length(x);
n0=4;
k=0:1:6;
basis1= exp((-i*2*pi*k*n0)/N);
xn= x.*basis1;
xk = fft(x,N);
xk1 =fftshift(xk);
disp('op seq xn');
disp(xk);
disp('op seq xn');
disp(xk1);