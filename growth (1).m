function G=growth(C,Csat)
kg=exp(-17); g=1.5;
if C>Csat
    G=kg*(C-Csat)^g;
else
    G=0;
end
end