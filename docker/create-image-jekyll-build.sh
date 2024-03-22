#!/bin/bash
cd ..
docker build -f docker/create-image-jekyll-build.dockerfile -t jekyll-build .
#docker tag jekyll-build cristiansulea/jekyll-build:1.0
#read -p "Press ENTER to continue..."