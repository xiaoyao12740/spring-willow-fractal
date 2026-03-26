function plotcfyl(N)%绘制N层sita为210时的春风杨柳分形图形
st=input('请输入左枝逆时针旋转角度：');
ph=input('请输入右枝逆时针旋转角度：');
Wb=[0 0;0 1];
plot(Wb(1,:),Wb(2,:),'g','LineWidth', 2);
hold on
axis equal
Wb_set=Wb;%用于存储第N层的春风杨柳
phi=(ph/180)*pi-pi;%右枝逆时针旋转角度
sita=(st/180)*pi-pi;%左枝逆时针旋转角度
rotR=[cos(phi),-sin(phi);sin(phi),cos(phi)];
rotL=[cos(sita),-sin(sita);sin(sita),cos(sita)];
for k=2:N
    midWRb_set=[];%用于存储下一对右子枝
    midWLb_set=[];%用于存储下一对左子枝
    for b=1:2:length(Wb_set)%b为每个点的起始位置
        B=3/5*rotR*Wb_set(:,b:b+1);
        A=9/10*rotL*Wb_set(:,b:b+1);
        midWRb_set=[midWRb_set,A,B];
        D=A+Wb(:,b+1);
        E=B+Wb(:,b+1);
        midWLb_set=[midWLb_set,D,E];
        plot(D(1,:),D(2,:),'g','LineWidth', 2)
        plot(E(1,:),E(2,:),'g','LineWidth', 2)
    end
    Wb_set=midWRb_set;
    Wb=midWLb_set;
end