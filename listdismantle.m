function [L] = listdismantle(A)
%INPUT: Adjacency Matrix | OUTPUT: List of Connected Components
%Example: A (for a disconnected graph with 3 components)-->[10, 15, 25]
n = length(A);
G=graph(A);
c=conncomp(G);
L=zeros(max(c),1);
for i=1:n
    for k=1:max(c)
        if c(i)==k
            L(k)=L(k)+1;
        end
    end
end
end

