#!/bin/bash
cd ..
docker build -f docker/create-image-jekyll.dockerfile -t jekyll .
#docker build --platform linux/amd64 -f docker/create-image-jekyll.dockerfile -t jekyll .
#docker tag jekyll cristiansulea/jekyll:1.1-amd64
#read -p "Press ENTER to continue..."