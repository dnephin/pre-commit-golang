#!/usr/bin/env bash
#
# Capture and print stdout, since gofmt doesn't use proper exit codes
#
set -e -o pipefail

if ! command -v gofmt &> /dev/null ; then
    echo "gofmt not installed or available in the PATH" >&2
    exit 1
fi

output="$(gofmt -l -w "$@")"
echo "$output"
[[ -z "$output" ]]
