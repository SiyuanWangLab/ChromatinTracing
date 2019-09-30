function yy = readOligos(FileName)
% read oligo list from oligos.txt files
fid = fopen(FileName, 'r');
tline = fgetl(fid);
i = 1;
while ischar(tline)
    C = strsplit(tline);
    if length(C) <= 14
        Oligo(i).Sequence = C{end};
        Oligo(i).Header = C{1};
        A = findstr(C{1}, 'Frag');
        Oligo(i).DomainID = str2num(C{1}(7:A(1)-1));
        Oligo(i).FragID = str2num(C{1}(A(1)+4:end));
        i = i+1;
    end
    tline = fgetl(fid);
end
fclose(fid);
yy = Oligo;