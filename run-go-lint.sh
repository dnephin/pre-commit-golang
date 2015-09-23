#!/bin/bash
#
# Capture and print stdout/stderr, since golint doesn't use proper exit codes
#
set -e

exec 5>&1
output="$(golint "$@" 2>&1 | tee /dev/fd/5)"
[[ -z "$output" ]]
