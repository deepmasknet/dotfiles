#!/bin/bash

# Specify the text file path
FILE_PATH="$HOME/Documents/tasks.txt"

# Ensure the file exists (create if missing)
touch "$FILE_PATH"

# Open the file in the CLI with Vim
gnome-terminal -- bash -c "vim '$FILE_PATH'; exec bash"
