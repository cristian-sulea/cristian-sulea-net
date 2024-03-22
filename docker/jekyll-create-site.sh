#!/bin/bash
cd ..

mkdir site
cd site
docker run --rm -v ${PWD}:/site cristiansulea/jekyll:1.0 new .
#read -p "Press ENTER to continue..."