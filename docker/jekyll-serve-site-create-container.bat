cd..
cd site
docker run -d -p 4000:4000 --name jekyll-serve -v %cd%:/site jekyll-serve