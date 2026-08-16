#!/bin/sh
# Fake jq: report version jq-1.6 to skip download, pass other calls to real jq
for arg in "$@"; do
  if [ "$arg" = "--version" ]; then
    echo "jq-1.6"
    exit 0
  fi
done
exec /usr/bin/jq "$@"
