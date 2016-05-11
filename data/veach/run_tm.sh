#!/bin/sh

if [ $# -ne 2 ] ; then
    echo "usage: $0 <input image> <output image> "
    exit
fi
input=$1
output=$2

pfsin $input | pfstmo_drago03 | pfsout tmp.exr
exrtopng tmp.exr $output

