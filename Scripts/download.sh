#!/bin/bash
set -e

if [ $# -ne 2 ]; then
  echo "usage: download.sh <version-number> <sha1_checksum>"
  exit 1
fi

j2objc_version=$1
sha1_checksum=$2
dist_path="dist"

if [[ -d ${dist_path} ]] && [ "$j2objc_version" == $(${dist_path}/j2objc -version 2>&1 | cut -d' ' -f2) ]; then
  echo "$(${dist_path}/j2objc -version 2>&1) is already downloaded. Recreating Framework..."
else
  echo "fetching j2objc dist"
  curl -OL https://github.com/google/j2objc/releases/download/${j2objc_version}/j2objc-${j2objc_version}.zip
  echo "${sha1_checksum}  j2objc-${j2objc_version}.zip" | shasum -c
  unzip -o -q j2objc-${j2objc_version}.zip
  mv j2objc-${j2objc_version} ${dist_path}
  rm j2objc-${j2objc_version}.zip
fi

framework_name="j2objc"
framework_path="Frameworks/${framework_name}.framework/"

echo "Creating framework"
mkdir -p ${framework_path}
cp -a ${dist_path}/include/* "${framework_path}"
cp ${dist_path}/lib/libjre_emul.a "${framework_path}/${framework_name}"
