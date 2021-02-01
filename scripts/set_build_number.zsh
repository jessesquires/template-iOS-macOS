#!/bin/zsh

#  Created by Jesse Squires
#  https://www.jessesquires.com
#
#  Copyright © 2021-present Jesse Squires
#
#  Sets the build number in an Xcode project to the number of commits.
#  Docs: https://mokacoding.com/blog/automatic-xcode-versioning-with-git/

echo "Setting build numbers..."

git=$(sh /etc/profile; which git)
number_of_commits=$("$git" rev-list HEAD --count)
git_release_version=$("$git" describe --tags --always --abbrev=0)

echo "Commit count: $number_of_commits"
echo "Tag: $git_release_version"

target_plist="$TARGET_BUILD_DIR/$INFOPLIST_PATH"
dsym_plist="$DWARF_DSYM_FOLDER_PATH/$DWARF_DSYM_FILE_NAME/Contents/Info.plist"

for plist in "$target_plist" "$dsym_plist"; do
    if [ -f "$plist" ]; then
        /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $number_of_commits" "$plist"
        /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${git_release_version#*v}" "$plist"
    fi
done

echo "Done."
