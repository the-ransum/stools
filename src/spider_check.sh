#!/bin/bash

function help {
		echo "Usage: spider_check [URL]..."
		echo ""
		exit 1
}

if [[ "$@" == "-h" ]] || [[ "$@" == "--help" ]]; then
		help
elif [ $# -eq 0 ] ; then
		echo "spider_check: missing URL"
		help
fi

wget -S --spider --no-cache --no-check-certificate -O /dev/null $@
