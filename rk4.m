function y=rk4(f,h,t,c)

k1=h*f(t,c);
k2=h*f(t+h/2,c+0.5*k1);
k3=h*f(t+h/2,c+0.5*k2);
k4=h*f(t+h/2,c+k3);
y=c+(k1+2*k2+2*k3+k4)/6;    
end