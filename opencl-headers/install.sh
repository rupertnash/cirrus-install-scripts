#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

mkdir -p $prefix/include

if [ -d $prefix/include/CL ]; then
   rm -r $prefix/include/CL
fi

cp -r OpenCL-Headers/CL $prefix/include/
