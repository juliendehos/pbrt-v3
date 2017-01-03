#!/bin/sh

#OAR -l /nodes=1/core=5,walltime=9000:00:00
#OAR -q long
##OAR -t besteffort
##OAR -t idempotent
#OAR --notify mail:dehos@univ-littoral.fr

../build/pbrt veach/veach_32.pbrt

