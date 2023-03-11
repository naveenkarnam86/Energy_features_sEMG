
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
    cseg  = cceps(pattern);
             Lp = length(cseg);
%        disp(Lp);
       pwn = floor(Lp/Npwin);
       for px = 1:Npwin
            pwind = abs((cseg((px-1)*pwn+1:px*pwn)));
            pseg_av(px) = mean(pwind);
       end
       idata = (pseg_av); 
   
    feats_10ch = [feats_10ch  idata(:)'];
    end
    feats_data(nx,:) = feats_10ch;
end


