#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

mkdir -p build
cd build
cmake ../$source_dir_name \
      -DCMAKE_BUILD_TYPE=Release \
      -DOpenCL_INCLUDE_DIR=${OpenCL_INCLUDE_DIR} \
      -DCMAKE_INSTALL_PREFIX=$prefix
