# Arch Update
A tool to update and configure archlinux. The main script runs each of the executable '.sh' files in the /scripts directory.

## Script Template
Here is an example script template:

```bash
#!/bin/bash
set -Eeuo pipefail
trap "echo -e \"\033[1;31m[!] \e[0mScript error occured in $0.\"" ERR

BLUE="\033[1;34m"
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
ENDCOLOR="\e[0m"

# === Exit without proceeding if the below condition is met ===
if [ -f /some/file/exists ]; then
    exit 0
fi

echo -ne $BLUE"[i] "$ENDCOLOR; echo "Template script has executed"
echo -ne $GREEN"[+] "$ENDCOLOR; echo "Showing Green message"
echo -ne $YELLOW"[>] "$ENDCOLOR; echo "Showing Yellow message"
echo -ne $RED"[!] "$ENDCOLOR; echo "Showing Red message"
```