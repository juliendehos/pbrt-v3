#!/bin/sh

#OAR -l /nodes=1,walltime=50:00:00
#OAR -t besteffort

 ../../build/pbrt reference.pbrt

