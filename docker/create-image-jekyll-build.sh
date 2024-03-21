#!/bin/bash
cd ..
docker build -f docker/create-image-jekyll-build.dockerfile -t jekyll-build .
#read -p "Press ENTER to continue..."