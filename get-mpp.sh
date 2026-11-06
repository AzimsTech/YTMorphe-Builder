#!/bin/bash
set -euo pipefail

VARIANT="${VARIANT:-morphe}"
. "$(dirname "$0")/variants/${VARIANT}.env"

CHANNEL="${RELEASE_CHANNEL:-dev}"
API="https://api.github.com/repos/${PATCHES_REPO}/releases"

if [[ "$CHANNEL" == "stable" ]]; then
  # /releases/latest is the newest non-prerelease, non-draft release.
  releases=$(curl -sL "${API}/latest")
  releases=$(echo "$releases" | jq -c '[.]')
else
  # Newest release by publish date, prereleases included.
  releases=$(curl -sL "${API}?per_page=10")
fi

# Latest release by publish date
latest_tag=$(echo "$releases" \
  | jq -r 'sort_by(.published_at) | last | .tag_name // empty')


[ -n "$latest_tag" ] || { echo "❌ No ${CHANNEL} release found" >&2; exit 1; }

# Version-only mode
if [[ "${1:-}" == "--version-only" ]]; then
  echo "Morphe Patches ${CHANNEL} version: $latest_tag" >&2 # log to console
  echo "$latest_tag"
  exit 0
fi

echo "Found ${CHANNEL} release: $latest_tag" >&2

# Download the .mpp file
download_url=$(echo "$releases" \
  | jq -r --arg tag "$latest_tag" '
    .[] | select(.tag_name == $tag) | .assets[]
    | select(.name | test("^patches-.*\\.mpp$"))
    | .browser_download_url' | head -n1)

[ -n "$download_url" ] || { echo "❌ No .mpp found for $latest_tag" >&2; exit 1; }

curl -L "$download_url" -o "${download_url##*/}"
echo "Downloaded: ${download_url##*/}"
