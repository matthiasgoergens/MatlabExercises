function G=growth2(C,Csat,kg)
 g=1.5;
if C>Csat
    G=kg*(C-Csat)^g;
else
    G=0;
end
 end

