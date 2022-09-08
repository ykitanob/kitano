#!/usr/bin/bash

name=$(basename $1 .bam)
scriptname=$(basename $0 .sh)
mkdir -p ${scriptname}
touch ${scriptname}/${name}.out.txt