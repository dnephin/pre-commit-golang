#!/usr/bin/env bash

set -eu -o pipefail

BIN=ineffassign
if ! command -v $BIN &> /dev/null ; then
    echo "$BIN not installed or available in the PATH" >&2
    echo "please run 'go install github.com/gordonklaus/ineffassign@latest'" >&2
    exit 1
fi

failed=false

for file in "$@"; do
    # redirect stderr so that violations and summaries are properly interleaved.
    if ! $BIN "$file" 2>&1
    then
        failed=true
    fi
done

if [[ $failed == "true" ]]; then
    exit 1
fi
