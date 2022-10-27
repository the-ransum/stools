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
				--list)
					#find ../bin -type l -exec basename {} \;
					echo "Scripts -"
					echo "    stools - A collection of scripts for managing your system"
					echo "    epochs - Convert epoch timestamps to human readable dates"
					echo "    spider - A simple web spider for validating live URLs"
					echo ""
					echo "    and many more to come..."
					
					exit 0
				;;
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

running_dir=$( dirname "$0" )
if [ $update -eq 1 ]; then
	# Update the stools script
	"${running_dir}/../update" "${flags[@]}"
	exit 0
elif [ $uninstall -eq 1 ]; then
	# Uninstall the stools script
	"${running_dir}/../uninstall" "${flags[@]}"
	exit 0
fi