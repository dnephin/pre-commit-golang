#!/usr/bin/env bash

if go mod tidy -v 2>&1 | grep -q 'updates to go.mod needed'; then
    exit 1
fi

git diff --exit-code go.* &> /dev/null

if [ $? -eq 1 ]; then
    echo "go.mod or go.sum differs, please re-add it to your commit"

    exit 1
fi
