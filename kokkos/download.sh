#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))

. $thisdir/env.sh

wget https://github.com/kokkos/kokkos/archive/3.2.00.tar.gz
tar -xzf 3.2.00.tar.gz
