
clc
clear
close all
%%
load test_data_NP52.mat
%%
Nsl = 516;
combo = combnk(1:5,2);

[rws,cols] =size(test_data);

Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:10
    pattern = test_data((nx-1)*Nsl+1:nx*Nsl,clx);
    idata = statmeasure(pattern);
    feats_10ch = [feats_10ch  idata(:)'];
    end
    feats_data(nx,:) = feats_10ch;
end


