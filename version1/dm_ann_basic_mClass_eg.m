clc
clear 
close all

%%
[x,t] = wine_dataset;
size(x)
size(t)
net = patternnet(10);
view(net)
[net,tr] = train(net,x,t);
nntraintool
nntraintool('close')
plotperform(tr)

testX = x(:,tr.testInd);
testT = t(:,tr.testInd);

testY = net(testX);
testIndices = vec2ind(testY)

plotconfusion(testT,testY)

