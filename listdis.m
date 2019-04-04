function [l] = listdis(G)
%INPUT: Graph | OUTPUT: Size of second largest component
%Example: A (for a disconnected graph with 3 components)-->[10, 15, 25]
n=length(adjacency(G));
c=conncomp(G);
L=zeros(max(c),1);
for i=1:n
    for k=1:max(c)
        if c(i)==k
            L(k)=L(k)+1;
        end
    end
end
[~,mx]=max(L);
L(mx)=0;
l=max(L);
end