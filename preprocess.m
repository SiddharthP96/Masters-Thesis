function [A] = preprocess(Z)
n=length(Z);
d=sum(Z);
%to make matrix symmetric and remove (make connections randomly) nodes with zero degree
A=Z;
A=A+A';
A=abs(A);
A=A>0;
for i=1:n
    if d(i)==0
        A(i,randi(10))=1;
        A(randi(n),i)=1;
    end
end
for i=1:n
    A(i,i)=0;
end
end
