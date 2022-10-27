#!/bin/bash

unset force quiet update uninstall

force=0
quiet=0
update=0
uninstall=0
# Parsing flags passed to script
while [ -n "$1" ]; do
        case "$1" in
                -f|--force) force=1 ;;
                -q|--quiet) quiet=1 ;;
                --update) update=1 ;;
				--uninstall) uninstall=1 ;;
                *) echo "$1 is not an option" ;;
        esac
        shift
done

flags=()
if [ $force -eq 1 ]; then
	flags+=("--force")
fi
if [ $quiet -eq 1 ]; then
	flags+=("--quiet")
fi

if [ $update -eq 1 ]; then
	# Update the stools script
	../update "${flags[@]}"
	exit 0
elif [ $uninstall -eq 1 ]; then
	# Uninstall the stools script
	../uninstall "${flags[@]}"
	exit 0
fi