function L=zhijie(N)
%直接运算
    syms n;
    L = symsum(1.5^(n-1), n, 1, N);
%上两行等价于L=1*（1-1.5^N）/(1-1.5);
    fprintf('该层数下直接计算的长度L=%f\n',L);

end