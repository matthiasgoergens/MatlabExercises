function T=temperature3(findbeta)
time=(0:1/60:10);
T0=56.2; %intial temperature
T=T0-findbeta*(time);
end