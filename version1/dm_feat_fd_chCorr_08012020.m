clc
clear
close all
%%
load train_data_NP52.mat
%%
Nsl = 516;
combo = combnk(1:10,2);
[rws,cols] =size(train_data);
Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
%     for clx = 1:10
          for ccx = 1:size(combo,1)
          pattern1 = train_data((nx-1)*Nsl+1:nx*Nsl,combo(ccx,1));
          pattern2 = train_data((nx-1)*Nsl+1:nx*Nsl,combo(ccx,2));
          amat = xcorr(pattern1,pattern2);
          idata1(ccx) = max(amat);
          end
%     idata = avec;
%     feats_10ch = [feats_10ch  idata1(:)'];
%     end
    feats_data(nx,:) = idata1(:)';
end


