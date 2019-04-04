function [A] = gensynnet(size,den,r,q,a,s,b,t)
%series of functions to implement the network evolution model in the paper,
%'Uncovering the role of elementary processes in network evolution'. All
%functions take a graph (object) as input and work on inbuilt matlab graph functions.
if r+q+a+s+b+t-1 > 0.001
    disp("Error! Parameters don't add up to one!");
end
%disp('code to generate better synthetic networks');
%parameters
A=graph(makeER(25,0.75));
nsize=length(full(adjacency(A)));
%r=0.025;%r Probability of removing a vertex
%q=0.325;%q Probability of removing an edge
%a=0.25;%a Controls random node addition
%s=0.05;%s Controls random internal edge addition
%b=0.30;%b Controls preferential node addition
%t=0.05;%t Controls preferential internal edge addition
maindi=zeros(6,1);
maindi(1,1)=r; maindi(2,1)=q+maindi(1,1); maindi(3,1)=maindi(2,1)+a; maindi(4,1)=maindi(3,1)+s; maindi(5,1)=maindi(4,1)+b; maindi(6,1)=maindi(5,1)+t; 
iterations=0;
while nsize<size
    iterations=iterations+1;
    nsize=length(adjacency(A));
    pr=rand;
    
    i=1;
    while pr>maindi(i)
        i=i+1;
    end
    do=i;
    if i==1
        A=removerandnode(A);
        
    end
    if i==2
        A=removerandedge(A);
    end
    if i==3
        max_edges=min(round(den*10),nsize);
        if max_edges==0
            max_edges=max_edges+1;
        end
        edges=randi(max_edges);
        A=addnoderand(A,edges);
       
    end
    if i==4
        A=addedgeintrand(A);
    end
    if i==5
        max_edges=min(round(den*10),nsize);
        if max_edges==0
            max_edges=max_edges+1;
        end
        edges=randi(max_edges);
        A=addnodepref(A,edges);
        
    end
    if i==6
        A=addedgeintpref(A);
    end
    
end


%p=plot(A,'-','NodeLabel',{})
%A.Nodes.NodeColors = degree(A);
%p.NodeCData = A.Nodes.NodeColors;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%Internal addition of new edge with preferential attachment

function [G] = addedgeintpref(g)
G=g;
A=g;
Z=full(adjacency(A));
n=length(adjacency(A));

d=sum(Z)/sum(sum(Z));

di=zeros(n,1);
di(1)=d(1);
for i=2:n
    di(i)=di(i-1)+d(i);
end

i1=randi(n);
j=rand;
i=1;
while j>di(i)
    i=i+1;
end
j1=i;
Z=adjacency(A);

if Z(i1,j1)==0 && i1~=j1
    G = addedge(A,i1,j1);
end

end


%Internal addition of new edge with random attachment
function [G] = addedgeintrand(g)
G=g;
A=g;
Z=full(adjacency(A));
n=length(adjacency(A));
i=randi(n); j=randi(n);
while i==j
    i=randi(n);
end
if Z(i,j)==0 
    G = addedge(A,i,j);
end
end


%new node with preferential attachment and m edges
function [G] = addnodepref(g,m)
if m==0
    m=m+1;
end
G=g;
A=g;
n=length(adjacency(A));
A=addnode(A,1);
Z=full(adjacency(A));
d=sum(Z)/sum(sum(Z));
di=zeros(n,1);
di(1)=d(1);
for i=2:n
    di(i)=di(i-1)+d(i);
end
iter=0;
while iter<m
    i=1;
    j=rand;
    while j>di(i)
        i=i+1;
    end
    if Z(n+1,i)==0
        A = addedge(A,n+1,i); iter=iter+1; Z=full(adjacency(A));
    end
end
G=A;
end

%new node with random attachment and m edges
function [G] = addnoderand(g,m)
if m==0
    m=m+1;
end

G=g;
A=g;
n=length(adjacency(A));
A=addnode(A,1);
Z=full(adjacency(A));
iter=0;
while iter<m
    j=randi(n);
    if Z(n+1,j)==0
        A = addedge(A,n+1,j); iter=iter+1; Z=full(adjacency(A));
    end
end
G=A;
end

%Internal removal of existing edge 
function [G] = removerandedge(g)
ed=sum(sum(full(adjacency(g))));
G=rmedge(g,randi(ed/2));
end
%Internal removal of existing node

function [G] = removerandnode(g)
n=length(adjacency(g));
G=rmnode(g,randi(n));
end
end