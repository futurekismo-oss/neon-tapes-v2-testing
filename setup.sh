#!/usr/bin/env bash

set -u

git clone https://github.com/Blapples/SekaiPop

mv SekaiPop/* .
rm -rf SekaiPop

if [ -d "sekaipop" ]; then
  mkdir quickshell
  mv sekaipop quickshell
fi


echo "Removing bloat"

shopt -s extglob
rm -rf !(tape.toml|hypr|quickshell)


echo "Installed Sekaipop"
