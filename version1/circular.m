clc;
clear all;
close all;

% x=input('enter the sequence x(n)=')
% h=input('enter the sequence h(n)=')
x =[0.5129,-0.6395,1.1524,0, -1.1524,0.6395,-0.5129];
h = [-0.1171,0.51,-2.3929,4, -2.3929,0.51,-0.1171];
   
% x =[0.1141-0.5i,-0.1141-0.5i,-0.3987-0.5i,-1.0383-0.5i,0,...
%     1.0383-0.5i,0.3987-0.5i];
% h = [0.026 - 0.1141i,0.026 + 0.1141i,0.318+0.3987i,2.156+1.0383i,4,...
%     2.156-1.0383i,0.318-0.3987i];

L=length(x);
M=length(h);
N=max(L,M);
x=[x zeros(1,(N-L))];
h=[h zeros(1,(N-M))];
disp('the first sequence after zero padding x(n): ')
disp(x);
disp('the second sequence after zero padding h(n): ')
disp(h);
z=[];
for M=1:N
   y=0;
for i=1:N
   j=(M-i)+1;
   if(j<=0)
       j=N+j;
 end
   y=y+(x(i)*h(j));
end
z=[z y];
end
disp('the output sequence z(n): ')
disp(z);
