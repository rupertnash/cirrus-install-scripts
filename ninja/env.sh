if [ -z "$INSTALLER_NINJA_ENV_SH" ]; then
    INSTALLER_NINJA_ENV_SH=1

    export installer_ninja_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_ninja_dir/../env.sh

    export ninja_version=1.10.0
    export ninja_prefix=$app_dir/ninja/$ninja_version

fi
