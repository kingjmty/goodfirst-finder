#!/usr/bin/env bash
set -e
gh auth status >/dev/null 2>&1 || { echo "Run: gh auth login"; exit 1; }
ts=$(date +%s)
tag="v1.0.$ts"
git tag "$tag"
git push origin "$tag"
gh release create "$tag" --title "Release $tag" --notes "Automated release"
echo "📦 Publicist release created"
