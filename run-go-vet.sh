#!/usr/bin/env bash

set -e
pkg=$(go list)
for fn in "$@"; do
        go vet "${pkg}/${fn}"
done
