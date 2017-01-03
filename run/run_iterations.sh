#!/bin/sh

#OAR -l /nodes=1,walltime=900:00:00
#OAR -q long
#OAR -t besteffort
#OAR -t idempotent
#OAR --notify mail:dehos@univ-littoral.fr

../build/pbrt ../data/cornellbox_pointlight/cornellbox_pointlight.pbrt

