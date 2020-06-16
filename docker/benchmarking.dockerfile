FROM ubuntu:18.04

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install apt-transport-https apt-utils && \
	apt-get update && apt-get -y install wget parallel curl time

WORKDIR /tmp

RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/*+-x64-linux.tar.gz && \ 
	tar -zxf ncbi-blast-* && \
	rm ncbi-blast-*.tar.gz && \
	mv ncbi-blast-*/bin/* /usr/bin/ && \
	rm -rf ncbi-blast-*/

RUN mkdir /data
RUN mkdir /data/refseq_protein
RUN mkdir /data/cho_protein

WORKDIR /data/refseq_protein

RUN update_blastdb.pl --source gcp refseq_protein

WORKDIR /data/cho_protein

RUN wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/003/668/045/GCF_003668045.1_CriGri-PICR/GCF_003668045.1_CriGri-PICR_protein.faa.gz && gunzip *.gz && makeblastdb -in GCF_003668045.1_CriGri-PICR_protein.faa -dbtype prot

RUN useradd -ms /bin/bash benchmarking
USER benchmarking
WORKDIR /home/benchmarking
	
