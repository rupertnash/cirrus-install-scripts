if [ -z "$INSTALLER_KOKKOS_ENV_SH" ]; then
    INSTALLER_KOKKOS_ENV_SH=1

    export installer_kokkos_dir=$(readlink -f $(dirname $BASH_SOURCE))
    . $installer_kokkos_dir/../env.sh

    export name=kokkos
    export version=3.2.00
    export prefix=$app_dir/$name/$version

    source_dir_name=$name-$version
    build_dir_name=build-$version

    module load cmake/3.17.3
    module load nvidia/cuda-10.2
    # module swap gcc gcc/8.2.0

    source_dir=$PWD/$source_dir_name
    declare -A cmake_vars
    cmake_vars[CMAKE_BUILD_TYPE]=RelWithDebInfo
    cmake_vars[CMAKE_CXX_COMPILER]=$source_dir/bin/nvcc_wrapper
    cmake_vars[Kokkos_ENABLE_CUDA]=ON
    cmake_vars[Kokkos_ENABLE_CUDA_UVM]=ON
    cmake_vars[Kokkos_ENABLE_OPENMP]=ON
fi
