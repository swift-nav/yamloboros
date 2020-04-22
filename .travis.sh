#!/usr/bin/env bash

set -euo pipefail

cargo build --release

VERSION="$(git describe --always --tags)";
BUILD_TRIPLET="$($CC -dumpmachine)";

echo "VERSION: $VERSION"
echo "BUILD_TRIPLET: $BUILD_TRIPLET"

if [[ "$TRAVIS_OS_NAME" == "windows" ]]; then
  cd target/release || exit 1;
  7z a -tzip ../../y2jj2y_windows.zip yaml2json.exe json2yaml.exe;
  cd ../..;
  mv y2jj2y_windows.zip "y2jj2y-${VERSION}-${BUILD_TRIPLET}.zip";
  ls -l;
fi

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  tar -C "target/release" -czf y2jj2y_osx.tar.gz yaml2json json2yaml;
  mv y2jj2y_osx.tar.gz "y2jj2y-${VERSION}-${BUILD_TRIPLET}.tar.gz";
  ls -l;
fi

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  tar -C "target/release" -czf y2jj2y_linux.tar.gz yaml2json json2yaml;
  mv y2jj2y_linux.tar.gz "y2jj2y-${VERSION}-${BUILD_TRIPLET}.tar.gz";
  ls -l;
fi
