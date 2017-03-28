function T=temperature1(tt)
    beta=15;
    T0=56.2; %intial temperature
    T=T0-beta*(tt);
    if T<5;
        T=5;
    end
end