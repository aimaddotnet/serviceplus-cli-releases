#!/bin/bash
# ServicePlus CLI — Install Script
#
# Downloads the latest release binary, runs the installer, and removes
# all temporary files afterwards. Leaves the system with just the `sp`
# command, ready to use.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/aimaddotnet/serviceplus-cli-releases/main/install.sh | bash

set -e

REPO="aimaddotnet/serviceplus-cli-releases"
TMP_DIR="$(mktemp -d)"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

echo ""
echo -e "${BLUE}🚀 ServicePlus CLI Installer${NC}"
echo ""

echo -e "${BLUE}⏳ Fetching latest release info...${NC}"
DOWNLOAD_URL=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
    | grep '"browser_download_url"' \
    | grep '\.tar"' \
    | head -n1 \
    | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ]; then
    echo -e "${RED}❌ Could not find a release to download${NC}"
    exit 1
fi

echo -e "${BLUE}⏳ Downloading $(basename "$DOWNLOAD_URL")...${NC}"
curl -fsSL "$DOWNLOAD_URL" -o "$TMP_DIR/serviceplus-cli.tar"

echo -e "${BLUE}⏳ Extracting...${NC}"
tar -xf "$TMP_DIR/serviceplus-cli.tar" -C "$TMP_DIR"

echo -e "${BLUE}⏳ Running setup...${NC}"
cd "$TMP_DIR/serviceplus-cli"
bash setup.sh

echo ""
echo -e "${GREEN}✅ Installed! Run 'sp --help' to get started.${NC}"
echo ""
