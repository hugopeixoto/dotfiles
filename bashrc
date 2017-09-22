#! /usr/bin/env bash

export DOTFILES_DIR="$HOME/work/personal/dotfiles"

if [ -d "$DOTFILES_DIR"/bash ]; then
  for f in "$DOTFILES_DIR"/bash/*; do
    source "$f"
  done
fi
