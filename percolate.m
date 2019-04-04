function [bp] = percolate(A)
n=length(A);
m=sum(sum(A))/2;
B=zeros(n);
G=graph(A);
edges=table2array(G.Edges);
q=10;
S=zeros(q,m);
for i=1:q
    B=zeros(n);
    order=randperm(m);
    for j=1:m
        add=edges(order(j),1:2);
        B(add(1,1),add(1,2))=1; B(add(1,2),add(1,1))=1;
        S(i,j)=max(listdismantle(B));
    end
end

%Pinf and succep are arrays of size m
Pinf=sum(S)/(n*q);
cons=1/(n*n*q);
suscep=zeros(m,1);
for i=1:m
    Su=S(:,i).^2;
    SU=Su-Pinf(i)^2;
    suscep(i)=sum(SU)/Pinf(i);
end
suscep=cons*suscep;
[~,bp]=max(suscep);
bp=bp/m;
end