#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

build_dir=$PWD/$build_dir_name

cd $build_dir/tools/sycl/OpenCL && cmake -P $build_dir/tools/sycl/ocl-headers-prefix/tmp/ocl-headers-gitclone.cmake && cmake -E touch $build_dir/tools/sycl/ocl-headers-prefix/src/ocl-headers-stamp/ocl-headers-download
cd $build_dir/tools/sycl/plugins/level_zero/level_zero && cmake -P $build_dir/tools/sycl/plugins/level_zero/level-zero-loader-prefix/tmp/level-zero-loader-gitclone.cmake && cmake -E touch $build_dir/tools/sycl/plugins/level_zero/level-zero-loader-prefix/src/level-zero-loader-stamp/level-zero-loader-download
cd $build_dir/tools/sycl/OpenCL && cmake -P $build_dir/tools/sycl/ocl-icd-prefix/tmp/ocl-icd-gitclone.cmake && cmake -E touch $build_dir/tools/sycl/ocl-icd-prefix/src/ocl-icd-stamp/ocl-icd-download
cd $build_dir/tools/opencl-aot/OpenCL && cmake -P $build_dir/tools/opencl-aot/opencl-headers-prefix/tmp/opencl-headers-gitclone.cmake && cmake -E touch $build_dir/tools/opencl-aot/opencl-headers-prefix/src/opencl-headers-stamp/opencl-headers-download
cd $build_dir/tools/opencl-aot/OpenCL && cmake -P $build_dir/tools/opencl-aot/opencl-icd-prefix/tmp/opencl-icd-gitclone.cmake && cmake -E touch $build_dir/tools/opencl-aot/opencl-icd-prefix/src/opencl-icd-stamp/opencl-icd-download

# Replace the checks for updates from GitHub with no-op scripts
cd $build_dir
find . -name '*-gitupdate.cmake' -exec rm {} \+ -exec touch {} \+
