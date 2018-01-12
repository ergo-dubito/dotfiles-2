#!/usr/bin/env bash

git pull origin master

if [ "$(uname -s)" = 'Darwin' ]; then
  rsync \
    --exclude '.git/' \
    --exclude '.DS_Store' \
    --exclude 'bootstrap.sh' \
    --exclude 'README.md' \
    --exclude 'LICENSE' \
    -avh --no-perms . ~
else
  rsync \
    --exclude '.git/' \
    --exclude '.DS_Store' \
    --exclude '.macos' \
    --exclude 'bootstrap.sh' \
    --exclude 'brew.sh' \
    --exclude 'README.md' \
    --exclude 'LICENSE' \
    -avh --no-perms . ~
fi

if [[ "$SHELL" =~ 'zsh$' ]]; then
  source ~/.zshrc
else
  source ~/.bashrc
fi
