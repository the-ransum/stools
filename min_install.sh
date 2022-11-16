#!/bin/bash

echo "Starting the minimum installation."

echo "Setting up user bin..."
if [ ! -d $HOME/bin ]; then
	mkdir -p $HOME/bin >/dev/null
	
	if [ ! -d $HOME/bin ]; then
		echo "There was an issue trying to create user bin directory '$HOME/bin'..."
		exit 1
	else
		echo "User bin created '$HOME/bin'"
	fi
else
	echo "User bin already exists, nothing to do."
fi

# Download the toy-box scripts
echo "Installing scripts."

toybox_scripts=("megac" "javelin" "ghost" "warpath" "aris" "tracer" "imgur" "tess" "hostc")
for script_name in ${toybox_scripts[@]}; do
		echo "Downloading ${script_name}..."
		curl -sL "https://raw.githubusercontent.com/drampil/toy-box/main/${script_name}" > ~/bin/"$script_name"
		chmod +x ~/bin/"$script_name"
done

# Download the spider_check script
echo "Downloading spider_check..."
curl -sL "https://raw.githubusercontent.com/the-ransum/stools/main/src/spider_check.sh" > ~/bin/spider_check
chmod +x ~/bin/spider_check

# Download the script helper
echo "Downloading scripts..."
curl -sL "https://raw.githubusercontent.com/the-ransum/stools/main/src/scripts.sh" > ~/bin/scripts
chmod +x ~/bin/scripts

echo "Adding symbolic link for scripts_help..."
# Set symbolic link for the aliased script
if [ ! -L ~/bin/scripts_help ] || [ ! -e ~/bin/scripts_help ]; then
	ln -s ~/bin/scripts ~/bin/scripts_help
fi

echo "Installation complete."
# Add the the users bin directory to the global PATH
if ! grep -q "\$HOME/bin" $HOME/.bashrc; then
	echo 'export PATH="$PATH:$HOME/bin"' >> $HOME/.bashrc

	echo ""
	# Prompt the user to reload bashrc or reload session
	echo -e "\033[0;31m------- IMPORTANT NOTICE -------\033[0m"
	echo -e "\033[0;31mTo finalize the installation, please refresh your session or use the command 'source ~/.bashrc' to refresh.\033[0m"
	echo -e "\033[0;31m--------------------------------\033[0m"
	echo ""
fi

echo ""
echo -e "Use the command '\033[0;33mscripts\033[0m' or '\033[0;33mscripts_help\033[0m' to list all of your usable scripts."
echo ""
