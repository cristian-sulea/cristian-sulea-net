#!/bin/bash
cd ..
docker build -f docker/create-image-jekyll-serve.dockerfile -t jekyll-serve .
#read -p "Press ENTER to continue..."