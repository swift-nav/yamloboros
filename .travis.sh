#!/usr/bin/env bash

set -euo pipefail

cargo build --release

VERSION="$(git describe --always --tags)";
BUILD_TRIPLET="$($CC -dumpmachine)";

echo "VERSION: $VERSION"
echo "BUILD_TRIPLET: $BUILD_TRIPLET"

if [[ "$TRAVIS_OS_NAME" == "windows" ]]; then
  cd target/release || exit 1;
  7z a -tzip ../../yamloboros_windows.zip yaml2json.exe json2yaml.exe;
  cd ../..;
  mv yamloboros_windows.zip "yamloboros-${VERSION}-${BUILD_TRIPLET}.zip";
  ls -l;
fi

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  tar -C "target/release" -czf yamloboros_osx.tar.gz yaml2json json2yaml;
  mv yamloboros_osx.tar.gz "yamloboros-${VERSION}-${BUILD_TRIPLET}.tar.gz";
  ls -l;
fi

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  tar -C "target/release" -czf yamloboros_linux.tar.gz yaml2json json2yaml;
  mv yamloboros_linux.tar.gz "yamloboros-${VERSION}-${BUILD_TRIPLET}.tar.gz";
  ls -l;
fi
