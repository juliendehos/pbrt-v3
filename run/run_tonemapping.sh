#!/bin/sh

if [ $# -ne 1 ] ; then
    echo "usage: $0 <input exr image>"
    exit
fi
input=$1
dir_name=`dirname $1`
base_name=`basename $1`
name=${dir_name}/${base_name%.exr}

exrtopng ${name}.exr ${name}.png

#pfsinexr ${name}.exr | pfstmo_reinhard05  | pfsoutexr tmp_${base_name}.exr && exrtopng tmp_${base_name}.exr ${name}_reinhard05.png
#rm tmp_${base_name}.exr

