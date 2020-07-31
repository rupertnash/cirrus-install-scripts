if [ -z "$INSTALLER_ENV_SH" ]; then
    INSTALLER_ENV_SH=1

    installer_dir=$(readlink -f $(dirname $BASH_SOURCE))

    export base_dir=/lustre/home/z04/shared/nash
    export app_dir=$base_dir/sw
    export mod_dir=$base_dir/modules
    if [[ ! "$MODULEPATH" =~ ".*$mod_dir.*" ]]; then
	module use $mod_dir
    fi

    export make_parallelism=8
fi
