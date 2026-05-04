#!/bin/sh
# clean.sh - script to clean Buildroot build environment from the current directory

#get the directory of the script and change to it
CURRENT_DIR=$(dirname "$0")
cd "$CURRENT_DIR" || { echo "Failed to change to script directory: $CURRENT_DIR"; exit 1; }

# Change to the Buildroot directory (adjust if your buildroot directory name is different)
cd buildroot || { echo "Failed to change to buildroot directory"; exit 1; }

# Run make distclean to clean the build environment
make distclean