fi = fopen('Network143.txt','r');
weight=0;
if weight==1
    f='%e %e %e';
    s=[3 Inf];
end
if weight==0
    f='%e %e';
    s=[2 Inf];
end

A=fscanf(fi,f,s);
A=A(1:2,:); A=A';
m=length(A); n=max(max(A));
Z=zeros(n);
for i=1:m
    Z(A(i,1),A(i,2))=1; 
    Z(A(i,2),A(i,1))=1;
end
for i=1:n
    Z(i,i)=0;
end

G=graph(Z);
p=plot(G,'-','NodeLabel',{})
G.Nodes.NodeColors = degree(G);
p.NodeCData = G.Nodes.NodeColors;