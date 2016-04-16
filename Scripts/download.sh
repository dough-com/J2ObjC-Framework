#!/bin/bash
# set -e

if [ $# -ne 2 ]; then
  echo "usage: download.sh <version-number> <sha1_checksum>"
  exit 1
fi

j2objc_version=$1
sha1_checksum=$2
dist_path="dist"

temp_dir="$TMPDIR/"

validate_checksum() {
  $(echo "${sha1_checksum}  $1" | shasum -s -c)
}

validate_version() {
  [[ "$j2objc_version" == "$(${dist_path}/j2objc -version 2>&1 | cut -d' ' -f2)" ]]
  return
}

if [[ -d ${dist_path} ]] && validate_version; then
  echo "$(${dist_path}/j2objc -version 2>&1) is already downloaded. Recreating Framework..."
else
  zip_file="j2objc-${j2objc_version}.zip"

  cd ${temp_dir}

  if [[ ! -e $zip_file ]] || ! validate_checksum $zip_file; then
    echo "Downloading j2objc ${j2objc_version} to ${temp_dir} ..."
    curl -OL https://github.com/google/j2objc/releases/download/${j2objc_version}/j2objc-${j2objc_version}.zip
  else
    echo "Using cached archive matching sha1 checksum."
  fi

  echo "validating checksum after download/resuse"

  if ! validate_checksum $zip_file; then
    echo "Checksum validation failed. Ensure whether proper sha1 checksum or j2objc release version was given."
    exit 1
  fi

  echo "Unzipping archive..."
  unzip -o -q j2objc-${j2objc_version}.zip
  cd -
  echo "Moving j2objc-${j2objc_version} to the right place"
  mv ${temp_dir}/j2objc-${j2objc_version} ${dist_path}
  # rm j2objc-${j2objc_version}.zip
fi

framework_name="j2objc"
framework_path="Frameworks/${framework_name}.framework"

echo "Creating framework"
mkdir -p ${framework_path}
cp -a Scripts/Template/* "${framework_path}/"
cp -a ${dist_path}/include/* "${framework_path}/Headers/"
cp ${dist_path}/lib/libjre_emul.a "${framework_path}/${framework_name}"
