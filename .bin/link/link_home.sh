#!/bin/bash


###############################################
# link `home` files to `~/` files
###############################################

TARGET_HOME_DIR="$HOME"

cd "$(dirname "$0")/../../home"

HOME_DIR="$(pwd)"

for path in "${HOME_DIR}"/.??*; do
	[[ "$path" == "${HOME_DIR}/.DS_Store" ]] && continue
	[[ "$path" == "${HOME_DIR}/.config" ]] && continue

	TARGET="$TARGET_HOME_DIR/$(basename "$path")"

	if [[ -L "$TARGET" ]]; then
		echo "OVERIDE: $(ln -insv "$path" "$TARGET_HOME_DIR")"
	else
		echo "LINK: $(ln -fnsv "$path" "$TARGET_HOME_DIR")"
	fi
done
