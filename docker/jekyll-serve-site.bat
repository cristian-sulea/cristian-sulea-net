cd..
cd site
docker run --rm -t -i -p 4000:4000 -v %cd%:/site jekyll-serve