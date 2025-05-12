#!/usr/bin/env bash
set -e

# Variables
REPO_OWNER="MicrochipTech"
REPO_NAME="fpga-hls-examples"
ASSET_NAME="precompiled-binaries.zip"
TAG="2024.1"

DOWNLOAD_DIR=".precompiled-binaries_cache"

ASSET_PATH="$DOWNLOAD_DIR/$ASSET_NAME"

echo "Downloading the release asset $ASSET_NAME for tag $TAG"
mkdir -p "$DOWNLOAD_DIR"
GITHUB_API_URL="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/tags/$TAG"
DOWNLOAD_URL=$(curl -s "$GITHUB_API_URL" | jq -r ".assets[] | select(.name == \"$ASSET_NAME\") | .browser_download_url")
if [ -z "$DOWNLOAD_URL" ]; then
    echo "Failed to find asset download URL."
    exit 1
fi
curl -L "$DOWNLOAD_URL" -o "$ASSET_PATH"

echo "Unzipping $ASSET_PATH"
unzip -o "$ASSET_PATH" -d "."
rm -rf "$DOWNLOAD_DIR"

echo "Download and extract completed successfully."
