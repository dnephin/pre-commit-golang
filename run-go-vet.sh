#!/usr/bin/env bash
set -e
for file in "$@"; do
    go vet $file
done
