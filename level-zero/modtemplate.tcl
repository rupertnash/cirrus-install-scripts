#%Module
module-whatis "Intel oneAPI level zero loader"

setenv LEVEL_ZERO_DIR "${prefix}"
prepend-path LD_LIBRARY_PATH "${prefix}/lib64"
