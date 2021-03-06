function [mps] = createrandommps(para)
%Creat random MPS as the starting point for variation
L=para.L;
D=para.D(end);
d_opt=para.d_opt;

mps = cell(1, L);

if para.parity=='n'
    mps{1} = randn(1,D,para.d_opt(1))./D;
    mps{L} = randn(D,1,para.d_opt(L))./D;
    for i = 2:(L - 1)
        mps{i}=randn(D,D,para.d_opt(i))./D;
    end
else
    mps{1} = zeros(1, D, d_opt(1));
    if para.parity=='e'
        mps{1}(1,1:D/2,1:d_opt(1)/2) = randn(1,D/2,d_opt(1)/2)./(D/2);
        mps{1}(1,D/2+1:D,d_opt(1)/2+1:end) = randn(1,D/2,d_opt(1)/2)./(D/2);
    else
        mps{1}(1,D/2+1:end,1:d_opt(1)/2) = randn(1,D/2,d_opt(1)/2)./(D/2);
        mps{1}(1,1:D/2,d_opt(1)/2+1:end) = randn(1,D/2,d_opt(1)/2)./(D/2);
    end
    
    mps{L} = zeros(D, 1, d_opt(L));
    mps{L}(1:D/2,1,1:d_opt(L)/2) = randn(D/2,1,d_opt(L)/2)./(D/2);
    mps{L}(D/2+1:D,1,d_opt(L)/2+1:end) = randn(D/2,1,d_opt(L)/2)./(D/2);
    
    for i = 2:(L - 1)
        mps{i} = zeros(D, D, d_opt(i));
        for s=1:d_opt(i)/2
            mps{i}(1:D/2,D/2+1:D,s)=randn(D/2,D/2)./(D/2);
            mps{i}(D/2+1:D,1:D/2,s)=randn(D/2,D/2)./(D/2);
        end
        for s=d_opt(i)/2+1:d_opt(i)
            mps{i}(1:D/2,1:D/2,s)=randn(D/2,D/2)./(D/2);
            mps{i}(D/2+1:D,D/2+1:D,s)=randn(D/2,D/2)./(D/2);
        end
    end
end


end
