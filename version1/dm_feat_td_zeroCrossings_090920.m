
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
Npwin = 2;
% 
% Npwin = 6; 
% Lp = 129;

[rws,cols] =size(train_data);

Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:10
    pattern = train_data((nx-1)*Nsl+1:nx*Nsl,clx);
    %Pseg  = abs(pattern);
%              Lp = length(Pseg);
%        disp(Lp);
      pattern_zero_mean = pattern - mean(pattern);    
      [c,z] = fn_myZerocrossings(pattern_zero_mean);
      idata = sum(z.z1)+sum(z.z2);
      feats_10ch = [feats_10ch  idata(:)'];
    
%    R feats_10ch = [feats_10ch  idata(:)'];
      end
%      stem(feats_10ch);
 %     drawnow;
  %    pause(0.1)
     feats_data(nx,:) = feats_10ch;
end

save feat_td_CountzCross_NP52.mat feats_data;
