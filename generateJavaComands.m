FID = fopen('javaComands.txt', 'w');
for i = 1:27
    fprintf(FID, 'java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence%d.fasta -d chr22.fa -o oligos%d.txt -r failed%d.txt -R log%d.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6\r\n\r\n', i, i, i, i);
end
fclose(FID);