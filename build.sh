#!/bin/bash

# Install md2html if it's not already installed
if ! command -v md2html >/dev/null 2>&1; then
  echo "md2html not found - installing"
  go get github.com/robertkrimen/md2html
fi

# Generate the HTML file from the README
md2html README.md | awk 'BEGIN {print "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><title>README</title><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.10.0/github-markdown.min.css\"><style>body{background:linear-gradient(45deg, #ffcef8, #bbd6ff);max-width:55em; margin:5em auto}</style></head><body><div class=\"markdown-body\">" } {print} END {print "</div></body></html>"}' > index.html
