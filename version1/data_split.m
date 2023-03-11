clc
clear 
close all
%%
load data_normalize_raw.mat

% training and testdata building
test_data = [];
test_cl_vec = [];
train_data = [];
train_cl_vec = [];
LenPat = 516;


for cx = 1:52 
    cdata = data_normalize(data_normalize(:,11) == cx,:);
    rws = size(cdata,1);
    Npatterns = floor(rws/LenPat); 
    clear inx2
    inx22  = randi(Npatterns,[1, floor(.2*Npatterns)]);
    Ntst = length(inx22);
    inx2 = sort(inx22,'asc');
    %     clear data_index;
    data_index = [];
    for ix = 1:Ntst
        clear inx2_loc;
        inx2_loc = (inx2(ix)-1)*LenPat+1: inx2(ix)*LenPat;
    data_index = [data_index; inx2_loc(:)];
    end
    test_sample =  cdata(data_index,1:10);
    test_class =   cx*ones(Ntst,1);
    
    t_p_inx = 1:Npatterns;
    t_p_inx(inx2) = [];
    t_data_index = [];
    for jx = 1:(Npatterns-Ntst)
        clear tnx2_loc;
        tnx2_loc = (t_p_inx(jx)-1)*LenPat+1: t_p_inx(jx)*LenPat;
    t_data_index = [t_data_index; tnx2_loc(:)];
    end
%     cdata(data_index,:) = [];
    train_sample = cdata(t_data_index,1:10);
    train_class  = cx*ones(Npatterns-Ntst,1);
    
    % data storage 
    test_data = [test_data;  test_sample];
    test_cl_vec = [test_cl_vec;  test_class(:)];
    
    train_data = [train_data; train_sample];
    train_cl_vec = [train_cl_vec;  train_class(:)];
end

    
    