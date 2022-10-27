#!/bin/bash

function help {
	echo "Usage: url_extract [URL]..."
	echo ""
	echo "Extracts all urls from a webpage that are found"
	
	exit 1
}

if [ -z "$1" ] || [[ "$@" == *"-h"* ]]; then
	help
fi

for url in "$@"; do
	echo "-- $(date -u) -- ${url}"
	urls_found=$(curl -sS "${url}" \
					| xmllint --html --xpath '//a[starts-with(@href, "http") or starts-with(@href, "/")]/@href' 2>/dev/null - \
					| sed 's/^ href="\|"$//g' \
					| tail)
	for result in ${urls_found}; do
		echo "${result}"
	done
	echo ""
done
