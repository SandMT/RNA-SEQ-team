unzip Nbv5_transcriptome.zip
mkdir db_benthamiana
mv Nbv5_transcriptome.fa db_benthamiana
cd db_benthamiana/
makeblastdb -in Nbv5_transcriptome.fa -parse_seqids -dbtype nucl
blastn -query Queries_Nb/Test.txt -db db_benthamiana/Nbv5_transcriptome.fa -out results/Results01.bls -task blastn 
sed -n -e 22p results/test01.bls > results/highest_score.txt
