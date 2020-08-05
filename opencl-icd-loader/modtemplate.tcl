#%Module
module-whatis "OpenCL Installable Client Driver Loader"

setenv OpenCL_LIBRARY "${prefix}/lib64/libOpenCL.so"
prepend-path LD_LIBRARY_PATH "${prefix}/lib64"
