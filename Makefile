#  Created by Jesse Squires
#  https://www.jessesquires.com
#
#  Copyright © 2020-present Jesse Squires
#
#  ------------------------------
#  Makefile for building project and performing various tasks.
#  Targets are the format <product>: <dependencies>
#  Product on the left must be re-built if dependency on the right changes

PROJECT_NAME = PROJECT
SELF_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

# == Default target ==
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
	bundle config set --local without 'documentation'

vendor: .bundle/config Gemfile.lock Gemfile
	bundle install --jobs 4 --retry 3 && touch vendor

.PHONY: update-bundle
update-bundle:
	bundle update --all
	bundle update --bundler

# == CocoaPods ==
.PHONY: pods
pods: pod-helper pod-install

# Helper target that touches the Podfile if the
# Manifest.lock is out of sync with the Podfile.lock
# Ignores file system errors such as missing Pods directory on first run
.PHONY: pod-helper
pod-helper:
	-diff -q "$(SELF_DIR)Podfile.lock" "$(SELF_DIR)Pods/Manifest.lock" > /dev/null || touch "$(SELF_DIR)Podfile.lock"

pod-install: vendor Podfile.lock Podfile
	bundle exec pod install && touch Pods

.PHONY: update-pods
update-pods:
	bundle exec pod repo update
	bundle exec pod update

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
	bundle exec synx $(PROJECT_NAME).xcodeproj

# == Utility ==
.PHONY: open
open:
	open $(PROJECT_NAME).xcworkspace

.PHONY: clean
clean:
	rm -rf Pods
	rm -rf vendor
	rm -rf .bundle

.PHONY: update-all
update-all:
	make update-pods
	make update-bundle

# == Help menu and docs ==
.PHONY: help
help:
	@echo "Make options:"
	@echo ""
	@echo "  [none]            - Default. Runs make install."
	@echo ""
	@echo "  install           - Bootstraps entire project. (Sets up bundler, installs pods, etc.)"
	@echo "  clean             - Deletes CocoaPods and Bundler setup to start fresh."
	@echo ""
	@echo "  pods              - Installs gems via Bundler, installs CocoaPods, and runs pod install."
	@echo ""
	@echo "  update-all        - Updates all dependencies."
	@echo "  update-pods       - Updates CocoaPods dependencies."
	@echo "  update-bundle     - Updates Bundler dependencies."
	@echo ""
	@echo "  format            - Runs make xcodeproj and make lint."
	@echo "  xcodeproj         - Verifies and sorts .xcodeproj file using synx."
	@echo "  lint              - Runs SwiftLint and autocorrects violations when possible."
	@echo ""
	@echo "  open              - Opens $(PROJECT_NAME).xcworkspace in Xcode."
	@echo ""
