#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v gocyclo &> /dev/null ; then
    echo "gocyclo not installed or available in the PATH" >&2
    echo "please check https://github.com/fzipp/gocyclo" >&2
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    echo "Please add `args: [-over=15]` in your pre-commit config"
    exit 1
fi

exec gocyclo $@
