#!/usr/bin/env bash
#
# Capture and print stdout, since gofmt doesn't use proper exit codes
#
set -e

output="$(gofmt -l -w "$@")"
[[ -z "$output" ]] && exit 0
echo >&2 "files formatted, please re-add to commit"