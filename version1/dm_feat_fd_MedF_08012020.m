clc
clear
close all
%%
load train_data_NP52.mat
%%
Nsl = 516;
combo = combnk(1:5,2);

[rws,cols] =size(train_data);

Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:10
    pattern = train_data((nx-1)*Nsl+1:nx*Nsl,clx);
         avec(1) = medfreq(pattern);
         avec(2) = meanfreq(pattern);
          
       idata = avec;
    feats_10ch = [feats_10ch  idata(:)'];
    end
    feats_data(nx,:) = feats_10ch;
end


