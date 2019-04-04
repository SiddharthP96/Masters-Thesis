function [Z] = MakePR(n,d)
seed=makeER(15,0.5);
Z=SFNG(n,d,seed);
Z=logical(Z);
for i=1:n
    Z(i,i)=0;
end
end
