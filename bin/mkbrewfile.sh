#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Usage
# -----------------------------------------------------------------------------
#   1. Save, chmod +x, and run this script on Computer #1.
#   2. Copy the new "Brewfile" from this script's directory to Computer #2.
#   3. Run `brew bundle` from the Brewfile's directory on Computer #2.
#   4. Get a coffee or something while everything installs.
#   5. Enjoy all your Homebrew packages from Computer #1 on Computer #2!
# -----------------------------------------------------------------------------
brewfile=../home/Brewfile

if [ -e $brewfile ]; then
	rm $brewfile
fi

echo "update" >> $brewfile
echo "upgrade" >> $brewfile
echo "" >> $brewfile

while read tap; do
    echo "tap ${tap}" >> $brewfile
done < <(brew tap)

echo "" >> $brewfile

while read formula; do
    echo "install ${formula}" >> $brewfile
done < <(brew leaves)

echo "" >> $brewfile

while read cask; do
    echo "cask install ${cask}" >> $brewfile
done < <(brew cask list | sed -e "s/ /\n/g")

echo "" >> $brewfile

echo "cask alfred link" >> $brewfile

