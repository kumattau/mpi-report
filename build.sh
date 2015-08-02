#!/bin/bash

set -e

base=base/mpi-report-j-embedded-win.pdf
resl=150
outp=mpi-report-j-ocr.pdf

mkdir -p pgm
mkdir -p gif

pdftoppm -r $resl -gray $base pgm/image

for i in pgm/image-*.pgm
do
  ppmtogif $i > gif/`basename $i .pgm`.gif
done

echo "pause for gif optimization (press key if continue)"
read

convert -quality 100 -limit memory 64 gif/*.gif mpi-report-j-gif.pdf
