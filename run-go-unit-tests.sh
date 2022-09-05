#!/usr/bin/env bash
FILES=$(go list ./...  | grep -v /vendor/)

ARGS=""

for arg in "$@"; do
  [[ $arg == -* ]] && ARGS="${ARGS} $arg"
done

[ -z "$ARGS" ] && ARGS="-timeout=30s"

go test -tags=unit ${ARGS} -short -v ${FILES}

returncode=$?
if [ $returncode -ne 0 ]; then
  echo "unit tests failed"
  exit 1
fi
