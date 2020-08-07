#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

if [ "$SLURM_JOB_QOS" != "gpu" ]; then
    echo "This has to be run on the GPU nodes"
    exit 1
fi

set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

source_dir=$PWD/$source_dir_name
python3 $source_dir/buildbot/compile.py --obj-dir=$PWD/$build_dir_name
