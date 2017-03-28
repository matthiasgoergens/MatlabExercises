function B=nucleation(C,Csat)


kb=44.5;b=6;
if C>Csat
    B=kb*(C-Csat)^b;
else
    B=0;
end
end