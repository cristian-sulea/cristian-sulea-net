#!/bin/bash
cd ..

cd site
docker run --rm -v ${PWD}:/site cristiansulea/jekyll-build:1.0
#read -p "Press ENTER to continue..."