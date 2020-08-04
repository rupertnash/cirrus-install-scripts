#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

# Ensure we have an up-to-date version of the sycl branch
if [ -d $source_dir_name ]; then
    pushd $source_dir_name
    git checkout sycl
    git pull
else
    git clone https://github.com/intel/llvm -b sycl $source_dir_name
    pushd $source_dir_name
fi

# Now checkout the target tag
git checkout $version

popd

mkdir -p deps
pushd deps

if [ ! -d vc-intrinsics ]; then
    git clone https://github.com/intel/vc-intrinsics.git
fi
