# template-iOS-macOS

*Template repository for iOS and macOS projects*

## About

This repo contains default project files for iOS and macOS projects.

## Contents

### Scripts

- `lint.sh`: run [SwiftLint](https://github.com/realm/SwiftLint). Add build phase script in Xcode project: `"${SRCROOT}/scripts/lint.sh"`

- `build_docs.sh`: run [Jazzy](https://github.com/realm/jazzy) doc generation.

### Templates

- `IDETemplateMacros.plist` to [customize Xcode header comments](https://oleb.net/blog/2017/07/xcode-9-text-macros/).
Must be placed in either:
   - `<PROJECT_NAME>.xcodeproj/xcshareddata/IDETemplateMacros.plist`
   - `<WORKSPACE_NAME>.xcworkspace/xcshareddata/IDETemplateMacros.plist`

## README template

Boilerplate to add to `README.md` files.

```markdown
## Contributing

Interested in making contributions to this project? Please review the guides below.

- [Contributing Guidelines](https://github.com/jessesquires/.github/blob/master/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/jessesquires/.github/blob/master/CODE_OF_CONDUCT.md)
- [Support and Help](https://github.com/jessesquires/.github/blob/master/SUPPORT.md)
- [Security Policy](https://github.com/jessesquires/.github/blob/master/SECURITY.md)

Also, consider [sponsoring this project](https://www.jessesquires.com/sponsor/) or [buying my apps](https://www.hexedbits.com)! ✌️

## Credits

Created and maintained by [**@jesse_squires**](https://twitter.com/jesse_squires).

## License

Released under the MIT License. See `LICENSE` for details.

> **Copyright &copy; YEAR-present Jesse Squires.**
```

