#! /usr/bin/env bash

if [ -d ~/work/personal/dotfiles/bash ]; then
  for f in ~/work/personal/dotfiles/bash/*; do
    . "$f"
  done
fi
