#!/bin/bash
# Description: List all locally installed user scripts.

# Store current field separator in a variable so we can restore it later,
# after setting it as newline.
PIFS="$IFS"
IFS=$'\n'

# Set the directories to search for the executables.
DIR_PATHS=("$HOME/bin" "$HOME/.sbin" "/usr/local/bin")

echo "Checking ${#DIR_PATHS[@]} directories for possible executables..."
for DIR in ${DIR_PATHS[@]}; do
	if [ -d "$DIR" ]; then
		for FILE in $(find "$DIR" -type f -executable -not -path "$DIR"); do
			FILENAME=$(basename "$FILE")

			if egrep -q "^#!" "$FILE" ; then
				echo " $FILENAME"
			fi
		done
	fi
done

# Normalize the field separator back to its original value.
IFS="$PIFS"
