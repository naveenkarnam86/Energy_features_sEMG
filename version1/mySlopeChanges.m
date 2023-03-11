function z = mySlopeChanges(y,thr)
y1 = zeros(size(y));
y1(1:end-1) = y(2:end);
y2 = zeros(size(y));
y2(2:end) = y(1:end-1);

df1 = sign(y-y1);
df2 = sign(y-y2);

z1 = df1 > thr & df2 > thr;
z2 = df1 < thr & df2 <thr;

% sum(z1)
% sum(z2)

z = z1+z2;
return;