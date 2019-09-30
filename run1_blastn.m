clear all
close all
Universal_l = 'CCCGCGTTAACCATACACCG';%ab20_583
Universal_r = 'GGTAGCCACACGCTTCGATG';%ab20_858
Secondary{1} = 'CGCAACGCTTGGGACGGTTCCAATCGGATC'; %B01
Secondary{2} = 'CGAATGCTCTGGCCTCGAACGAACGATAGC'; %B02
Secondary{3} = 'ACAAATCCGACCAGATCGGACGATCATGGG'; %B03
Secondary{4} = 'CAAGTATGCAGCGCGATTGACCGTCTCGTT'; %B04
Secondary{5} = 'AAGTCGTACGCCGATGCGCAGCAATTCACT'; %B06
Secondary{6} = 'CGAAACATCGGCCACGGTCCCGTTGAACTT'; %B07
Secondary{7} = 'ACGAATCCACCGTCCAGCGCGTCAAACAGA'; %B08
Secondary{8} = 'CGCGAAATCCCCGTAACGAGCGTCCCTTGC'; %B09
Secondary{9} = 'GCATGAGTTGCCTGGCGTTGCGACGACTAA'; %B10
Secondary{10} = 'CCGTCGTCTCCGGTCCACCGTTGCGCTTAC'; %B11
Secondary{11} = 'GGCCAATGGCCCAGGTCCGTCACGCAATTT'; %B12
Secondary{12} = 'TTGATCGAATCGGAGCGTAGCGGAATCTGC'; %B13
Secondary{13} = 'CGCGCGGATCCGCTTGTCGGGAACGGATAC'; %B14
Secondary{14} = 'GCCTCGATTACGACGGATGTAATTCGGCCG'; %B15
Secondary{15} = 'GCCCGTATTCCCGCTTGCGAGTAGGGCAAT'; %B16
Secondary{16} = 'GCGGGAAGCACGTGGATTAGGGCATCGACC'; %B17
Secondary{17} = 'ATTTGCGTGCCGTGCTAGCCGTTGTTATGG'; %B18
Secondary{18} = 'GGACACGGGATCGACGGTAGTGGATCGATT'; %B19
Secondary{19} = 'CGACCTTAGGTTCCGCGTCATGTACCGGTT'; %B20
Secondary{20} = 'TGTTTACGACGTGGGCTGCTGCGATTTCAC'; %B21
Secondary{21} = 'GGGAAACGGTTGTCGCTACCGGCTTTGCTA'; %B22
Secondary{22} = 'GATGGTCGACTGGCGGTCTTAATATGCCCA'; %B23
Secondary{23} = 'ATCCATATGACCGGCGGCCTTTTCTCGGAC'; %B24
Secondary{24} = 'ATGATCCACGACCGAGCAGGTTAGTTGACG'; %B25
Secondary{25} = 'TAGACGCACCACGCTCGACAAGAACAGGAC'; %B26
Secondary{26} = 'ACTCGTTTAACGGCCGGTTGGTCTACGGAT'; %B27
Secondary{27} = 'GGGTACTCGCGTCTGGAACGACGGATTCAG'; %B28
Secondary{28} = 'AACATCGGATCGGTGCGGTGGGATGGATAA'; %B29
Secondary{29} = 'AGACGACGCACGTTCGTACCGCGTACTTCG'; %B30
Secondary{30} = 'TTTGCTCGCAAGTGCGCACGAGTTGAACTG'; %B31
Secondary{31} = 'CCAATGTACCTCGCCGCGTTTAGACGGGCT'; %B32
Secondary{32} = 'AGTTTCCATACGCGGCGTGAATATCGCGGC'; %B33
Secondary{33} = 'GCTACAGCGTTACGGGCCCAGACGTTTCAT'; %B34
Secondary{34} = 'TTTATCGTGCGTGTCCGCCAGTACCGTGAG'; %B35


% B05 is not good.

OutputFasta = [];
for ii = 1:27
    Oligos{ii} = readOligos(['oligos' num2str(ii) '.txt']);
    N = length(Oligos{ii});

    figure(1)
    subplot(7,5,ii)
    plot(1:N, [Oligos{ii}.FragID])
    
    for i = 1:N
        Oligos{ii}(i).Header = ['Oligo' num2str(i)];
    end

    fastawrite(['oligos' num2str(ii) '.fasta'], Oligos{ii});

    system(['blastn -query oligos' num2str(ii) '.fasta -db hg18.fa -out BLAST_output' num2str(ii) '.txt'])
    
    fid = fopen(['BLAST_output' num2str(ii) '.txt'], 'r');
    tline = fgetl(fid);
    i = 1; % oligo number
    n = 0; % line number
    while ischar(tline)
        n = n+1;
        if strcmp(tline, ['Query= Oligo' num2str(i)])
            Line(i) = n; % this records the line number for oligo name oligoi
            i = i+1;
        end
        tline = fgetl(fid);
    end
    fclose(fid);
    Line(i) = n-8;
    dLine = Line(2:end)-Line(1:end-1);
    
    j = 0;
    for i = 1:N
        if dLine(i) == 32
            j = j+1;
            GoodOligo(j) = Oligos{ii}(i);
        end
    end
    
    NumGoodOligo = length(GoodOligo) % this number needs to be bigger than 1000.
    if NumGoodOligo<1000
        display('Error: NumGoodOligo less than 1000');
    else
        display('NumGoodOligo more than 1000');
    end
    IDofChozenOligo = ceil((NumGoodOligo/1000)*(1:1000));
    if IDofChozenOligo(1000)>NumGoodOligo
        IDofChozenOligo(1000)=NumGoodOligo;
    end
    FinalOligo = GoodOligo(IDofChozenOligo);
    clear GoodOligo;
    
    for i = 1:length(FinalOligo)
        FinalOligo(i).Header = ['Chr22Domain' num2str(ii) FinalOligo(i).Header];
        if ii<=14
            FinalOligo(i).Sequence = [Universal_l Secondary{ii} FinalOligo(i).Sequence Universal_r];
        else
            FinalOligo(i).Sequence = [Universal_l Secondary{ii+3} FinalOligo(i).Sequence Universal_r];
        end
    end
    
    OutputFasta = [OutputFasta FinalOligo];
end

fastawrite('CustomArrayOrder150804Chr22.fasta', OutputFasta);
