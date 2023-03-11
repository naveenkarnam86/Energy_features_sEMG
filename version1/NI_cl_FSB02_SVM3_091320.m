clc
clear
close all;
tic
%%
% function [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% returns a trained classifier and its accuracy. This code recreates the
% classification model trained in Classification Learner app. Use the
% generated code to automate training the same model with new data, or to
% learn how to programmatically train models.
%
%  Input:
%      trainingData: a matrix with the same number of columns and data type
%       as imported into the app.
%
%  Output:
%      trainedClassifier: a struct containing the trained classifier. The
%       struct contains various fields with information about the trained
%       classifier.
%
%      trainedClassifier.predictFcn: a function to make predictions on new
%       data.
%
%      validationAccuracy: a double containing the accuracy in percent. In
%       the app, the History list displays this overall accuracy score for
%       each model.
%
% Use the code to train the model with new data. To retrain your
% classifier, call the function from the command line with your original
% data or new data as the input argument trainingData.
%
% For example, to retrain a classifier trained with the original data set
% T, enter:
%   [trainedClassifier, validationAccuracy] = trainClassifier(T)
%
% To make predictions with the returned 'trainedClassifier' on new data T2,
% use
%   yfit = trainedClassifier.predictFcn(T2)
%
% T2 must be a matrix containing only the predictor columns used for
% training. For details, enter:
%   trainedClassifier.HowToPredict

% Auto-generated by MATLAB on 20-Jul-2020 20:24:55
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
% Time domain stats
load feat_td_mav2_dat.mat
feat_comb_data = [feat_comb_data feats_data];
% interchannel corelation features
load feat_td_CountzCross_NP52.mat
 feat_comb_data = [feat_comb_data feats_data];
% LMF features from Al Timemy et al  
load feat_td_CountSSC_NP52.mat
 feat_comb_data = [feat_comb_data feats_data];
% LMF features from ACT & BG 2019  
 load feat_td_wL_seg2_NP52.mat
 feat_comb_data = [feat_comb_data feats_data];
% Spectral band powers from ACT & BG
load train_feat_WA_NP52
 feat_comb_data = [feat_comb_data feats_data];
load train_feat_MPR_NP52.mat
 feat_comb_data = [feat_comb_data feats_data];
load train_feat_CARD_NP52.mat
 feat_comb_data = [feat_comb_data feats_data];
 
 
%----------------------------------------------------------------------
%load feat_eg_pdg_01_dat.mat
%load feat_SBP_pdg_dat.mat
%load feat_eg_pdg_04_dat
% LBP features from ACT & BG 2019 
% load feat_LBP_dat_n52.mat
% feat_comb_data = [feat_comb_data feats_data];

% feat_comb_data = FeatureStandardize(feat_comb_data);

load train_class_label_NP52.mat
trainingData = [feat_comb_data train_cl_vec];

%Npat = size(trainingData,1);
Npat = size(trainingData,1);
%MC = 100;
Nfold = 10;
% spread = 1.0;
% fldaflag = 0;
MC = 1;

Nc = max(unique(train_cl_vec));
% spread = 1;
% fldaflag = 0;
% Nepoch = 300;
% NHidden1 = 5;
% MinEr = 0.001;
% NrNeuronLayer = 20;

for mx = 1:MC
    disp(mx);
% r_index = shuff
r_index = ShuffleSequence(Npat);

% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
% Convert input to table
% inputTable = array2table(trainingData, 'VariableNames', {'column_1', 'column_2', 'column_3', 'column_4', 'column_5', 'column_6', 'column_7', 'column_8', 'column_9', 'column_10', 'column_11', 'column_12', 'column_13', 'column_14', 'column_15', 'column_16', 'column_17', 'column_18', 'column_19', 'column_20', 'column_21', 'column_22', 'column_23', 'column_24', 'column_25', 'column_26', 'column_27', 'column_28', 'column_29', 'column_30', 'column_31', 'column_32', 'column_33', 'column_34', 'column_35', 'column_36', 'column_37', 'column_38', 'column_39', 'column_40', 'column_41', 'column_42', 'column_43', 'column_44', 'column_45', 'column_46', 'column_47', 'column_48', 'column_49', 'column_50', 'column_51', 'column_52', 'column_53', 'column_54', 'column_55', 'column_56', 'column_57', 'column_58', 'column_59', 'column_60', 'column_61', 'column_62', 'column_63', 'column_64', 'column_65', 'column_66', 'column_67', 'column_68', 'column_69', 'column_70', 'column_71', 'column_72', 'column_73', 'column_74', 'column_75', 'column_76', 'column_77', 'column_78', 'column_79', 'column_80', 'column_81', 'column_82', 'column_83', 'column_84', 'column_85', 'column_86', 'column_87', 'column_88', 'column_89', 'column_90', 'column_91', 'column_92', 'column_93', 'column_94', 'column_95', 'column_96', 'column_97', 'column_98', 'column_99', 'column_100', 'column_101'});

% predictorNames = {'column_1', 'column_2', 'column_3', 'column_4', 'column_5', 'column_6', 'column_7', 'column_8', 'column_9', 'column_10', 'column_11', 'column_12', 'column_13', 'column_14', 'column_15', 'column_16', 'column_17', 'column_18', 'column_19', 'column_20', 'column_21', 'column_22', 'column_23', 'column_24', 'column_25', 'column_26', 'column_27', 'column_28', 'column_29', 'column_30', 'column_31', 'column_32', 'column_33', 'column_34', 'column_35', 'column_36', 'column_37', 'column_38', 'column_39', 'column_40', 'column_41', 'column_42', 'column_43', 'column_44', 'column_45', 'column_46', 'column_47', 'column_48', 'column_49', 'column_50', 'column_51', 'column_52', 'column_53', 'column_54', 'column_55', 'column_56', 'column_57', 'column_58', 'column_59', 'column_60', 'column_61', 'column_62', 'column_63', 'column_64', 'column_65', 'column_66', 'column_67', 'column_68', 'column_69', 'column_70', 'column_71', 'column_72', 'column_73', 'column_74', 'column_75', 'column_76', 'column_77', 'column_78', 'column_79', 'column_80', 'column_81', 'column_82', 'column_83', 'column_84', 'column_85', 'column_86', 'column_87', 'column_88', 'column_89', 'column_90', 'column_91', 'column_92', 'column_93', 'column_94', 'column_95', 'column_96', 'column_97', 'column_98', 'column_99', 'column_100'};
% predictors = inputTable(:, predictorNames);
% response = inputTable.column_101;
% predictors = trainingData(:,1:end-1);
% response = trainingData(:,end);
predictors = trainingData(r_index,1:end-1);
response = trainingData(r_index,end);
% isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];


