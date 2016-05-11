#!/bin/sh

if [ $# -ne 2 ] ; then
    echo "usage: $0 <login> <output directory> "
    exit
fi
mylogin=$1
outdir=$2

scp ${mylogin}@calculco.univ-littoral.fr:.pbrt-calculco/data/veach/* ${outdir}
