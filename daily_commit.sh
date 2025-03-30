#!/bin/bash

FILE="commit.md"

# Check if file exists; create if not
if [ ! -f "$FILE" ]; then
  echo "Automated 0" > "$FILE"
fi

# Extract current commit count from file
CURRENT_COUNT=$(grep -oP '(?<=Automated )\d+' "$FILE")

# Increment commit count
NEXT_COUNT=$((CURRENT_COUNT + 1))

# Update file
echo "Automated $NEXT_COUNT" > "$FILE"

# Git operations
git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"

git add "$FILE"
git commit -m "Daily commit #$NEXT_COUNT [Automated]"
git push
