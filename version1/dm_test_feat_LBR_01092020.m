clc
clear
close all
%%
load test_data_NP52.mat
%%
Nsl = 516;
NsubSeg = 2;
Nsigval = 6;
combo = combnk(1:10,2);
[rws,cols] =size(test_data);
Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
feats_10ch = [];
     for clx = 1:10
             idata1 = [];
         pattern = test_data((nx-1)*Nsl+1:nx*Nsl,clx);
         SegmLen = length(pattern);
         for sx = 1:NsubSeg
        seg_emg1 = pattern((sx-1)*floor(SegmLen/NsubSeg)+1:(sx)*floor(SegmLen/NsubSeg));
                 idata = fn_LBP_feat(seg_emg1,Nsigval) ;
        idata1 = [idata1 idata(:)'];
         end
  feats_10ch = [feats_10ch  idata1(:)'];
     end
%     idata = avec;
%     
%     end
    feats_data(nx,:) = feats_10ch(:)';
end


