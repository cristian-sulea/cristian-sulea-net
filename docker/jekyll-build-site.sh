#!/bin/bash
cd ..

cd site
docker run --rm -v ${PWD}:/site jekyll-build
#read -p "Press ENTER to continue..."