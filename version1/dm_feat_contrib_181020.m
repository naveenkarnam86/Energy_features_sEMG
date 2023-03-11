clc
clear
clear all

load res00_sbe_fknn_181020.mat;

L = length(res);

for l = 1:L
    acc_vec(l) = res(l).cros_acc;
    tsa_vec(l) = res(l).test_acc;
    
end

disp(mean(tsa_vec));

load res01_mav_sbe_fknn_181020.mat

L = length(res);

for l = 1:L
    acc_vec(l) = res(l).cros_acc;
    tsa_vec(l) = res(l).test_acc;
end

disp(mean(tsa_vec));
