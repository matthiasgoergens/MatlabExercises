function T=temperature(t)
    beta=15/3600;
    T0=56.2; %intial temperature
    T=T0-beta*(t);
    if T<5;
        T=5;
    end
end