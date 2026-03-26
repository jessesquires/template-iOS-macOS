#!/bin/zsh

set -e

echo "Running swift-format $(swift-format -v)"

swift-format format \
    --recursive \
    --in-place \
    --parallel \
    --ignore-unparsable-files \
    --color-diagnostics \
    --configuration .swift-format \
    .

echo "Done"
