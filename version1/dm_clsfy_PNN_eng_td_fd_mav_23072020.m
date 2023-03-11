clc
clear
close all
%%

feat_comb_data = [];
%  load feat_LMF_AlTim_dat.mat
%----------------------------------------------------------------------
% log of second order cross moments in frequency domain  (Similar to Cepstral) 
%----------------------------------------------------------------------
%  load feat_LMFC02_dat.mat
%  feat_comb_data = feats_data;
%----------------------------------------------------------------------
% Time domain statistics 
% load feat_TD_Stats_dat.mat
%----------------------------------------------------------------------
% spectral band powers from the periodogram 
%----------------------------------------------------------------------
%  load feat_ent_pdg_04_dat.mat
% load feat_var_absft_04_dat.mat
%  load feat_std_pdg_04_dat.mat
%  load feat_kurt_FT_04_dat.mat
% load feat_weng_04_dat.mat
% load feat_cceps_mean04_dat
%----------------------------------------------------------------------
load feat_td_eg2_dat.mat
feat_comb_data = [feat_comb_data feats_data];
load feat_td_mav4_dat.mat
feat_comb_data = [feat_comb_data feats_data];
% load feat_fd_LowF_eg_1_dat.mat
% load feat_SBP_pcov_04_dat.mat
% load feat_SBP_pdg_dat.mat
%----------------------------------------------------------------------
%load feat_eg_pdg_01_dat.mat
%load feat_SBP_pdg_dat.mat
load feat_eg_pdg_04_dat
feat_comb_data = [feat_comb_data feats_data];
load train_class_label_NP52.mat
trainingData = [feat_comb_data train_cl_vec];

%%
Nfold = 10;
spread = 1.0;
fldaflag = 0;

% for mc = 1:MC
%     disp(mc)
[Finalconfmat,finkappa,TrainConfMat,TrainKappa,net1,net2,...
 validationPredictions,targets_labels] = PNNClassifier4(feat_comb_data,train_cl_vec(:)',Nfold,spread,fldaflag);

%%
accuracy = sum(diag(Finalconfmat))/sum(sum(Finalconfmat));
acc_vec = accuracy;
kappa_vec = finkappa;
Nc = size(Finalconfmat,1);

%   M = 52
pMetrics.accuracy = accuracy;
%[confmat,finkappa,pra,pre] = ConfusionMatrix2(validationPredictions,partitionedModel.Y,M);
pMetrics.kappa = finkappa;
metrics = MyClassifyPerf(targets_labels, validationPredictions);
pMetrics.F1 = metrics.F1;
% fname1 = sprintf('Classify_Results/targets_myPNN%.2d.dat',mc);
% csvwrite(fname1,targets_labels);
% fname2 = sprintf('Classify_Results/outputs_myPNN%.2d.dat',mc);
% csvwrite(fname2,validationPredictions);
  
  

% end