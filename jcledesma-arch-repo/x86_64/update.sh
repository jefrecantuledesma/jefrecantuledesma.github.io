#!/bin/bash

# Path to your personal Arch repo
REPO_PATH="."
REPO_NAME="jcledesma-arch-repo"

# Check if the repo path exists
if [ ! -d "$REPO_PATH" ]; then
  echo "Error: Repository path $REPO_PATH does not exist."
  exit 1
fi

# Add all .pkg.tar.zst files in the current directory to the repo
for pkg in *.pkg.tar.zst; do
  if [ -e "$pkg" ]; then
    echo "Adding $pkg to the repository..."
    repo-add "$REPO_PATH/$REPO_NAME.db.tar.gz" "$REPO_PATH/$pkg"
  else
    echo "No .pkg.tar.zst files found in the current directory."
    exit 1
  fi
done

echo "Repository update complete."

