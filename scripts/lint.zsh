#!/bin/zsh

#  Created by Jesse Squires
#  https://www.jessesquires.com
#
#  Copyright © 2020-present Jesse Squires
#
#  SwiftLint: https://github.com/realm/SwiftLint/releases/latest
#
#  Runs SwiftLint and checks for installation of correct version.

set -e
export PATH="$PATH:/opt/homebrew/bin"

if [[ "${GITHUB_ACTIONS}" ]]; then
    # ignore on GitHub Actions
    exit 0
fi

LINK="https://github.com/realm/SwiftLint"
INSTALL="brew install swiftlint"

if ! which swiftlint >/dev/null; then
    echo "
    Error: SwiftLint not installed!

    Download: $LINK
    Install: $INSTALL
    "
    exit 0
fi

PROJECT="PROJECT.xcodeproj"
SCHEME="SCHEME"

VERSION="0.63.2"
FOUND=$(swiftlint version)
CONFIG="./.swiftlint.yml"

MODE=$1

if [[ -z "$MODE" ]] || [[ "$MODE" != "fix" && "$MODE" != "analyze" ]]; then
    echo "Error: invalid arguments."
    echo "Usage: $0 <fix|analyze> [swiftlint options...]"
    exit 1
fi

shift

echo "Running swiftlint $FOUND..."

if [[ "$MODE" == "fix" ]]; then
    swiftlint --fix --progress --config "$CONFIG" "$@" && swiftlint --config "$CONFIG" "$@"
elif [[ "$MODE" == "analyze" ]]; then
    LOG=$(mktemp -t xcodebuild.log.XXXXXX)
    trap '[[ -n "$LOG" && -f "$LOG" ]] && rm -f -- "$LOG"' EXIT
    echo "Running analyze..."
    xcodebuild -scheme "$SCHEME" -project "$PROJECT" clean build-for-testing >"$LOG" 2>&1
    swiftlint analyze --fix --progress --format --strict --config "$CONFIG" --compiler-log-path "$LOG" "$@"
fi

if [ $FOUND != $VERSION ]; then
    echo "
    Warning: incorrect SwiftLint installed! Please upgrade.
    Expected: $VERSION
    Found: $FOUND

    Download: $LINK
    Install: $INSTALL
    "
fi

exit 0
