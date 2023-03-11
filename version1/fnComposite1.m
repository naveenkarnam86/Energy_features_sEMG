function [cmf] = fnComposite1(w1)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
cmf = zeros(size(w1));
% cmf(w1>2 & w1 <-2)  = cmf(w1>2 & w1 <-2)+0.5;
cmf(w1>=-2 & w1 <= 2)   = 1-((w1(w1>=-2 & w1 <= 2).^2)/4)
% cmf(w1>2 & w1 <-2)  = 0.5;
cmf = cmf/2 + 0.5
end