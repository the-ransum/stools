# Stools

Stools is just a handful of security tools made to help in the reducing the 
load to perform security audits and to prevent incidents when performing 
high severity audits.

## Requirements

- Operating System: Linux, macOS, and UNIX-based.
- A shell...

## Installation

### Installing 

1. From the terminal you can call the install script directory.
2. `bash <(wget -q -O - https://raw.githubusercontent.com/the-ransum/stools/main/install --no-check-certificate --no-cache --no-cookies 2>/dev/null)`
3. Let the installation complete
4. Hack the planet.

**Example Output** -
```bash
[user@trashcan] $ bash <(wget -q -O - https://raw.githubusercontent.com/the-ransum/stools/main/install --no-check-certificate --no-cache --no-cookies 2>/dev/null)
Clearing out the old stuff. Done.
Downloading, this could take a minute. Done.
Unzipping... Done.
Adding /home/user/scripts/stools/bin to path. Done.
Cleaning out the garbage. Done.
Install Complete.

To finalize the install, please refresh your terminal or use 'source ~/.bashrc' to refresh.

To view the scripts use the following 'stools --list'.
[user@trashcan] $ 
```


### Updates

Stools should automatically self update every 7 days, but you can also manually 
update if necessary.

1. Use the `--update` flag when calling `stools` from the command line.
2. Command: `stools --update`

**Example Output** -
```bash
[user@trashcan] $ stools --update
No updates available.
[user@trashcan] $ 
```

### Uninstalling

1. Use the `--uninstall` flag when calling `stools` from the command line.
2. Command: `stools --uninstall`
3. Pour one out for the homie...
4. 
**Example Output** -
```bash
[user@trashcan] $ stools --uninstall
Removing PATH from .bashrc profile.
Nuking repository in '/home/user/scripts/stools'.
Uninstall complete.

To finalize the uninstallation, please refresh your terminal or use 'source ~/.bashrc' to refresh.
[user@trashcan] $ 
```


## File Structure

- `/bin` - Symbolic link farm
- `/src` - Source files
- `/install` - Install script
- `/README.md` - Repository README
- `/CONTRIBUTING.md` - Guide for Contributors
- `/CODE_OF_CONDUCT.md` - The contributers Code of Conduct
- `/LICENSE.md` - License agreement

