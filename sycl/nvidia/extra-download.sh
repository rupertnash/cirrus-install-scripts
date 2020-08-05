#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

build_dir=$PWD/$build_dir_name

cd $build_dir/tools/sycl/plugins/level_zero/level_zero && cmake -P $build_dir/tools/sycl/plugins/level_zero/level-zero-loader-prefix/tmp/level-zero-loader-gitclone.cmake && cmake -E touch $build_dir/tools/sycl/plugins/level_zero/level-zero-loader-prefix/src/level-zero-loader-stamp/level-zero-loader-download

# Replace the checks for updates from GitHub with no-op scripts
cd $build_dir
find . -name '*-gitupdate.cmake' -exec rm {} \+ -exec touch {} \+
