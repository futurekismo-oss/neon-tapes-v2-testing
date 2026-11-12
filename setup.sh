#!/usr/bin/env bash

set -u

git clone https://github.com/Blapples/SekaiPop

if [ -d "sekaipop" ]; then
  mkdir quickshell
  mv sekaipop quickshell
fi

echo "Installed Sekaipop"
