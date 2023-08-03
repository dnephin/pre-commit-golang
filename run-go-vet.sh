#!/usr/bin/env bash
set -ex
pkg=$(go list)
for dir in $(echo "$@"|xargs -n1 dirname|sort -u); do
  go vet "$pkg/$dir"
done
