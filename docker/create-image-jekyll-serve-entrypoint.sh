#!/bin/bash
set -e

if [ ! -f Gemfile ]; then
  echo "Gemfile missing so maybe not a jekyll site in this folder?"
  exit 1
fi

bundle install --retry 5 --jobs 20

exec "$@"
