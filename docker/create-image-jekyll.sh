#!/bin/bash
cd ..
docker build -f docker/create-image-jekyll.dockerfile -t jekyll .
#read -p "Press ENTER to continue..."