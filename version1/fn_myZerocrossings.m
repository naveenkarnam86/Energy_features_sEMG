function [c, z] = fn_myZerocrossings(y)
% Positive-slope zero-crossing detector
z1 = and((y > 0), not(circshift((y > 0), 1))); 
z2= and((y < 0), not(circshift((y < 0), 1))); 
z1(1) = 0;
z2(1) = 0;
z.z1 = z1;
z.z2 = z2;
c1 = find(z1);
c2 = find(z2);
c.c1 = c1;
c.c2 = c2;
return;
