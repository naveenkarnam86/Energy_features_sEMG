clc
clear all
close all

load train_class_label_comp.mat
Npat  = floor(size(train_cl_vec,1)/516);
train_vec = train_cl_vec;
train_cl_vec = [];
train_cl_vec = zeros(Npat,1);
% Npat 
Ns = 516;
% train
for nx = 1:Npat
    if nx ~= Npat
train_cl_vec(nx) = mode(train_vec((nx-1)*Ns+1:nx*Ns));
    else
train_cl_vec(nx) = mode(train_vec((nx-1)*Ns+1:end));
    end
end