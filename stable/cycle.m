function L=cycle(N)
%机器循环计算
    L=0;
    for i=0:N-1
        L=L+1.5^i;
    end
    fprintf('该层数下机器循环计算的长度L=%f\n',L);
end