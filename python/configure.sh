#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))

. $thisdir/env.sh

srcdir=$PWD/$source_dir_name

mkdir -p $build_dir_name

cd pybuild
$srcdir/configure --srcdir=$srcdir --prefix=$prefix --libdir=$prefix/lib --with-system-ffi --with-openssl=$(pkg-config --variable=prefix openssl) --enable-optimizations
