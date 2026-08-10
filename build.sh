#!/usr/bin/env bash
main() {
  HUGO_VERSION=0.164.0
  export TZ=Europe/Warsaw

  # Install Hugo
  echo "Installing Hugo version ${HUGO_VERSION}"
  curl -LJO https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo${HUGO_VERSION}_Linux-64bit.tar.gz
  tar -xf "hugo${HUGO_VERSION}_Linux-64bit.tar.gz"
  cp hugo /opt/buildhome
  rm hugo${HUGO_VERSION}_Linux-64bit.tar.gz

  # Verify instalation
  echo "Verify instalations:"
  echo Go: "$(go version)"
  echo Hugo: "$(hugo version)"
  echo Node.JS "$(node --version)"

  # import papermod
  echo  "Update papermod"
  git init
  git submodule update --init --recursive
  git config core.quotepath false

  # build the website
  echo "Building the website"
  hugo --gc --minify
  
}

set -euo pipefail
main "$@"
