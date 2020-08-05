if [ -z "$INSTALLER_ENV_SH" ]; then
    INSTALLER_ENV_SH=1

    installer_dir=$(readlink -f $(dirname $BASH_SOURCE))

    export base_dir=/lustre/home/shared/nash
    export app_dir=$base_dir/sw
    export mod_dir=$base_dir/modules
    if ! module is-used /lustre/home/shared/nash/modules; then
	module use $mod_dir
    fi

    export make_parallelism=16
fi
