

clc
clear
close all

%%

ch_index = [1,2,21:24,61:64];

for ix = 1:10
    omit_ch(ix).index = ch_index;
    
    ch_index(1:2) = ch_index(1:2)+2;
    ch_index(3:6) = ch_index(3:6) + 4;
    ch_index(7:10) = ch_index(7:10) + 4;
    
    disp(omit_ch(ix));
end

% disp(omit_ch);