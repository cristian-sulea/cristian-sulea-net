#!/bin/bash
cd ..


cd site || exit
docker run --rm                             -v ${PWD}:/site cristiansulea/jekyll-build:4.3.3-r0
