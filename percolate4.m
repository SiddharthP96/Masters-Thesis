function [bp] = percolate4(A)
n=length(A);
m=sum(sum(A))/2;
G=graph(A);
edges=table2array(G.Edges);
q=1;
S=zeros(q,m); F=zeros(q,m);
for i=1:q
    %disp(i)
    g=G;
    order=randperm(m); 
    l=[]; l1=n;
    for j=1:m
        rm=edges(order(j),1:2);
        B=adjacency(g);
        g=rmedge(g,rm(1,1),rm(1,2));
        if max(B(:,rm(1,1))+B(:,rm(1,2)))<2
            j;
            c=conncomp(g); tab=tabulate(c);
            t=tab(:,2);
            l=max(t(t<max(t))); 
            l1=max(t);
        else
            l=l; 
            l1=l1;
        end
        if ~isempty(l)
            S(i,j)=l; 
            F(i,j)=l1; 
            if mod(j,40)==0
           % plot(g); pause;
            end
        end
        end
end
bp=0;
%
xa=arange(m)/m;
figure()
plot(1-xa,sum(F,1))
xlim([0 0.3])
%{
xlim([0 0.3])
figure()
plot(1-xa,sum(F,1),'k-')
xlim([0 1])
%}
%a=S;
for i=1:q
    [~,b]=max(S(i,:));
    bp=bp+m-b;
end
bp=bp/(q*m);

end