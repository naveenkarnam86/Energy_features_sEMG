
clc
clear
close all
%%
% load train_data_NP52.mat
load train_data_comp.mat
train_data = Training_data_raw(:,1:10);
%%
Nsl = 516;
% combo = combnk(1:5,2);
ModelOrder = 2;
Npwin = 1; % worked great 
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
Pseg  = periodogram(pattern);
             Lp = length(Pseg);
%        disp(Lp);
       pwn = floor(Lp/Npwin);
       for px = 1:Npwin
            pwind = Pseg((px-1)*pwn+1:px*pwn);
            pseg_av(px) = mean(pwind);
       end
       idata = log(pseg_av);   
       feats_10ch = [feats_10ch  idata(:)'];
    end
    feats_data(nx,:) = feats_10ch;
end


