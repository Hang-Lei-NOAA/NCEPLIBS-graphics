# *** for WCOSS Cray (intel) ***
#module purge
#module load PrgEnv-intel
#module load craype-sandybridge
#module load g2tmpl-intel/1.5.0
 grep -E "(^|:|/)jasper-gnu-haswell/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load jasper-gnu-haswell/1.900.1
 grep -E "(^|:|/)png-gnu-haswell/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load png-gnu-haswell/1.2.49
 grep -E "(^|:|/)zlib-gnu-haswell/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load zlib-gnu-haswell/1.2.7
 grep -E "(^|:|/)g2tmpl/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load g2tmpl/1.5.1

 export CC=cc
 export FC=ftn
 export CPP=cpp
 export OMPCC="$CC -qopenmp"
 export OMPFC="$FC -qopenmp"
 export MPICC=$CC
 export MPIFC=$FC

 export DEBUG="-g -traceback -O0"
 export CFLAGS="-g -traceback -O3 -axCORE-AVX2 -fPIC"
 export FFLAGS="-g -traceback -O3 -axCORE-AVX2 -fPIC"
 export FPPCPP="-cpp"
 export FREEFORM="-free"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS=$CFLAGS
 export MPIFFLAGS=$FFLAGS
 export MODPATH="-module "
 export I4R4="-integer-size 32 -real-size 32"
 export I4R8="-integer-size 32 -real-size 64"
 export I8R8="-integer-size 64 -real-size 64"

 export CPPDEFS=""
 export CFLAGSDEFS="-DUNDERSCORE -DLINUX"
 export FFLAGSDEFS=""

 export USECC="YES"
 export USEFC="YES"
 export DEPS=""
