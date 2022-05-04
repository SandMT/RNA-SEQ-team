# RNA-SEQ-team
## Aims:
Using bulk RNA sequencing (RNA-Seq) data to create a database and interrogate it with query sequences. Output consist of basic local alignment (BLAST) files.

## Contributors: 
- Sandra Martínez-Turiño @SandMT
- Laura Montosa @lmontosah
- Bruno Moreira @brjmoreira
- Domingo Rojas Barros @DomiRojas

## Data:
*FASTA file (zipped)*
- Description: cDNA contigs created by de novo assembly of RNA-Seq (massive-scale cDNA sequencing data) reads.
- Origin: Transcriptome from *Nicotiana benthamiana* plants (Transcriptome assembly v5, primary transcripts [Nakasugi *et al*. 2014]) using Bowtie2 (Langmead & Salzberg, 2012) with the very sensitive option activated, as described by Pasin *et al*. 2020 (doi: 10.1016/j.xplc.2020.100099) (see Supplemental Methods in [(https://pubmed.ncbi.nlm.nih.gov/32984814/)]. 

*Query folders ("Queries_Nb" and "Queries_Pp")*
- Folder "Queries_Nb" contains 20 txt files 
- Folder "Queries_P" contains 6 txt files
- "Queries_Nb" contains eIF4E sequence of two varieties of *Prunus domestica* (Jojo and Prunus)
- "Queries_P" contains different eIF4E sequences of Nicotiana spp. (*N. benthamiana* and *N. clevelandii*)
- Each file txt contains a nucleotide sequence of the eIF4E factor (DB retrived and/or experimentaly obtained [S. Martínez-Turiño and J.A. García, unpublished results].

## Tools:
- Blast 2.12
- SnakeMake

## Commands to execute tasks

### unzip --> Unzip fasta zipped file
```
unzip Nbv5_transcriptome.zip
```
### mkdir --> make a new directory (where new DB is store)
```
mkdir db_benthamiana
```
### mv --> move the unzipped fasta file to the new created directory
```
mv Nbv5_transcriptome.fa db_benthamiana
```
### cd --> change to new folder
```
cd db_benthamiana/
```
### makeblastdb  --> create DB from unzipped falta file
```
makeblastdb -in Nbv5_transcriptome.fa -parse_seqids -dbtype nucl
```
### blast --> make blast
```
blastn -query Queries_Nb/Test.txt -db db_benthamiana/Nbv5_transcriptome.fa -out results/Results01.bls -task blastn 
```
### sed --> extract highest score local alignment 
```
sed -n -e 22p results/test01.bls > results/highest_score.txt
```

## Workflow
1. Clone this repository
2. Unzip file Nbv5_transcriptome.zip
3. Script to execute:
  1. makeblastdb –in Nbv5_transcriptome.fa –parse_seqids –dbtype nucl 
  2. blastn -query Queries_Nb /test.txt -db db_benthamiana Nbv5_transcriptome.fa -out results_benthamiana/test01.bls -task blastn

### Structure

- SnakeMake workflow:
  - Step 1 and 2
  - Step 3.1 and 3.2 -> On Container (running makeblastdb and blastn).


