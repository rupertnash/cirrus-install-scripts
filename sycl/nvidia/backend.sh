#!/bin/bash
#SBATCH --job-name sycl-build
#SBATCH --time=0:30:00
#SBATCH --partition=gpu-cascade
#SBATCH --qos=gpu
#SBATCH --gres=gpu:1
#SBATCH --account=z04

script=$1
if [ ! -x $script ]; then
    echo "Actual script ($script) to run not given/present/executable"
    return 1
fi

export TMPDIR=/dev/shm/$SLURM_JOB_ID
mkdir -p $TMPDIR
cd $SLURM_SUBMIT_DIR

srun $script
