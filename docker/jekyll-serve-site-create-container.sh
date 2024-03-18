#!/bin/bash
cd ..
ProjectFolder=${PWD##*/}          # to assign to a variable
ProjectFolder=${ProjectFolder:-/} # to correct for the case where PWD=/
cd site
docker run -d -p 4000:4000 --name ${ProjectFolder} -v ${PWD}:/site jekyll-serve
#read -p "Press ENTER to continue..."