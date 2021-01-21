#!/usr/bin/env bash
go test -v -coverprofile=c.out `go list ./...`

returncode=$?
if [ $returncode -ne 0 ]; then
  echo "unit tests failed"
  exit 1
fi
