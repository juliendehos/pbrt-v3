#!/bin/sh

#OAR -l /nodes=1/core=30,walltime=50:00:00
#OAR -t besteffort
##OAR --notify mail:toto@tata.com

../build/pbrt ../data/pbrt-v3-scenes/breakfast/breakfast.pbrt

