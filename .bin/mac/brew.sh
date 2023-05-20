#!/bin/bash

set -e

`dirname $0`/guard.sh

ORIGINA_BREWFILE=`dirname $0`/.Brewfile

if [[ -e "$HOME/.Brewfile" ]]; then
	echo "SKIP: .Brewfile is already exists."
else
	cp "$ORIGINA_BREWFILE" ~/.Brewfile
	echo "CREATE: ~/.Brewfile"
fi

brew bundle --global
