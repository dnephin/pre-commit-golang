#!/usr/bin/env bash
set -eu
if [[ -f "go.mod" ]]; then
   pkg=$(go list -m)
else
   pkg=$(go list)
fi
ret=0
for dir in $(echo "$@"|xargs -n1 dirname|sort -u); do
   go vet "$pkg/$dir" || ret=$?
done
exit $ret
