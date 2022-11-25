#!/usr/bin/env bash

fail() {
  echo "unit tests failed"
  exit 1
}

FILES=$(go list ./... | grep -v /vendor/) || fail
go test -cover -count=1 -race -v ${FILES} || fail
