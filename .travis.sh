#!/usr/bin/env bash

cargo build --release

if [[ "$TRAVIS_OS_NAME" == "windows" ]]; then
  cd target/release || exit 1;
  7z a -tzip ../../y2jj2y_windows.zip yaml2json.exe json2yaml.exe:
  cd ../..;
  VERSION="$(git describe --always --tags --dirty)";
  BUILD_TRIPLET="$($CC -dumpmachine)";
  mv y2jj2y_windows.zip "y2jj2y-${VERSION}-windows-${BUILD_TRIPLET}.zip";
  ls -l;
fi

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  tar -C "target/release" -czf y2jj2y_osx.tar.gz yaml2json json2yaml;
  VERSION="$(git describe --always --tags --dirty)";
  BUILD_TRIPLET="$($CC -dumpmachine)";
  mv y2jj2y_osx.tar.gz "y2jj2y-${VERSION}-${BUILD_TRIPLET}.tar.gz";
  ls -l;
fi

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  tar -C "target/release" -czf y2jj2y_linux.tar.gz yaml2json json2yaml;
  VERSION="$(git describe --always --tags --dirty)";
  BUILD_TRIPLET="$($CC -dumpmachine)";
  mv y2jj2y_linux.tar.gz "y2jj2y-${VERSION}-${BUILD_TRIPLET}.tar.gz";
  ls -l;
fi
