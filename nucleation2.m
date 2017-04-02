function B=nucleation2(C,Csat)
kb=exp(44.5); b=6;
if C>Csat
    B=kb*(C-Csat)^b;
else
    B=0;
end
end