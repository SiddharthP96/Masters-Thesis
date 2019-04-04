for i=1:100
    disp(i)
    n=200+randi(100);
    p=3+randi(6);
    A=MakePR(n,p);
    m=sum(sum(A))/2;
    G=graph(A);
    edges=table2array(G.Edges);
    s=['pr',num2str(i+100),'.txt'];
    fileID = fopen(s, 'w');
    save(s, 'edges', '-ascii', '-tabs')
    fclose(fileID);
end