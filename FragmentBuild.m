clear all
close all

FragmentLength = 1000;
UnitRegionSize = 100000;

[Head Seq] = fastaread('chromFA/chr22.fa');

fid = fopen(['DomainStartsAndEnds.txt'], 'r');
tline = fgetl(fid);
i = 0;
while ischar(tline)
    i = i+1;
    C = strsplit(tline);
    DomainStart(i) = str2num(C{2});
    DomainEnd(i) = str2num(C{3});
    tline = fgetl(fid);
end
fclose(fid);

for i = 1:length(DomainStart)
    DomainCenter(i) = (DomainStart(i)+DomainEnd(i))/2;
    
    if DomainCenter(i)-UnitRegionSize/2 >= DomainStart(i)
        RegionStart(i) = DomainCenter(i)-UnitRegionSize/2;
    else
        RegionStart(i) = DomainStart(i);
    end
    
    if DomainCenter(i)+UnitRegionSize/2 <= DomainEnd(i)
        RegionEnd(i) = DomainCenter(i)+UnitRegionSize/2;
    else
        RegionEnd(i) = DomainEnd(i);
    end
    
    Domain{i} = Seq(round(RegionStart(i)):round(RegionEnd(i)));
end


for i = 1:length(DomainStart)
    for j = 1:floor(length(Domain{i})/FragmentLength)
        data(j).Sequence = Domain{i}((j-1)*FragmentLength+1:j*FragmentLength);
        data(j).Header = ['Domain' num2str(i) 'Frag' num2str(j)];
    end
    fastawrite(['1kb_fragments_sequence' num2str(i) '.fasta'], data);
    clear data
end


        