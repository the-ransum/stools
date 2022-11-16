#!/bin/bash

echo "Starting the minimum installation."

if [ ! -d $HOME/bin ]; then
	mkdir -p $HOME/bin >/dev/null
	
	if [ ! -d $HOME/bin ]; then
		blurb "Failed to create directory '$HOME/bin'"
		exit 1
	fi
	
	blurb "Created directory '$HOME/bin'"
fi

# Download the toy-box scripts
echo "Installing scripts..."

toybox_scripts=("megac" "javelin" "ghost" "warpath" "aris" "tracer" "imgur" "tess" "hostc")
for script_name in ${toybox_scripts[@]}; do
		script_path=~/bin/$script_name

		if [ ! -f $script_path ]; then
			echo -n " Downloading ${script_name}."
		else
			echo -n " Updating ${script_name}."
		fi

		curl -sL "https://raw.githubusercontent.com/drampil/toy-box/main/${script_name}" > $script_path

		if [ ! -f $script_path ]; then
				echo " There was an error trying to download ${script_name}."
		else
				chmod +x $script_path
				echo " Installed ${script_name}."
		fi
done

# Download the spider_check script
if [ ! -f ~/bin/spider_check ]; then 
		echo -n " Downloading spider_check."
else
		echo -n " Updating spider_check."
fi

curl -sL "https://raw.githubusercontent.com/the-ransum/stools/main/src/spider_check.sh" > ~/bin/spider_check
if [ ! -f ~/bin/spider_check ]; then 
		echo " There was an error trying to download spider_check."
else
		chmod +x ~/bin/spider_check
		echo " Installed spider_check."
fi

echo "Script installation complete."


# Add the the users bin directory to the global PATH
if ! grep -q "\$HOME/bin" $HOME/.bashrc; then
	echo 'export PATH="$PATH:$HOME/bin"' >> $HOME/.bashrc

	echo ""
	# Prompt the user to reload bashrc or reload session
	echo -e "\033[0;33m------- IMPORTANT NOTICE -------\033[0m"
	echo -e "\033[0;33mTo finalize the installation, please refresh your session or use the command 'source ~/.bashrc' to refresh.\033[0m"
	echo -e "\033[0;33m--------------------------------\033[0m"
	echo ""
fi
