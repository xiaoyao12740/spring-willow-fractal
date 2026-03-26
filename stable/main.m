%main
N=input('请输入所需的春风杨柳分形层数：');
while N<=0
    disp('输入的层数不合理，请重新输入');
    N=input('请输入所需的春风杨柳分形层数：');
end
     plotcfyl(N)
     zhijie(N)
     cycle(N)