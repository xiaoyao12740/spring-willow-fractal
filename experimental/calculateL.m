function L=calculateL(N)
    syms n;
    L=symsum(1.5^(n-1),n,1,N);
    %上两行等价于L=1*（1-1.5^N）/(1-1.5);
    fprintf('L=%f',L)
end
