if [ -z "$INSTALLER_SYCL_ENV_SH" ]; then
    INSTALLER_SYCL_ENV_SH=1

    export installer_sycl_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_sycl_dir/../env.sh

    export name=sycl
    # This is the tag from the repo to build
    export version=20200801
    export prefix=$app_dir/$name/$version

    source_dir_name=llvm
    build_dir_name=build
    
    module load nvidia/cuda-10.2
    module swap gcc gcc/8.2.0
    module load cmake/3.17.3
    module load python/3.8.5
    module load ninja/1.10.0
fi
