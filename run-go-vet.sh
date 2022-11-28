#!/usr/bin/env bash
set -e
for pkg in $(go list ./...); do
  for dir in $(echo $@|xargs -n1 dirname|sort -u); do
    go vet $pkg/$dir
  done
done
