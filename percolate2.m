function [bp] = percolate2(A)
n=length(A);
m=sum(sum(A))/2;
B=zeros(n);
G=graph(A);
edges=table2array(G.Edges);
q=100;
S=zeros(q,m);
for i=1:q
    B=zeros(n);
    g=graph(B);
    order=randperm(m); 
    for j=1:m
        add=edges(order(j),1:2);
        g=addedge(g,add(1,1),add(1,2),1);
        S(i,j)=listdis(g);
    end
end
bp=0;
%a=S;
for i=1:q
    [~,b]=max(S(i,:));
    bp=bp+b;
end
bp=bp/(q*m);

end