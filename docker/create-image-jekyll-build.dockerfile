# build from the image we just built with different metadata
FROM cristiansulea/jekyll:1.0 as jekyll-build
#FROM cristiansulea/jekyll:1.1-amd64 as jekyll-build

# on every container start, check if Gemfile exists and warn if it's missing
ENTRYPOINT [ "bash", "create-image-jekyll-serve-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "build" ]
