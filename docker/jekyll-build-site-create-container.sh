#!/bin/bash
cd ..
ProjectFolder=${PWD##*/}          # to assign to a variable
ProjectFolder=${ProjectFolder:-/} # to correct for the case where PWD=/
cd site
docker run -d --name ${ProjectFolder} -v ${PWD}:/site cristiansulea/jekyll-build:1.0
#read -p "Press ENTER to continue..."