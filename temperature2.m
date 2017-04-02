function T=temperature2(t)
    beta=15/3600;
    T0=56.2; %intial temperature
    T=max(5, T0-beta*(t));
end