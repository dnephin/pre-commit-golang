#!/usr/bin/env bash

while getopts ":w:" opt; do
  case $opt in
    a)
      cd $OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if go mod tidy -v 2>&1 | grep -q 'updates to go.mod needed'; then
    exit 1
fi

git diff --exit-code go.* &> /dev/null

if [ $? -eq 1 ]; then
    echo "go.mod or go.sum differs, please re-add it to your commit"

    exit 1
fi
