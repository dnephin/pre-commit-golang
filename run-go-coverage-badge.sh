#!/usr/bin/env bash
gopherbadger -md="README.md" -prefix="" -png=false >/dev/null 2>&1
rm -f coverage.out
echo 'Now has been generated a new badge and added to README.md'
echo 'You can check the changes made. Then run "git add README.md" and re-commit'
