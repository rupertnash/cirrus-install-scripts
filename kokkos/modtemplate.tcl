#%Module
module-whatis "Kokkos ${version}"

#     module load nvidia/cuda-10.2

setenv KOKKOS_DIR "${prefix}"
prepend-path PATH "${prefix}/bin"
prepend-path PKG_CONFIG_PATH "${prefix}/lib/pkgconfig"
