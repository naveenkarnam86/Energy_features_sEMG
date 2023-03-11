clc
clear
close all
%%
load test_data_NP52.mat
%%
Nsl = 516;
combo = combnk(1:5,2);

[rws,cols] =size(test_data);

Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:10
    pattern = test_data((nx-1)*Nsl+1:nx*Nsl,clx);
    Freq_abseg = fft(pattern);
          Pk_fft = (abs(fftshift(Freq_abseg))).^2;
          kvec = 1:length(Pk_fft);
          kvec = kvec(:);
          % evaluation of the features from products of all possible  of
        % pairs of moment features 
         for mx = 1:7
              momen(mx) = sqrt(sum(kvec.^(mx-1).*Pk_fft));
          end
          for cvx = 1:10
          cvec(cvx) =   0.5*log(momen(1+combo(cvx,1)))+.5*log(momen(1+combo(cvx,2)));
          end
          idata = cvec;
    feats_10ch = [feats_10ch  idata(:)'];
    end
    feats_data(nx,:) = feats_10ch;
end


