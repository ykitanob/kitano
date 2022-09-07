#!/usr/bin/bash

bam=$1
QC=$2
SUB=$3

name=$(basename $1 .bam)
mkdir $name
cp $bam $name/
cp -r $QC $name/ 
cp -r $SUB $name/ 