#!/usr/bin/env bash
# Builds the site into _site with Docker, so you don't need to install Ruby or Jekyll.
# Usage: ./build.sh
# Requires: Docker with the compose plugin
set -e
docker compose run --rm jekyll bundle exec jekyll build
