cd..
mkdir site
cd site
docker run --rm -v %cd%:/site jekyll new .
pause