#!/usr/bin/env bash

set -eu -o pipefail

MODULES=.
if [[ -f go.work ]]; then
    MODULES="$(go work edit -json | python -c 'import json,sys;print("\n".join(w["ModPath"] for w in json.load(sys.stdin)["Use"]))')"
fi

FILES="$(xargs -I '{}' go list '{}/...' <<< "${MODULES}" | grep -v /vendor/)"

exec go build $FILES
