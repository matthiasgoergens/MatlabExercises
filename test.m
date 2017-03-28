clear
clc

% uo, u1, u2,u3,u4,C
y=[0 0 0 0 0 0.0414];
h=60;
time=[0:h:36000];
size(time)
C=y(1,6)
for n=2:size(time,2)

f=@(t,u0)(nucleation(C,csat(temperature(time(1,n)))))
y(n,1)=rk4(f,h,time,y(n-1,1));

f=@(t,u1)(growth(C,csat(temperature(time(1,n)))));
y(n,2)=rk4(f,h,time,y(n-1,2));

f=@(t,u2)(growth(C,csat(temperature(time(1,n)))));
y(n,3)=rk4(f,h,time,y(n-1,3));

f=@(t,u3)(growth(C,csat(temperature(time(1,n)))));
y(n,4)=rk4(f,h,time,y(n-1,4));

f=@(t,u4)(growth(C,csat(temperature(time(1,n)))));
y(n,5)=rk4(f,h,time,y(n-1,5));

f=@(t,con)(((3*(1.263*10^3)*(4/3)*pi*growth(C,csat(temperature(time(1,n))))/(1*10^3))*-1));
y(n,6)=rk4(f,h,time,y(n-1,6));
C=y(n,6)

end
plot(time,y(:,6));
function y=rk4(f,h,t,c)

k1=h*f(t,c);
k2=h*f(t+h/2,c+0.5*k1);
k3=h*f(t+h/2,c+0.5*k2);
k4=h*f(t+h/2,c+k3);
y=c+(k1+2*k2+2*k3+k4)/6;    
end
function satconc=csat(T)
satconc=6.59033*10^(-3)*exp(3.27088*(10^-2)*T);
end

function T=temperature(tt)
    beta=15;
    T0=56.2; %intial temperature
    T=T0-beta*(tt);
    if T<5;
        T=5;
    end
end
    