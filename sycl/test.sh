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
. $thisdir/../env.sh

version=$(bash -c '. env.sh; echo $version;')
module load sycl/$version

clang++ -fsycl -fsycl-targets=nvptx64-nvidia-cuda-sycldevice $thisdir/testprog.cpp -o testprog

./testprog
