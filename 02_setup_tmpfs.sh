#!/bin/bash
if [ -z "$SVC_NAME" ]; then
    echo "Error: \$SVC_NAME is not set."
    echo "Please run: export SVC_NAME=bgdsvc_tazbir12"
    exit 1
fi

TARGET_DIR="/mnt/${SVC_NAME}_tmp"

echo "Setting up tmpfs scratch space at: $TARGET_DIR"

sudo mkdir -p "$TARGET_DIR"

if mountpoint -q "$TARGET_DIR"; then
    echo "tmpfs is already mounted at $TARGET_DIR"
else
    echo "Mounting 256M tmpfs filesystem..."
    sudo mount -t tmpfs -o size=256M tmpfs "$TARGET_DIR"
fi

echo "Setting permissions for $SVC_NAME..."
sudo chown "$SVC_NAME:$SVC_NAME" "$TARGET_DIR"

echo -e "\n--- Mount Verification ---"
df -h "$TARGET_DIR"