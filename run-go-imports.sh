#!/usr/bin/env bash
#
# Capture and print stdout, since goimports doesn't use proper exit codes
#
set -e

output="$(goimports -l -w "$@")"
[[ -z "$output" ]]
