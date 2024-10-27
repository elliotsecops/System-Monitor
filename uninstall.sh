#!/bin/bash

DEST_DIR="$HOME/.local/bin"
DEST_SCRIPT="system_monitor"

if [[ -f "$DEST_DIR/$DEST_SCRIPT" ]]; then
    rm "$DEST_DIR/$DEST_SCRIPT"
    echo "The script '$DEST_SCRIPT' has been uninstalled from '$DEST_DIR'."
else
    echo "The script '$DEST_SCRIPT' is not installed in '$DEST_DIR'."
fi
