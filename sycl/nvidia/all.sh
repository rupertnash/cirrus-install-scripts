#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e

thisdir=$(readlink -f $(dirname $BASH_SOURCE))

$thisdir/../download.sh
sbatch --wait $thisdir/backend.sh $thisdir/configure.sh
$thisdir/extra-download.sh
sbatch --wait $thisdir/backend.sh $thisdir/build.sh
$thisdir/module.sh
sbatch --wait $thisdir/backend.sh $thisdir/test.sh
