clear all
clc
a=2
T=100
M=400
lamda=0.96
teta0=zeros(4,1)
P0=1000*eye(4)
%yr(k)
for k=1:T/2
    yr(k)=a;
end
for k=1+T/2:T
    yr(k)=-a;
end
for k=1+T:M
    yr(k)=yr(k-T);
end
b1=0.2827
b2=0.2045
a1=-1.2864
a2=-0.5422
s1=0.1244
y(1)=0;
y(2)=0;
y(3)=0;
a1i(1)=a1
a1i(2)=a1
a1i(3)=a1
u(1)=0
u(2)=0
u(3)=0


%e(k)
v=8.8
x=rand(M,1)
e=(x-mean(x))/v
var(e)


for k=4:M-2
   a1i(k)=a1
   a2i(k)=a2
    b1i(k)=b1
     b2i(k)=b2
    if ((k >100 )&&(k<301))
        a1i(k)=-1.0426
    end
    %RLS avec facteur d'oubli
   y(k)= -a1i(k)*y(k-1)-a2*y(k-2)+b1*u(k-2)+b2*u(k-3)+e(k)
   psy=[-y(k-1) ;-y(k-2);u(k-2);u(k-3)]
   P1=(1/lamda)*(P0-((P0*psy*psy'*P0)/(lamda+psy'*P0*psy)))
   eps(k)=y(k)-teta0'*psy
   teta1=teta0+P1*psy*eps(k)
   a1esti(k)=teta1(1)
   a2esti(k)=teta1(2)
   b1esti(k)=teta1(3)
   b2esti(k)=teta1(4)
   P0=P1;
   teta0=teta1
   
   %loi de commande
   S=1+s1
   f1(k)=s1-a1esti(k)
   g0(k)=-a1esti(k)*f1(k)-a2esti(k)
   g1(k)=-a2esti(k)*f1(k)
   %F(k)=1+f1(k)
  % G(k)=g0(k)+g1(k)
   h1(k)=b1esti(k)
   if h1(k)==0
      h1(k)=b1 
   end
   h2(k)=b1esti(k)*f1(k)+b2esti(k)
   h3(k)=b2esti(k)*f1(k)
   H(k)=h1(k)+h2(k)+h3(k)
   u(k)=(1/h1(k))*(-h2(k)*u(k-1)-h3(k)*u(k-2)-g0(k)*y(k)-    g1(k)*y(k-1)+yr(k+2)+s1*yr(k+1))
   h(k)=y(k)-yr(k)
    
end
%traçage du courbe
figure(1)
subplot(3,3,1)
plot(u,'r','linewidth',2)
grid on
ylabel('u')
title('loi de commande u(k)')

 subplot(3,3,2)
plot(y,'r','linewidth',2)
hold on
plot(yr,'b','linewidth',2)
grid on
ylabel('y')
legend('y','yr')
title('la sortie y(k)')

 subplot(3,3,3)
plot(h,'r','linewidth',2)
grid on
ylabel('h')
title('erreur de poursuite h(k)')

 subplot(3,3,4)
plot(eps,'r','linewidth',2)
grid on
ylabel('eps')
title('erreur de prédiction eps(k)')

 subplot(3,3,5)
plot(a1i,'r','linewidth',2)
hold on
plot(a1esti,'b','linewidth',2)
grid on
ylabel('y')
legend('a1','a1-estimé')
title('parametre a1')

 subplot(3,3,6)
plot(a2i,'r','linewidth',2)
hold on
plot(a2esti,'b','linewidth',2)
grid on
ylabel('y')
legend('a2','a2-estimé')
title('parametre a2')

 subplot(3,3,7)
plot(b1i,'r','linewidth',2)
hold on
plot(b1esti,'b','linewidth',2)
grid on
ylabel('y')
legend('b1','b1-estimé')
title('parametre b1')

 subplot(3,3,8)
plot(b2i,'r','linewidth',2)
hold on
plot(b2esti,'b','linewidth',2)
grid on
ylabel('y')
legend('b2','b2-estimé')
title('parametre b2')

