#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

git clone https://github.com/oneapi-src/level-zero.git $source_dir_name
cd $source_dir_name
git checkout $version
