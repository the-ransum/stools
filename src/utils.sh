# Requires a variable $quiet to be set to either 0/1 for 
# 0 - quiet mode
# 1 - verbose mode
function blurb {
	if [ $quiet -eq 0 ]; then
		echo "$@"
	fi
}