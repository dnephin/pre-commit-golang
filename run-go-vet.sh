#!/bin/bash
set -e
for file in "$@"; do
    go vet $file
done
