#!/usr/bin/env bash
#
# Capture and print stdout, since goimports doesn't use proper exit codes
#
set -e

output="$(goimports -l -w "$@")"
[[ -z "$output" ]] && exit 0
echo "imports changed, please re-add to commit"
