if [ -z "$INSTALLER_OPENCL_HEADERS_ENV_SH" ]; then
    INSTALLER_OPENCL_HEADERS_ENV_SH=1

    export installer_opencl_headers_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_opencl_headers_dir/../env.sh

    export name=opencl-headers
    # This is the tag from the repo to build
    export version=master
    export prefix=$app_dir/$name/$version
fi
