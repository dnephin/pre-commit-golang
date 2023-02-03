#!/usr/bin/env bash

function get_root_branch() {
    git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
}

function cleanup() {
    rm a.patch
}

set -eu -o pipefail

if ! command -v tokolint-cli &> /dev/null ; then
    echo "tokolint not installed or available in the PATH" >&2
    echo "please check https://github.com/tokopedia/tokolint" >&2
    exit 1
fi

if ! command -v golangci-lint &> /dev/null ; then
    echo "tokolint installation is corrupted" >&2
    echo "please re-install https://github.com/tokopedia/tokolint" >&2
    exit 1
fi

root_branch=$(get_root_branch)
git --no-pager diff --output=a.patch origin/"$root_branch"

trap cleanup EXIT

golangci-lint run --new-from-patch=a.patch "$@"
