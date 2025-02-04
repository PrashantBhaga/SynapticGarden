#!/bin/bash
set -euo pipefail

# Paths
OBSIDIAN_POSTS="/Users/prashantbhaga/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/posts"
HUGO_POSTS="content/posts"

# Ensure directories exist
mkdir -p "$HUGO_POSTS"

# Sync posts from Obsidian to Hugo
echo "Syncing posts from Obsidian to Hugo..."
rsync -av --delete "$OBSIDIAN_POSTS/" "$HUGO_POSTS/"

# Build the site
echo "Building site..."
hugo

# Add changes to git
git add .
git commit -m "Update site content $(date '+%Y-%m-%d %H:%M:%S')"
git push

echo "Deployment complete! Changes should be live in a few minutes."