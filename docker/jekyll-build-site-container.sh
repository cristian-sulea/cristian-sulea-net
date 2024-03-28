#!/bin/bash
cd ..
ProjectFolder=${PWD##*/}          # to assign to a variable
ProjectFolder=${ProjectFolder:-/} # to correct for the case where PWD=/
cd site || exit
docker run -d --name ${ProjectFolder}-build -v ${PWD}:/site cristiansulea/jekyll-build:4.3.3-r0
