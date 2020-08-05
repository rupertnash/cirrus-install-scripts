#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

source=$PWD/OpenCL-ICD-Loader

mkdir -p build
cd build
cmake $source \
      -DCMAKE_BUILD_TYPE=Release \
      -DOPENCL_ICD_LOADER_HEADERS_DIR=$OpenCL_INCLUDE_DIR \
      -DCMAKE_INSTALL_PREFIX=$prefix
