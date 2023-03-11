function criterion = knnPredictor(TestData,testtarg,TrainData,TrainTarg)
classificationKNN = fitcknn(...
    TrainData, ...
    TrainTarg, ...
    'Distance', 'Euclidean', ...
    'Exponent', [], ...
    'NumNeighbors', 1, ...
    'DistanceWeight', 'Equal', ...
    'Standardize', true, ...;
    'ClassNames', [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21; 22; 23; 24; 25; 26; 27; 28; 29; 30; 31; 32; 33; 34; 35; 36; 37; 38; 39; 40; 41; 42; 43; 44; 45; 46; 47; 48; 49; 50; 51; 52]);

% Create the result struct with predict function
% predictorExtractionFcn = @(x) array2table(x, 'VariableNames', predictorNames);
predictorExtractionFcn = @(x) array2table(x);
knnPredictFcn = @(x) predict(classificationKNN, x);
trainedClassifier.predictFcn = @(x) knnPredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedClassifier.ClassificationKNN = classificationKNN;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2018b.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new predictor column matrix, X, use: \n  yfit = c.predictFcn(X) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nX must contain exactly 100 columns because this model was trained using 100 predictors. \nX must contain only predictor columns in exactly the same order and format as your training \ndata. Do not include the response column or any columns you did not import into the app. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

%partitionedModel = crossval(trainedClassifier.ClassificationKNN, 'KFold', 10);
[label,~,~] = predict(trainedClassifier.ClassificationKNN,TestData);
Nc = max(unique(TrainTarg));
 [~,~,~,~,test_acc] = ConfusionMatrix2(label,testtarg,Nc);
criterion = 1-test_acc;

%Obs = testtarg(:)';
%Obs = Obs(:);
% Nc = ;
diff_vec = abs(label(:)-testtarg(:));

criterion = sum(diff_vec ~= 0); 