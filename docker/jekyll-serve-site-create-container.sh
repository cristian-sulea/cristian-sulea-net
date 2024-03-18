#!/bin/bash
cd ..
for %%I in (.) do set CurrDirName=%%~nxI
cd site
docker run -d -p 4000:4000 --name cristian-sulea-net -v /Users/cristi/IdeaProjects/cristian-sulea-net/site:/site jekyll-serve
pause