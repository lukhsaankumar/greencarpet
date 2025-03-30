#!/bin/bash

# Array of creative commit messages showcasing Bash skills
messages=(
    "🔨 Crafted a pipeline smoother than bash | sed 's/errors//g'"
    "🧹 Garbage-collected dangling pointers with rm -rf bugs/"
    "🛠️ Patched logic holes using grep -v 'bugs'"
    "🐚 Shell-scripted my way out of technical debt"
    "🎯 Debugged this faster than a sed one-liner"
    "🔥 Reduced complexity with xargs - efficiency++"
    "🚀 Commit executed at $(date '+%H:%M') via Bash cronjob wizardry"
    "📜 Updated markdown using echo 'magic' >> commit.md"
    "⚡ Optimized commit workflow—now runs O(1) thanks to Bash arrays"
)

# Select a random commit message
rand_msg=${messages[$RANDOM % ${#messages[@]}]}

# File to update
FILE="commit.md"

# Check if FILE exists, if not, create it and explicitly add to git
if [ ! -f "$FILE" ]; then
    echo "Automated 0" > "$FILE"
    git add "$FILE"
fi

# Increment the commit number using Bash arithmetic expansion
commit_num=$(($(grep -oP '(?<=Automated )\d+' "$FILE") + 1))

# Update commit.md
echo "Automated $commit_num" > "$FILE"

# Configure local git info
git config --local user.email "lukhsaankumar@users.noreply.github.com"
git config --local user.name "lukhsaankumar"

# Commit changes with creative message and timestamp
git commit -am "${rand_msg} [Commit #${commit_num}]"
