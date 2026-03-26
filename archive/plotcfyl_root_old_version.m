function plotcfyl(N)%绘制n层春风杨柳分形图形
Wb=[0 0 0;0 1 0];
plot(Wb(1,:),Wb(2,:),'g');
hold on
axis equal
Wb_set=Wb;%用于存储第N层的春风杨柳，每3个点一个枝杈
phi=5/6*pi;
rotR=[cos(phi),-sin(phi);sin(phi),cos(phi)];
rotL=[cos(sita),-sin(sita);sin(sita),cos(sita)];
for k=2:N
    midWb_set=[];%用于存储下一个阶次的春风杨柳集合
    for b=2:3:length(Wb_set)%b为每个点的起始位置
        midWb=Wb_set(:,b:b+3);%对母枝进行扩展。
        A=midWb(:,1);B=midWb(:,2);C=midWb(:,3);%给出最初的母枝
        %下面生成E点
        BC=B-C;
        BE=3/5*rotR*BC;
        E=BE+B;
        %下面生成I点
        BI=4/5*rotL*BC;
        I=BI+B;
        %分别由BE、BI扩展出两个子枝
        [A1,B1,C1]=calRWb(B,E,rotR);
        [A2,B2,C2]=calLWb(B,I,rotL);
        ABC1=[A1,B1,C1,A1];
        ABC2=[A2,B2,C2,A2];
        midWb_set=[midWb_set,ABC1,ABC2];
        %画出两个子枝
        plot(ABC1(1,:),ABC1(2,:),'g');
        plot(ABC2(1,:),ABC2(2,:),'g');
    end
    Wb_set=midWb_set;
end
function[D E F]=calRWb(A,B,rotR)
%该函数用于计算右子枝
D=B;
F=D;
BA=B-A;
DE=3/5*rotR*BA;
E=DE+D;
end
function[H I G]=calLWb(A,B,rotR)
%该函数用于计算左子枝
H=B;
G=H;
BA=B-A;
HI=4/5*rotL*BA;
I=HI+H;
end
end