if [ -z "$INSTALLER_LEVEL_ZERO_ENV_SH" ]; then
    INSTALLER_LEVEL_ZERO_ENV_SH=1

    export installer_level_zero_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_level_zero_dir/../env.sh

    export name=level-zero
    # This is the tag from the repo to build
    export version=v0.91.21
    export prefix=$app_dir/$name/$version

    source_dir_name=level-zero
    build_dir_name=build

    module swap gcc gcc/8.2.0
    module load cmake/3.17.3
    module load opencl-headers/master
fi
