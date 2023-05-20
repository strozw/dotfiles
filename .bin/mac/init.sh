#!/bin/bash

set -e

`dirname $0`/guard.sh

brew bundle --global

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
