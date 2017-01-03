#!/bin/sh

# ./generate_params.sh > run_oar.txt 

SCENES="breakfast spheres sportscar veach"
DEPTHS="1 2 4 32"
SAMPLES="2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536"
RNGS="sobol halton random lowdiscrepancy"

#SCENES="breakfast spheres sportscar veach"
#DEPTHS="1 2 4 32"
#SAMPLES="4 32 256 2048 16384"
#RNGS="sobol halton random lowdiscrepancy"

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

