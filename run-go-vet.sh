#!/usr/bin/env bash
set -e
for file in "$@"; do
    go tool vet $file
done
