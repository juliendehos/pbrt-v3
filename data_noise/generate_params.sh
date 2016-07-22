#!/bin/sh

# ./generate_params.sh > run_oar.txt 

SCENES="breakfast spheres sportscar veach"
DEPTHS="1 2 4 32"
SAMPLES="4 32 256 2048 16384"
RNGS="sobol halton random lowdiscrepancy"

# algo: path
for scene in $SCENES; do
    for depth in $DEPTHS; do
        for sample in $SAMPLES; do
            for rng in $RNGS; do
                echo $scene path $depth $sample $rng
            done
        done
    done
done

# algo: mlt
for scene in $SCENES; do
    for depth in $DEPTHS; do
        for sample in $SAMPLES; do
            echo $scene mlt $depth $sample random
        done
    done
done

