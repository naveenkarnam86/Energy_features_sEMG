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
          m_0 = sqrt(sum(Pk_fft));
          m_2 = sqrt(sum((kvec.^2.*Pk_fft)));
          m_4 = sqrt(sum((kvec.^4.*Pk_fft)));
          avec = log([m_0 m_2 m_4]);
          avec(4) = log(m_0/(sqrt((m_0-m_2)*(m_0-m_4))));  % sparseness
          avec(5) = log(m_2/sqrt(m_0*m_4));
          
       idata = avec;
    feats_10ch = [feats_10ch  idata(:)'];
    end
    feats_data(nx,:) = feats_10ch;
end


