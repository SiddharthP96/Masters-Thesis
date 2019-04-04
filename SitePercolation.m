%Site Percolation of an ER network
M=Z2;
m=length(M);
A=zeros(m-20,3);
for i=1:(m-20)
    a=randi(m-i+1); 
    M=delnode(M,a);
    mloc=length(M);
    A(i,:)=[i 1-cost(listdismantle(M)) max(listdismantle(M))/mloc];
end
plot(A(:,1),A(:,3));