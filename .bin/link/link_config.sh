#!/bin/bash

###############################################
# link `home/.config` files to `~/.config` files
###############################################
cd "$(dirname "$0")/../../home/.config"

CONFIG_DIR="$(pwd)"

mkdir -p "$HOME/.config"

for path in "${CONFIG_DIR}"/*; do
	[[ "$path" == "${CONFIG_DIR}/.DS_Store" ]] && continue

	TARGET_PATH="$HOME/.config/$(basename "$path")"

	if [[ -L "$TARGET_PATH" ]]; then
		echo "OVERRIDE: $(ln -insv "$path" "$TARGET_PATH")"
	else
		echo "LINK: $(ln -fnsv "$path" "$TARGET_PATH")"
	fi
done
