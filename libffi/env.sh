if [ -z "$INSTALLER_LIBFFI_ENV_SH" ]; then
    INSTALLER_LIBFFI_ENV_SH=1

    export installer_libffi_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_libffi_dir/../env.sh

    export libffi_version=3.3
    export libffi_prefix=$app_dir/libffi/$libffi_version

    module load gcc/8.2.0
fi
