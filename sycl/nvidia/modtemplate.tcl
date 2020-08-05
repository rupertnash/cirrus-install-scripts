#%Module
module-whatis "Intel DPC++ SyCL compiler - can only be used on GPU nodes"

module load nvidia/cuda-10.2
module swap gcc gcc/8.2.0

prepend-path PATH "${prefix}/bin"
prepend-path LD_LIBRARY_PATH "${prefix}/lib"
