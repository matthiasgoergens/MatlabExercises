%Temperature profile

clear
clc

beta=15;
T0=56.2; %intial temperature
time=(0:1/60:10);
for n=1:length(time)
    T(n)=T0-beta*(time(n))
    if T(n)<5;
        T(n)=5;
    end
end
plot(time,T)
xlabel('Time')
ylabel('Temperature')
title('Temperature Profile')

