#!/usr/bin/env bash
#
# Capture and print stdout/stderr, since golint doesn't use proper exit codes
#
failed=false

exec 5>&1
for file in "$@"; do
    output="$(golint "$file" 2>&1 | tee /dev/fd/5)"
    if [[ -z "$output" ]]; then
        failed=true
    fi
done


if [[ $failed == "true" ]]; then
    exit 1
fi
