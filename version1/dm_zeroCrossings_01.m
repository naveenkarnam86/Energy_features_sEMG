clc; clear;
close all;

% Frequency sweep
F0 = 10;        % start frequency, Hertz
F1 = 100;       % stop frequency, Hertz
T  = 0.5;       % duration, seconds
FS = 1000;      % sample rate, Hertz
N = round(T * FS);
t = T * (0:N-1)' / (N-1);
y = sin( pi * (F0 + (F1 - F0) / 2 .* t / T) .* t);
subplot(2,1,1); plot(t, y); xlabel('seconds');
%
% Positive-slope zero-crossing detector
[crossings, z]= fn_myZerocrossings(y);


subplot(2,1,2); plot(t, z.z1); xlabel('seconds');
hold on
plot(t, z.z2); xlabel('seconds');

%
% Find the locations of the zero-crossing points
% crossing_points = find(z);