#!/usr/bin/env bash

set -eu -o pipefail

echo "$@" | xargs -n1 go generate
