function [u0,u1,u2,u3,u4,C0]=task3rk4(d)

tspan=[0:60:36000];
h=60; %seconds

u0(1)=0;
u1(1)=0;
u2(1)=0;
u3(1)=0;
u4(1)=0;

C0(1)= 6.59033*10^(-3)*exp(3.27088*(10^-2)*56.2);
C=C0(1);
% SAT = csat(tspan./3600);


for i=2:size(tspan,2)
    t=tspan(i-1);
    
    %for u0
    f=@(t,y) nucleation2(C,csat(temperature3(d)));
    k1=h*f(t,u0(1,i-1));
    k2=h*f(t+h/2,u0(1,i-1)+1/2*k1);
    k3=h*f(t+h/2,u0(1,i-1)+1/2*k2);
    k4=h*f(t+h/2,u0(1,i-1)+k3);
    u0(1,i)=u0(1,i-1)+h+1/6*(k1+(2*k2)+(2*k3)+k4);
    
    %for u1
    f=@(t,y)(growth3(C,csat(temperature3(d)))*u0(i-1));
    k1=h*f(t,u1(1,i-1));
    k2=h*f(t+h/2,u1(1,i-1)+1/2*k1);
    k3=h*f(t+h/2,u1(1,i-1)+1/2*k2);
    k4=h*f(t+h,u1(1,i-1)+k3);
    u1(1,i)=u1(1,i-1)+1/6*(k1+(2*k2)+(2*k3)+k4);
    
    %for u2
    f=@(t,y) growth3(C,csat(temperature3(d)))*u1(i-1)*2;
    k1=h*f(t,u2(1,i-1));
    k2=h*f(t+h/2,u2(1,i-1)+1/2*k1);
    k3=h*f(t+h/2,u2(1,i-1)+1/2*k2);
    k4=h*f(t+h,u2(1,i-1)+k3);
    u2(1,i)=u2(1,i-1)+1/6*(k1+(2*k2)+(2*k3)+k4);

    %for u3
    f=@(t,y) growth3(C,csat(temperature3(d)))*u2(i-1)*3;
    k1=h*f(t,u3(1,i-1));
    k2=h*f(t+h/2,u3(1,i-1)+1/2*k1);
    k3=h*f(t+h/2,u3(1,i-1)+1/2*k2);
    k4=h*f(t+h,u3(1,i-1)+k3);
    u3(1,i)=u3(1,i-1)+1/6*(k1+2*k2+2*k3+k4);

    %for u4
    f=@(t,y) growth3(C,csat(temperature3(t)))*u3(i-1)*4;
    k1=h*f(t,u4(1,i-1));
    k2=h*f(t+h/2,u4(1,i-1)+1/2*k1);
    k3=h*f(t+h/2,u4(1,i-1)+1/2*k2);
    k4=h*f(t+h,u4(1,i-1)+k3);
    u4(1,i)=u4(1,i-1)+1/6*(k1+2*k2+2*k3+k4);

    %for conc
    f=@(t,y)(((3*(1.263*10^3)*(4/3*pi)*growth3(C,csat(temperature3(d)))*u2(i))/((1*10^3))*-1));
    k1=h*f(t,C0(1,i-1));
    k2=h*f(t+h/2,C0(1,i-1)+1/2*k1);
    k3=h*f(t+h/2,C0(1,i-1)+1/2*k2);
    k4=h*f(t+h,C0(1,i-1)+k3);
    C0(1,i)=C0(1,i-1)+1/6*(k1+2*k2+2*k3+k4);
    C=C0(i);
end

end


