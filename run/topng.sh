#!/bin/sh
for n in $@; do
    EXR=$n
    PNG="${EXR%.*}.png"
    exrtopng $EXR $PNG
done

