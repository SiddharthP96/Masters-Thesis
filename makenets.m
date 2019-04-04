par=zeros(600,6);
for i=401:600
    con=1;
    while con==1
        disp(i)
        n=150+randi(150);                              %|Range-
        %r Probability of removing a vertex             |0-0.05  
        %q Probability of removing an edge              |0-0.25
        %a Controls random node addition                |0-1
        %s Controls random internal edge addition       |0-0.2
        %b Controls preferential node addition          |0-1
        %t Controls preferential internal edge addition |0-0.2
        addno=0.55+0.30*rand;
        pref=rand; 
        a=(1-pref)*addno; 
        b=pref*addno;  
        r=0.03*rand; 
        q=0.12*rand;
        added=(1-addno-r-q); 
        preferential=rand; 
        t=(1-preferential)*added;
        s=preferential*added; 
        ed=rand; %The number of edges new nodes have, will depend on ed. Edge density will not directly be affected.
        A=gensynnet(n,ed,r,q,a,s,b,t);
        if max(conncomp(A))==1 
            con=0;
        end
    end    
par(i,1)=r; par(i,2)=q; par(i,3)=a; par(i,4)=s; par(i,5)=b; par(i,6)=t;
s=['s',num2str(i),'.txt'];
fileID = fopen(s, 'w');
E=table2array(A.Edges);
save(s, 'E', '-ascii', '-tabs')
fclose(fileID);

end