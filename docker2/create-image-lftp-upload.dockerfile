FROM alpine

RUN apk --no-cache add ca-certificates openssh

# used in the jekyll-server image, which is FROM this image
COPY docker/create-image-jekyll-serve-entrypoint.sh /usr/local/bin/

RUN gem update --system && gem install jekyll && gem cleanup

EXPOSE 4000

WORKDIR /site

ENTRYPOINT [ "jekyll" ]

CMD [ "--help" ]
