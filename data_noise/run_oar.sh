#!/bin/sh

#OAR --array-param-file run_oar.txt
#OAR -l /nodes=1/core=1,walltime=5000:00:00
#OAR -t besteffort
##OAR --notify mail:toto@tata.com

./run_pbrt.sh $@

