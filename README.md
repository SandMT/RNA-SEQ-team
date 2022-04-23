# RNA-SEQ-team
## Aims:
Using bulk RNA sequencing (RNA-Seq) data to create a database and interrogate it with query sequences. Output consist of basic local alignment (BLAST) files.
## Contributors: 
- Sandra Martínez-Turiño @SandMT
- Laura Montosa @lmontosah
- Bruno Moreira @brjmoreira
- Domingo Rojas Barros @DomiRojas
## Tools:
- blast
## Commands to execute tasks
### makeblastdb --> To create a Data Base --> from FASTA file containing RNASEQ data (massive sequencing data)
- $ ./makeblastdb –in ../db_benthamiana/Nbv5_transcriptome.fa –parse_seqids –dbtype nucl

### blastn --> To execute a "blast" --> interrogates previouslu created DB with our queries (one or more query sequences)
- $ ./blastn -query ../Queries_Nb /test.txt -db ../db_benthamiana/ Nbv5_transcriptome.fa -out ../results_benthamiana/test01.bls -task blastn
- $ ./blastn -query ../Queries_Pp /test.txt -db ../db_benthamiana/ Nbv5_transcriptome.fa -out ../results_benthamiana/test01.bls -task blastn

