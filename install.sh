#!/bin/bash
set -e
set -o pipefail

BINARY_NAME="genjsonschema-cli"
CHECKSUM_FILE="$BINARY_NAME.sha256"
RELEASE_URL="https://api.github.com/repos/holgerjh/genjsonschema-cli/releases/latest"

DEPENDENCIES="curl sha256sum sed"

for dependency in $DEPENDENCIES
do
	[ "$(which "$dependency")" ] || { echo "Missing program for install.sh: '$dependency'. Inspect $(pwd)/install.sh for details."; exit 1; } 
done

echo "Fetching latest tag from $RELEASE_URL"
TAG="$(curl -sfL "$RELEASE_URL" | grep '"tag_name":' | sed -re 's/^[^:]+.*"([^"]+)".*/\1/')"
echo "Found $TAG"

DOWNLOAD_URL="https://github.com/holgerjh/genjsonschema-cli/releases/download/$TAG/genjsonschema-cli-linux-amd64"

echo "Fetching binary and checksum"
curl -sfL "$DOWNLOAD_URL.sha256" -o "$CHECKSUM_FILE"
curl -sfL "$DOWNLOAD_URL" -o "$BINARY_NAME"

echo "Verifying checksum"
sha256sum -c "$CHECKSUM_FILE"

echo "Setting permissions"
chmod +x "$BINARY_NAME"
chmod +x "command-linux.sh"

echo "Installation hook completed"

