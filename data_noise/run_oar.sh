#!/bin/sh

#OAR --array-param-file run_oar.txt
#OAR -l /nodes=1,walltime=5000:00:00
#OAR -t besteffort
#OAR -t idempotent
##OAR --notify mail:toto@tata.com

./run_pbrt.sh $@

