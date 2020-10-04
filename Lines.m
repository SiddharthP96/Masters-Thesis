function [w] = Lines(fi)
    del=' ';
    fid = fopen(fi,'rt');
    tl = fgets(fid);
    nc= numel(strfind(tl,del))+1;
    fclose(fid);
    w=nc-2;
end