#!/bin/bash

#  Created by Jesse Squires
#  https://www.jessesquires.com
#
#  Copyright © 2020-present Jesse Squires
#
#  Synx
#  https://github.com/venmo/synx
#  ------------------------------
#  Runs synx to sort project file and verifies that there is no diff.
#  Intended for running on CI.

set -e

PROJ_NAME="MY_PROJECT"

PROJ_FILE="$PROJ_NAME.xcodeproj/project.pbxproj"

# run synx
echo "Verifying project file..."
(set -x; bundle exec synx --quiet "$PROJ_NAME.xcodeproj")

# check git diff output
echo "Checking git diff..."
DIFF=$(set -x; git diff --name-only)

# check if diff output contains the project file
if [[ "$DIFF" =~ .*"$PROJ_FILE".* ]]; then
    echo "Error: Project file has been modified without running synx."
    echo "Please run synx to sort the project file."
    exit 1
else
    echo "No changes detected. Project file is valid."
fi

echo ""
exit
