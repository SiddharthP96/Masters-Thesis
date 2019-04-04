for i=1:100
    disp(i)
    n=150+randi(100);
    %p=rand;
    k=randi(2);
    G=graph(MakePR(n,k));
    A=table2array(G.Edges);
    s=['prl',num2str(i),'.txt'];
    fileID = fopen(s, 'w');
    save(s, 'A', '-ascii', '-tabs')
    fclose(fileID);
end