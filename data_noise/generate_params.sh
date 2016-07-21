#!/bin/sh

# ./generate_params.sh > run_oar.txt 

SCENES="breakfast spheres sportscar veach"
ALGOS="path mlt"
DEPTHS="1 2 4 32"
SAMPLES="4 32 256 2048 16384"
RNGS="sobol halton random lowdiscrepancy"

for scene in $SCENES; do
    for algo in $ALGOS; do
        for depth in $DEPTHS; do
            for sample in $SAMPLES; do
                for rng in $RNGS; do
                    echo $scene $algo $depth $sample $rng
                done
            done
        done
    done
done

