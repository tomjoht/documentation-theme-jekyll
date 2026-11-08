#!/usr/bin/env bash
# Serves the site with Docker and rebuilds it when files change, so you don't
# need to install Ruby or Jekyll.
# Usage: ./watch.sh [port]   (default port: 4000)
# Then open http://localhost:4000 in your browser. Press Ctrl+C to stop.
# Requires: Docker with the compose plugin
set -e
PORT="${1:-4000}" docker compose up --build
