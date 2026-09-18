#!/bin/bash

if [ -z "$SVC_NAME" ]; then
    echo "Error: \$SVC_NAME is not set."
    exit 1
fi

# Clean export command in your terminal if needed:
# export SVC_NAME=bgdsvc_tazbir12

if id "$SVC_NAME" &>/dev/null; then
    echo "User '$SVC_NAME' already exists."
else
    sudo useradd -r -s /sbin/nologin "$SVC_NAME"
    echo "User '$SVC_NAME' created successfully."
fi

id "$SVC_NAME"
getent passwd "$SVC_NAME"