# Builds and serves the site without installing Ruby on your computer.
# Usage: docker compose up   (then open http://localhost:4000)
FROM ruby:3.3-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential git \
    && rm -rf /var/lib/apt/lists/*

# Ruby reads files as UTF-8 only when the locale says so. Without this,
# builds fail with "Invalid US-ASCII character" errors.
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 4000 35729
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--force_polling"]
