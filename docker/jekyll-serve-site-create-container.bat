cd..
for %%I in (.) do set CurrDirName=%%~nxI
cd site
docker run -d -p 4000:4000 --name %CurrDirName% -v %cd%:/site jekyll-serve
pause