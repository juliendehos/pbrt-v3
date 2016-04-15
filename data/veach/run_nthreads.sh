#!/bin/sh

#OAR -l /nodes=1/core=32,walltime=50:00:00
#OAR -t besteffort

NTHREADS="1 2 4 8 16 32"
SCENES=$(find . -name "*.pbrt")
OUTPUT="output.csv"

rm -f $OUTPUT

for scene in $SCENES ; do
    for nthread in $NTHREADS ; do
        t=$(../../build/pbrt --nthreads $nthread $scene | grep "Rendering " | awk '{print $3}')
        echo "${scene}; ${nthread}; ${t}" >> $OUTPUT
    done
done

