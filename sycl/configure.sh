#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi

if [ "$SLURM_JOB_QOS" != "gpu" ]; then
    echo "This has to be run on the GPU nodes"
    return 1
fi

set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

source_dir=$PWD/$source_dir_name
mkdir -p $build_dir_name

python3 $source_dir/buildbot/configure.py --obj-dir=$PWD/$build_dir_name --no-werror --cuda --cmake-opt=-DLLVMGenXIntrinsics_SOURCE_DIR=$PWD/deps/vc-intrinsics --cmake-opt=-DCMAKE_INSTALL_PREFIX=$prefix --cmake-opt=-DSYCL_EXTERNAL_PROJECTS_SKIP_AUTO_UPDATE=ON
