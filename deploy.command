#!/usr/bin/env bash
# Argument Architect deploy helper.
# Double-click this file in Finder, or run `bash deploy.command` from Terminal.
# It commits the new README and supporting files, pushes to GitHub,
# sets the repo description / website / topics, and enables GitHub Pages.

set -e

# Move into the folder this script lives in.
cd "$(dirname "$0")"

echo "== Argument Architect: deploy =="
echo "Working directory: $(pwd)"
echo

# --- Git identity fallback (only set if not already configured) -----------------
if ! git config user.name  >/dev/null; then git config user.name  "Joshua Cole"; fi
if ! git config user.email >/dev/null; then git config user.email "joshuap.cole@icloud.com"; fi

# --- Stage, commit, push --------------------------------------------------------
git add README.md LICENSE .gitignore CONTRIBUTING.md CODE_OF_CONDUCT.md \
        .github/workflows/pages.yml \
        .github/ISSUE_TEMPLATE/bug_report.md \
        .github/ISSUE_TEMPLATE/feature_request.md \
        .github/pull_request_template.md \
        deploy.command

if git diff --cached --quiet; then
  echo "No staged changes to commit."
else
  git commit -m "Add README, license, contributing docs, and Pages workflow

- Full README with project overview, features, usage, deploy, and author.
- MIT LICENSE.
- .gitignore for editor/OS cruft.
- CONTRIBUTING and CODE_OF_CONDUCT.
- GitHub Actions workflow to deploy index.html to GitHub Pages.
- Issue and PR templates."
fi

echo
echo "Pushing to origin main..."
git push -u origin main

# --- GitHub repo metadata + Pages (requires gh CLI and auth) --------------------
if command -v gh >/dev/null 2>&1; then
  echo
  echo "Configuring repo description, website, and topics via gh..."
  gh repo edit JoshuaColePhD/Argument_Architect \
    --description "Browser-based writing and argument practice app for AP Language and first-year composition. Built by Joshua Cole, PhD." \
    --homepage "https://joshuacolephd.github.io/Argument_Architect/" \
    --add-topic education \
    --add-topic writing \
    --add-topic ap-language \
    --add-topic rhetoric \
    --add-topic composition \
    --add-topic edtech \
    --add-topic static-site \
    --add-topic html \
    --add-topic javascript

  echo
  echo "Enabling GitHub Pages (source: GitHub Actions)..."
  gh api -X POST "repos/JoshuaColePhD/Argument_Architect/pages" \
    -f "build_type=workflow" >/dev/null 2>&1 || \
  gh api -X PUT  "repos/JoshuaColePhD/Argument_Architect/pages" \
    -f "build_type=workflow" >/dev/null 2>&1 || true

  echo
  echo "Done. View the repo:"
  echo "  https://github.com/JoshuaColePhD/Argument_Architect"
  echo "Pages URL (may take a minute to build on first deploy):"
  echo "  https://joshuacolephd.github.io/Argument_Architect/"
else
  echo
  echo "NOTE: 'gh' CLI not found. Push succeeded, but repo description,"
  echo "      website URL, topics, and Pages setup were not applied."
  echo "      Install gh (https://cli.github.com) or set these in the"
  echo "      GitHub web UI under the repo's About section and Settings -> Pages."
fi

echo
echo "Press Return to close this window..."
read _
