# template-iOS-macOS

*Template repository for my iOS and macOS projects*

## About

This repo contains default project files for iOS and macOS projects.

## Instructions

### Templates

- Copy the `README-template.md` to `README.md` and fill-in details.
- Rename `PROJECT.podspec`, fill-in details.
- Fill-in details for `Package.swift`

### SwiftLint

Add build phase script in Xcode project: `"${SRCROOT}/scripts/lint.zsh"` for (`/bin/zsh` shell)

### Xcode header comments

`IDETemplateMacros.plist` is used to [customize Xcode header comments](https://oleb.net/blog/2017/07/xcode-9-text-macros/).

Fill-in details and place in either:
- `<PROJECT_NAME>.xcodeproj/xcshareddata/IDETemplateMacros.plist`
- `<WORKSPACE_NAME>.xcworkspace/xcshareddata/IDETemplateMacros.plist`

### GitHub Actions

[Software installed on macOS GitHub-hosted runners](https://github.com/actions/virtual-environments/tree/main/images/macos)

- Delete workflows that you don't need
- Update workflows with Xcode project names and schemes
- Setup Danger
    - See: [Getting Set Up](https://danger.systems/guides/getting_started.html)
    - Create a bot and [add a personal access token](https://github.com/settings/tokens/new) with `public_repo` scope
    - Add a secret in your repo settings called `DANGER_GITHUB_API_TOKEN`
