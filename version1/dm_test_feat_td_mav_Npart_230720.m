
clc
clear
close all
%%
% load test_data_NP52.mat
load test_data_NP52.mat
%%
Nsl = 516;
% combo = combnk(1:5,2);
ModelOrder = 2;
Npwin = 4; % worked great 
% Npwin = 6; 
% Lp = 129;

[rws,cols] =size(test_data);

Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:10
    pattern = test_data((nx-1)*Nsl+1:nx*Nsl,clx);
    Pseg  = abs(pattern);
             Lp = length(Pseg);
%        disp(Lp);
       pwn = floor(Lp/Npwin);
       for px = 1:Npwin
            pwind = abs((Pseg((px-1)*pwn+1:px*pwn)));
            pseg_av(px) = mean(pwind);
       end
       idata = (pseg_av); 


       feats_10ch = [feats_10ch  idata(:)'];
    
%    R feats_10ch = [feats_10ch  idata(:)'];
    end
%      stem(feats_10ch);
%      drawnow;
%      pause(0.1)
     feats_data(nx,:) = feats_10ch;
end


