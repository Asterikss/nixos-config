#!/usr/bin/env bash

# 1. Checks if ".dev" folder exists in the current directory.
#    - If it does, exits with a message that ".dev" already exists.
#    - If not, creates ".dev" folder.
# 2. Searches "~/cave/notes_proj/" for a directory matching the current folder
#    name.
# 3. If found, symlinks it into the ".dev" folder.
# 4. If not found, creates an empty directory under "~/cave/notes_proj/" with
#    the same name, then symlinks it into the ".dev" folder.

CURRENT_DIR_NAME="$(basename "$PWD")"

NOTES_PATH=~/cave/notes_proj
TARGET_DIR="$NOTES_PATH/$CURRENT_DIR_NAME"

if [ -d ".dev" ]; then
  echo "Error: .dev/ folder already exists. Exiting."
  exit 1
fi

echo "Initializing .dev/ ..."

if [ -d "$TARGET_DIR" ]; then
  echo "Directory '$CURRENT_DIR_NAME' already exists in $NOTES_PATH."
else
  echo "Directory '$CURRENT_DIR_NAME' does not exist in $NOTES_PATH. Creating an empty directory..."
  mkdir -p "$TARGET_DIR"
fi

ln -s "$TARGET_DIR" ".dev"
echo "Symlink created: .dev/ -> $TARGET_DIR"
