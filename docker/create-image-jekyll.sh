#!/bin/bash
cd ..
docker build -f docker/create-image-jekyll.dockerfile -t jekyll .
#docker tag jekyll cristiansulea/jekyll:1.0
#read -p "Press ENTER to continue..."