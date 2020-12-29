# Targets are the format <product>: <dependencies>
# Product on the left must be re-built if dependency on the right changes

SELF_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

.DEFAULT: install

# == Main ==
.PHONY: install
install: pods

# == Bundler ==
.PHONY: bundle
bundle: vendor

.bundle/config:
    bundle config --local &> /dev/null
    bundle config --local path vendor/bundle &> /dev/null
    bundle config --local disable_shared_gems true &> /dev/null

vendor: .bundle/config Gemfile.lock Gemfile
    bundle install --without=documentation --jobs 4 --retry 3 && touch $@

# == CocoaPods ==
.PHONY: pods
pods: pod-helper Pods

# Helper target that touches the Podfile if the
# Manifest.lock is out of sync with the Podfile.lock
# Ignores file system errors such as missing Pods directory on first run
.PHONY: pod-helper
pod-helper:
    -diff -q "$(SELF_DIR)Podfile.lock" "$(SELF_DIR)Pods/Manifest.lock" > /dev/null || touch "$(SELF_DIR)Podfile.lock"

Pods: vendor Podfile.lock Podfile
    bundle exec pod install && touch $@

.PHONY: update-pod-specs
update-pod-specs:
    bundle exec pod repo update

# == Linting ==
.PHONY: format
format:
    make lint
    make xcodeproj

.PHONY: lint
lint:
    swiftlint autocorrect --config ./.swiftlint.yml

.PHONY: xcodeproj
xcodeproj:
    bundle exec synx PROJECT.xcodeproj

# == Utility ==
.PHONY: open
open:
    open PROJECT.xcworkspace

.PHONY: clean
clean:
    rm -rf Pods
    rm -rf vendor
    rm -rf .bundle

# == Help menu and docs ==
.PHONY: help
help:
    @echo "Make options:"
    @echo ""
    @echo "  [none]            - Default. Bootstraps entire project setup. (Installs pods, etc.)"
    @echo ""
    @echo "  pods              - Install gems via bundler, install CocoaPods, and run pod install."
    @echo "  update-pod-specs  - Updates CocoaPods dependencies."
    @echo ""
    @echo "  format            - Runs make xcodeproj and make lint."
    @echo "  xcodeproj         - Verifies and sorts .xcodeproj file using synx."
    @echo "  lint              - Runs SwiftLint and autocorrects violations when possible."
    @echo "  clean             - Deletes CocoaPods and bundler setup to start fresh."
    @echo ""
    @echo "  open              - Opens project in Xcode."
    @echo ""
