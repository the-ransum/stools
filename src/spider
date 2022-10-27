#!/bin/bash

function help {
    echo "Usage: spider [URL]..."
    echo ""
    echo "Capture server response from URL without caching and downloading any response "
    echo "data, equivalent to -"
    echo "wget -S --spider --no-cache --no-check-certificate [URL]"
    echo ""
    echo "Startup:"
    echo "  -h,  --help              print this help."
    exit 1
}

if [ -z "$1" ] || [[ "$@" == *"-h"* ]]; then
    help
fi


wget -S --spider --no-cache --no-check-certificate -O /dev/null $@
