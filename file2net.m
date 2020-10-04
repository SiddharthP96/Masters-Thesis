st='Rw (155).txt';
fi = fopen(st,'r');
weight=Lines(st);
if weight==2
    f='%e %e %e %e';
    s=[4 Inf];
end
if weight==1
    f='%e %e %e';
    s=[3 Inf];
end
if weight==0
    f='%e %e';
    s=[2 Inf];
end
%4 7 8 14 16 24-29 31 33-36 38 39 44-46 51 53 54 59-60  64 66 67 69 77 102
%120 
%117 121 129-139 143 145-147 
A=fscanf(fi,f,s);
A=A(1:2,:); A=A';
m=length(A); n=max(max(A));
Z=zeros(n);
if min(A)==0
    A=A+1;
end
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