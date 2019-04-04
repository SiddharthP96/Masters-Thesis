function [Z] = makeER(n,p)
z=rand(n);
Z=triu(z);
Z=Z+Z';
Z=Z>p;
for i=1:n
    Z(i,i)=0;
end
end
