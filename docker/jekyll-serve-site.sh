#!/bin/bash
cd ..


cd site || exit
docker run --rm                             -v ${PWD}:/site -p 4001:4000 cristiansulea/jekyll-serve:4.3.3-r0
