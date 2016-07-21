#!/bin/sh

if [ $# -ne 5 ] ; then
    echo "usage: $0 <scene> <algo> <depth> <samples> <rng>"
    exit
fi

scene=$1
algo=$2
depth=$3
samples=$4
rng=$5

sampler="Sampler \"${rng}\" \"integer pixelsamples\" [${samples}]\n"
integrator="Integrator \"${algo}\" \"integer mutationsperpixel\" [${samples}] \"integer maxdepth\" [${depth}]\n"

mkdir -p output
cd ${scene}
output="../output/${scene}_${algo}_${depth}_${samples}_${rng}.exr"
echo -e "${integrator} ${sampler} `cat ${scene}.pbrt`" | ../../build/pbrt --outfile ${output}

