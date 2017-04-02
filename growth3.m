function G=growth3(C,Csat)
kg=exp(-8.4); g=1.5;
if C>Csat
    G=kg*(C-Csat)^g;
else
    G=0;
end
end