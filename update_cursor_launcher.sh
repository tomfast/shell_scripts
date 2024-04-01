#!/bin/bash

# Define variables
APP_NAME="Cursor"
DESKTOP_FILE="$HOME/.local/share/applications/cursor.desktop"
ICON_PATH="$HOME/.icon/cursor.svg"
APPIMAGE_DIR="$HOME/AppImages"
# Find the latest version of the AppImage. Adjust the pattern if necessary.
LATEST_APPIMAGE=$(ls -t "$APPIMAGE_DIR"/cursor-*.AppImage | head -n 1)

if [ -z "$LATEST_APPIMAGE" ]; then
    echo "No AppImage found. Exiting."
    exit 1
fi

# Create or update the .desktop file
echo "[Desktop Entry]" > "$DESKTOP_FILE"
echo "Type=Application" >> "$DESKTOP_FILE"
echo "Name=$APP_NAME" >> "$DESKTOP_FILE"
echo "Comment=${APP_NAME} AppImage Launcher" >> "$DESKTOP_FILE"
echo "Icon=$ICON_PATH" >> "$DESKTOP_FILE"
echo "Exec=$LATEST_APPIMAGE" >> "$DESKTOP_FILE"
echo "Terminal=false" >> "$DESKTOP_FILE"
echo "Categories=Utility;Application;" >> "$DESKTOP_FILE"

echo "Updated .desktop file at $DESKTOP_FILE with latest AppImage."
