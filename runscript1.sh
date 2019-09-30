#!/bin/bash
#SBATCH -n 6      
#SBATCH -N 1                
#SBATCH -t 2880              
#SBATCH -p general
#SBATCH --mem 100000    
#SBATCH -o hostname1.out    
#SBATCH -e hostname1.err    
#SBATCH --mail-type=ALL     
#SBATCH --mail-user=sywang1984@gmail.com  
module load bio/OligoArray2_1
java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence1.fasta -d chr22.fa -o oligos1.txt -r failed1.txt -R log1.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence2.fasta -d chr22.fa -o oligos2.txt -r failed2.txt -R log2.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence3.fasta -d chr22.fa -o oligos3.txt -r failed3.txt -R log3.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence4.fasta -d chr22.fa -o oligos4.txt -r failed4.txt -R log4.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence5.fasta -d chr22.fa -o oligos5.txt -r failed5.txt -R log5.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence6.fasta -d chr22.fa -o oligos6.txt -r failed6.txt -R log6.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence7.fasta -d chr22.fa -o oligos7.txt -r failed7.txt -R log7.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence8.fasta -d chr22.fa -o oligos8.txt -r failed8.txt -R log8.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence9.fasta -d chr22.fa -o oligos9.txt -r failed9.txt -R log9.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence10.fasta -d chr22.fa -o oligos10.txt -r failed10.txt -R log10.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence11.fasta -d chr22.fa -o oligos11.txt -r failed11.txt -R log11.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence12.fasta -d chr22.fa -o oligos12.txt -r failed12.txt -R log12.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence13.fasta -d chr22.fa -o oligos13.txt -r failed13.txt -R log13.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6

java -Xmx6g -jar /n/sw/OligoArray2_1/OligoArray2.jar -i 1kb_fragments_sequence14.fasta -d chr22.fa -o oligos14.txt -r failed14.txt -R log14.txt -n 33 -l 30 -L 30 -D 1000 -t 60 -T 100 -s 70 -x 70 -p 30 -P 90 -m "GGGGGGG;CCCCCCC;TTTTTTT;AAAAAAA" -g 31 -N 6
