#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

wget https://github.com/ninja-build/ninja/releases/download/v1.10.0/ninja-linux.zip
unzip ninja-linux.zip
