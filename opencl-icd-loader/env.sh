if [ -z "$INSTALLER_OPENCL_ICD_LOADED_ENV_SH" ]; then
    INSTALLER_OPENCL_ICD_LOADER_ENV_SH=1

    export installer_opencl_icd_loader_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_opencl_icd_loader_dir/../env.sh

    export name=opencl-icd-loader
    # This is the tag from the repo to build
    export version=master
    export prefix=$app_dir/$name/$version

    build_dir_name=build

    module load opencl-headers/master
    module load gcc/8.2.0
    module load cmake/3.17.3
fi
