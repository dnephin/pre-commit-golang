#!/usr/bin/env bash

set -eu -o pipefail

fail() {
  echo "unit tests failed"
  exit 1
}

MODULES=.
if [[ -f go.work ]]; then
    MODULES="$(go work edit -json | python -c 'import json,sys;print("\n".join(w["ModPath"] for w in json.load(sys.stdin)["Use"]))')"
fi

FILES=$(xargs -I '{}' go list '{}/...' <<< "${MODULES}" | grep -v /vendor/) || fail
go test -tags=unit -timeout 30s -short -v ${FILES} || fail
