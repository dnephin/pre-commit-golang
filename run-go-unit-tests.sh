#!/usr/bin/env bash
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
remotebanch = "origin/$branch"

echo "$remotebanch"
FILES=$(git diff --stat --cached $remotebanch)

# loop againts files
for FILE in $FILES
do
    echo "$FILE"
done

returncode=$?
if [ $returncode -ne 0 ]; then
  echo "unit tests failed"
  exit 1
fi
