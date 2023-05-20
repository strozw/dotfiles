#!/bin/bash

set -e

`dirname $0`/guard.sh

echo "Dumping Brewfile..."

brew bundle dump

mv -f Brewfile .bin/

echo "Done!"

