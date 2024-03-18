#!/bin/bash
cd ..
mkdir site
cd site
docker run --rm -v ${PWD}:/site jekyll new .
#read -p "Press ENTER to continue..."