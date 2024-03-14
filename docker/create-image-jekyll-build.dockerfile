# build from the image we just built with different metadata
FROM jekyll as jekyll-serve

# on every container start, check if Gemfile exists and warn if it's missing
ENTRYPOINT [ "create-image-jekyll-serve-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "build" ]
