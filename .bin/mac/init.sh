#!/bin/bash

set -e

`dirname $0`/guard.sh

if [[ -e "$HOME/.config/tmux/plugins/tpm" ]]; then
	echo "SKIP: tpm is already exists."
else
	echo "CLONE: tpm"
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi
