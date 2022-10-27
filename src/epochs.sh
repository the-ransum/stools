#!/bin/bash

function help {
	echo "Usage: epochs [EPOCH_TIMESTAMPS]..."
	echo ""
	echo "Convert seconds since the epoch (1970-01-01 UTC) to a date, "
	echo "equivalent to date --date='@[EPOCH_TIMESTAMP]'"
	
	exit 1
}

if [ -z "$1" ] || [[ "$@" == *"-h"* ]]; then
	help
fi

for arg in "$@"; do
	echo "$(date -d @${arg})"
done
