# template-iOS-macOS

*Template repository for my iOS and macOS projects*

## About

This repo contains default project files for iOS and macOS projects.

## Instructions

#### README template

Copy the `README-template.md` to `README.md` and fill-in.

#### SwiftLint

Add build phase script in Xcode project: `"${SRCROOT}/scripts/lint.sh"`

#### Header comment template

`IDETemplateMacros.plist` is used to [customize Xcode header comments](https://oleb.net/blog/2017/07/xcode-9-text-macros/).

Must be placed in either:
- `<PROJECT_NAME>.xcodeproj/xcshareddata/IDETemplateMacros.plist`
- `<WORKSPACE_NAME>.xcworkspace/xcshareddata/IDETemplateMacros.plist`

#### GitHub Actions

- Delete workflows that you don't need
- Update workflows with Xcode project names and schemes
- Setup Danger: add a secret in repo settings called `DANGER_GITHUB_API_TOKEN`
