
clc
clear
close all
%%
% load train_data_NP52.mat
load train_data_NP52.mat
%%
Nsl = 516;
% combo = combnk(1:5,2);
ModelOrder = 2;
Npwin = 4; % worked great 
% Npwin = 6; 
% Lp = 129;

[rws,cols] =size(train_data);

Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:10
    pattern = train_data((nx-1)*Nsl+1:nx*Nsl,clx);
% winLen = floor(Nw/8);
% Noverlap = winLen-10;
%        Pseg = pwelch(abseg,winLen,Noverlap)0;
% idata  wenergy
% wavenergy
idata = wavenergysym(pattern);
    feats_10ch = [feats_10ch  idata(:)'];
    end
    feats_data(nx,:) = feats_10ch;
end


