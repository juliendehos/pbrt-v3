#!/bin/sh

#OAR -l /nodes=1,walltime=5000:00:00
#OAR -t besteffort
#OAR -t idempotent
#OAR --notify mail:dehos@univ-littoral.fr

../build/pbrt veach/veach.pbrt

