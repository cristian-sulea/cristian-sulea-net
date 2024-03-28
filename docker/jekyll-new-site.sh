#!/bin/bash
cd ..
mkdir site
cd site || exit
docker run --rm -v ${PWD}:/site cristiansulea/jekyll:4.3.3-r0 new .
