function wL = fn_SigWaveLength(y)
y1 = zeros(size(y));
y1(1:end-1) = y(2:end);

df1 = abs(y-y1);

wL = sum(df1);


% df2 = sign(y-y2);


% sum(z1)
% sum(z2)

% z = z1+z2;
return;