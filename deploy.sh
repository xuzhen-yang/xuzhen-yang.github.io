#!/bin/bash
set -e

DEPLOY_DIR="/Users/yangxuzhen/Library/CloudStorage/OneDrive-MichiganStateUniversity/05_Spark/01_Portfolio/xuzhenyang"

echo "Building site..."
hugo --minify

echo "Copying to deploy folder..."
rsync -a --delete public/ "$DEPLOY_DIR/"

echo "Pushing to GitHub..."
cd "$DEPLOY_DIR"
git add .
git commit -m "Update site $(date '+%Y-%m-%d %H:%M')"
git push

echo "Done! Site is live."
