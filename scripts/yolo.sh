#!/usr/bin/env bash
set -e
gh auth status >/dev/null 2>&1 || { echo "Run: gh auth login"; exit 1; }
ts=$(date +%s)
branch="yolo-$ts"
git checkout -b "$branch"
echo "$ts" >> yolo.txt
git add .
git commit -m "YOLO automation"
git push -u origin "$branch"
gh pr create --title "YOLO $ts" --body "Automated PR"
gh pr merge --auto --squash
echo "🚀 YOLO completed"
