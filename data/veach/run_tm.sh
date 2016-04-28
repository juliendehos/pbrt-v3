#!/bin/sh
pfsin $1 | pfstmo_drago03 | pfsout tmp.exr
exrtopng tmp.exr $2

