#! /usr/bin/env bash

if [ -d ~/.bash ]; then
  for f in ~/.bash/*; do
    . "$f"
  done
fi
