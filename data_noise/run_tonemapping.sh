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

#pfsin ${input} | pfstmo_drago03 | pfsout ${name}_drago03.png

