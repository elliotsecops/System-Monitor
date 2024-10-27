#!/bin/bash

# Define the source and destination paths
SOURCE_SCRIPT="system_monitor.sh"
DEST_DIR="$HOME/.local/bin"
DEST_SCRIPT="system_monitor"

# Check if the source script exists
if [[ ! -f "$SOURCE_SCRIPT" ]]; then
    echo "Error: The source script '$SOURCE_SCRIPT' does not exist."
    exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy the script to the destination directory
cp "$SOURCE_SCRIPT" "$DEST_DIR/$DEST_SCRIPT"

# Make the script executable
chmod +x "$DEST_DIR/$DEST_SCRIPT"

# Inform the user
echo "The script '$SOURCE_SCRIPT' has been installed to '$DEST_DIR/$DEST_SCRIPT'."
echo "You can now run 'system_monitor' from any directory."
