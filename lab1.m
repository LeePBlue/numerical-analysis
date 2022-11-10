%实验1-2, 文件名experiment1.m，不同的递推方法求积分，并画积分曲线图
clc,format compact
N=20;
I=zeros(3,N);   %3行N列，初值为0，第一行正向递推，第二行可当做真值，第三行逆推
I0=1-exp(-1);
I(1,1)=1-I0;
f=@(x) x.^1.*exp(x-1);
I(2,1)=integral(f,0,1);
for n=2:N
    I(1,n)=  1 - n*I(1,n-1)         ; %正推法
    f=@(x) x.^n.*exp(x-1);
   I(2,n)=integral(f,0,1);%真值近似值
end
%逆推法
In1=   0       ;     %估计I(21)的值,提示： 
I(3,N)=(1-In1)/(N+1);
for n=N-1:-1:1     %依次倒推至I(1)的值，也可到I(15)结束
    I(3,n)=    (1-I(3,n+1))/(n+1)  ;  %提示：
end
%画积分曲线图，n取值2,5,8
x= 0: 0.01   : 1;   %画图本质是取点，横坐标取值越密，则越光滑，同时计算量增加
y1=x.^2.*exp(x-1);
y2=x.^5.*exp(x-1);
y3=x.^8.*exp(x-1);
plot(x,y1,x,y2,'-.',x,y3,'*') %画出该积分对应的几何图形
legend('n=2','n=5','n=8'),grid on,xlabel('定积分 0-1'),ylabel('In')
title('积分对应的几何含义图形')