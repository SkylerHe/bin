#!/bin/bash

# Check if the current directory is a Git repository
if [ -d .git ]; then
    echo "Pulling latest changes from remote repository..."
    git pull
else
    echo "Not a Git repository."
fi

