#!/usr/bin/env bash

go mod vendor
git diff --exit-code vendor &> /dev/null

if [ $? -eq 1 ]; then
    echo "vendor dir differs, please re-add it to your commit"

    exit 1
fi
