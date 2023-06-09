
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
Npwin = 2; % worked great 
% Npwin = 6; 
% Lp = 129;

[rws,cols] =size(train_data);

Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:10
    pattern = train_data((nx-1)*Nsl+1:nx*Nsl,clx);
    Pseg  = (pattern);
             Lp = length(Pseg);
%        disp(Lp);
       pwn = floor(Lp/Npwin);
       for px = 1:Npwin
            pwind = ((Pseg((px-1)*pwn+1:px*pwn)));
            pseg_av(px) = fn_SigWaveLength(pwind);
       end
       idata = (pseg_av); 


       feats_10ch = [feats_10ch  idata(:)'];
    
%    R feats_10ch = [feats_10ch  idata(:)'];
    end
%       stem(feats_10ch);
%       drawnow;
%       pause(0.1)
     feats_data(nx,:) = feats_10ch;
end

save feat_td_wL_seg2_NP52.mat feats_data;
