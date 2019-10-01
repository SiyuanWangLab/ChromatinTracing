# Chromatin Tracing Probe Design
This repository contains codes for chromatin tracing probe design.
Codes here were used to design the chromatin tracing probes targeting 27 TADs on human chromosome 22. See publicaton: Siyuan Wang, Jun-Han Su, Brian J. Beliveau, Bogdan Bintu, Jeffrey R. Moffitt, Chao-ting Wu, Xiaowei Zhuang, Spatial organization of chromatin domains and compartments in single chromosomes, Science, Vol. 353, Issue 6299, 598-602, DOI: 10.1126/science.aaf8084, 2016.

FragmentBuild.m: This m file breaks the genomic sequences of the center 100-kb regions of the TADs into 1-kb fragments. The 1-kb frgaments are inputs for probe design using software OligoArray2.1 installed in a high perfomrance computing cluster. 

runscript1.sh and runsript2.sh: These are batch commands that run OligoArray2.1.

DomainStartsAndEnds.txt: This file contains the pre-determined start and end genomic coordiantes of the 27 TADs on human chromosome 22.

generateJavaComands.m: This file contains a loop that generates the OligoArray2.1 Java commands for the probe design for the different TADs -- the commands in runscript1.sh and runsript2.sh.

run1_blastn.m: This file reads the output oligo sequences from OligoArrray2.1, and blast them against the human genome to make sure the uniqueness fo the sequences. Only unique sequences are used as probes.

readOligos.m: a function used by run1_blastn.m.
