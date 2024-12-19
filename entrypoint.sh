#!/bin/bash

echo "=============="
ENV GITHUB_ACTOR=actor-placeholder
ENV INPUT_EMAIL=email-placeholder@example.com

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py || { echo "Python script failed"; exit 1; }

python3 /usr/bin/feed.py

git add -A
git commit -m "Update Feed" || echo "Nothing to commit"

git push --set-upstream origin main || { echo "Git push failed"; exit 1; }

echo "=============="