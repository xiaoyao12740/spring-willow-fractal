function plotcfyl(N)%绘制N层sita为210时的春风杨柳分形图形
Wb=[0 0;0 1];
plot(Wb(1,:),Wb(2,:),'g');
hold on
axis equal
Wb_set=Wb;%用于存储第N层的春风杨柳
phi=5/6*pi;%右枝逆时针旋转角度定值
sita=7/6*pi;%左枝逆时针旋转角度
rotR=[cos(phi),-sin(phi);sin(phi),cos(phi)];
rotL=[cos(sita),-sin(sita);sin(sita),cos(sita)];
for k=2:N
    midWb_set=[];%用于存储下一个阶次的春风杨柳集合
    for b=1:2:length(Wb_set)%b为每个点的起始位置
        midWb=Wb_set(:,b:b+1);%对母枝进行扩展。
        C=midWb(:,2);D=midWb(:,1);%给出最初的母枝
        %下面生成右叉末端A点
        CD=D-C;
        CD=3/5*rotR*CD;
        A=CD+C;
        %下面生成左叉末端B点
        BC=9/10*rotL*CD;
        B=BC+C;
        if N>2
        %分别由CD扩展出两个子枝
        [A1,B1]=calWRb(C,D,rotR);
        [A2,B2]=calWLb(C,D,rotL);
        midWRb_set=[];
        midWLb_set=[];
        AEF1=[A1,B1];
        AEF2=[A2,B2];
        midWRb_set=[midWb_set,AEF1];
        midWLb_set=[midWb_set,AEF2];
        %画出两个子枝
        plot(AEF1(1,:),AEF1(2,:),'g');
        plot(AEF2(1,:),AEF2(2,:),'g');
        else
            midWb_set=[midWb_set,A,C,B];
            midWRb_set=midWb_set;
            midWLb_set=midWb_set;
            plot(midWb_set(1,:),midWb_set(2,:),'g');
        end
    end
    Wb_set=midWRb_set;
    Wb=midWLb_set;
end
function [A1,B1]=calWRb(C,D,rotR)
%该函数用于计算子枝
A1=C;
CD=D-C;
CB1=3/5*rotR*CD;
B1=CB1+C;
end
function [A2,B2]=calWLb(C,D,rotL)
%该函数用于计算子枝
A2=D;
CD=D-C;
CB2=9/10*rotL*CD;
B2=CB2+C;
end
end
