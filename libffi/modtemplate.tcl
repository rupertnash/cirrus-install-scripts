#%Module
module-whatis "libffi"

module load gcc/8.2.0
setenv LIBFFI_DIR "${libffi_prefix}"
prepend-path CPATH "${libffi_prefix}/include"
prepend-path LIBRARY_PATH "${libffi_prefix}/lib64"
prepend-path LD_LIBRARY_PATH "${libffi_prefix}/lib64"
prepend-path PKG_CONFIG_PATH "${libffi_prefix}/lib/pkgconfig"