template = templateSVM(...
    'KernelFunction', 'polynomial', ...
    'PolynomialOrder', 3, ...
    'KernelScale', 'auto', ...
    'BoxConstraint', 1, ...
    'Standardize', true);
classificationSVM = fitcecoc(...
    predictors, ...
    response, ...
    'Learners', template, ...
    'Coding', 'onevsone', ...
    'ClassNames', [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21; 22; 23; 24; 25; 26; 27; 28; 29; 30; 31; 32; 33; 34; 35; 36; 37; 38; 39; 40; 41; 42; 43; 44; 45; 46; 47; 48; 49; 50; 51; 52]);

% Create the result struct with predict function
predictorExtractionFcn = @(x) array2table(x);
svmPredictFcn = @(x) predict(classificationSVM, x);
trainedClassifier.predictFcn = @(x) svmPredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedClassifier.ClassificationSVM = classificationSVM;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2018b.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new predictor column matrix, X, use: \n  yfit = c.predictFcn(X) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nX must contain exactly 140 columns because this model was trained using 140 predictors. \nX must contain only predictor columns in exactly the same order and format as your training \ndata. Do not include the response column or any columns you did not import into the app. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

partitionedModel = crossval(trainedClassifier.ClassificationSVM, 'KFold', 10);
% Compute validation predictions
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);

% Compute validation accuracy
accuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
%acc_vec(mc) = accuracy;
%kappa_vec(mc) = finkappa;
    
  %conf_array(mc).Finalconfmat2 = Finalconfmat;
  %conf_array(mc).acc2 = accuracy;
  %conf_array(mc).kappa2 = finkappa;
  
  
% M = 20;
%pMetrics(mc).accuracy = accuracy;
[confmat,finkappa,pra,pre] = ConfusionMatrix2(validationPredictions,partitionedModel.Y,Nc);
%pMetrics(mc).kappa = finkappa;
metrics = MyClassifyPerf(partitionedModel.Y, validationPredictions);
%pMetrics(mc).F1 = metrics.F1;

% 
 res(mx).cros_acc = accuracy;
 res(mx).cros_precision = metrics.precision;
 res(mx).cros_recall = metrics.recall;
 res(mx).cros_F1 = metrics.F1;
 res(mx).cros_kappa = finkappa;


%%
 

test_feats = [];
load test_feat_mav_2_NP52.mat
test_feats = [test_feats feats_data];
% interchannel corelation features
load test_feat_td_CountzCross_NP52.mat
 test_feats = [test_feats feats_data];
% LMF features from Al Timemy et al  
load test_feat_td_CountSSC_NP52.mat
 test_feats = [test_feats feats_data];
% LMF features from ACT & BG 2019  
 load test_feat_td_wL_seg2_NP52.mat
 test_feats = [test_feats feats_data];
% Spectral band powers from ACT & BG
load test_feat_WA_NP52
 test_feats = [test_feats feats_data];
load test_feat_MPR_NP52.mat
 test_feats = [test_feats feats_data];
load test_feat_CARD_NP52.mat
 test_feats = [test_feats feats_data];
% % Testing Accuracy

% test_feats = FeatureStandardize(test_feats);
load test_class_label_NP52.mat


% [~,cv_kappa,~,~,cv_acc] = ConfusionMatrix2(validationPredictions,response,Nc);


% metrics_cv = MyClassifyPerf(validationPredictions,response);


 [label,score,cost] = predict(trainedClassifier.ClassificationSVM,test_feats);

metrics_ts = MyClassifyPerf(label,test_cl_vec);

 [test_kappa,pra,pre,test_acc] = ConfusionMatrix2(label,test_cl_vec,Nc);

% res(mx).cros_acc = CV_Accuracy;
% res(mx).cros_precision = metrics_cv.precision;
% res(mx).cros_recall = metrics_cv.recall;
% res(mx).cros_F1 = metrics_cv.F1;
% res(mx).cros_kappa = cv_kappa;

res(mx).test_acc = test_acc;
res(mx).test_kappa = test_kappa;
res(mx).test_precision = metrics_ts.precision;
res(mx).test_recall = metrics_ts.recall;
res(mx).test_F1 = metrics_ts.F1;
 %[label,score] = predict(trainedClassifier.ClassificationEnsemble,test_feats);
%------------------------------------------------------------------------- 
% Testing
%-------------------------------------------------------------------------

end

 save results_FSB02_SVM3_0913020.mat res;
toc

