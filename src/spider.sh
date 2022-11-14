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

# TODO: Add the use of proxy server and port
# wget -S --spider --no-cache -O /dev/null -e use_proxy=yes \
#	-e http_proxy=[PROXY_HOST]:[PROXY_PORT] \
#	[TARGET_URL] ...

wget -S --spider --no-cache --no-check-certificate -O /dev/null $@
