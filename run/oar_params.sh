#!/bin/sh

#OAR --array-param-file oar_params.txt
#OAR -l /nodes=1/core=1,walltime=500:00:00
#OAR -t besteffort
##OAR --notify mail:toto@tata.com

../build/pbrt $@

