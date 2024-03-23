#!/bin/bash
cd ..
ProjectFolder=${PWD##*/}          # to assign to a variable
ProjectFolder=${ProjectFolder:-/} # to correct for the case where PWD=/
cd site
docker run -d --name ${ProjectFolder}-serve -v ${PWD}:/site -p 4001:4000 cristiansulea/jekyll-serve:1.0
#read -p "Press ENTER to continue..."