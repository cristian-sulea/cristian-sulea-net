#!/bin/bash
cd ..
docker build -f docker/create-image-jekyll-serve.dockerfile -t jekyll-serve .
#docker build --platform linux/amd64 -f docker/create-image-jekyll-serve.dockerfile -t jekyll-serve .
docker tag jekyll-serve cristiansulea/jekyll-serve:1.0
#read -p "Press ENTER to continue..."