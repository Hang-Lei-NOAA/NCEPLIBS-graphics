# *** for WCOSS Dell (intel) ***
 $rinst && {
   grep -E "(^|:|/)jasper/" <<< "$LOADEDMODULES" &> /dev/null \
    || module load jasper/1.900.1
   grep -E "(^|:|/)png/" <<< "$LOADEDMODULES" &> /dev/null \
    || module load libpng/1.2.44
   grep -E "(^|:|/)z/" <<< "$LOADEDMODULES" &> /dev/null \
    || module load zlib/1.2.11
   grep -E "(^|:|/)g2tmpl/" <<< "$LOADEDMODULES" &> /dev/null \
    || module load g2tmpl/1.5.1
 }

 export CC=icc
 export FC=ifort
 export CPP=cpp
 export OMPCC="$CC -qopenmp"
 export OMPFC="$FC -qopenmp"
 export MPICC=mpiicc
 export MPIFC=mpiifort

 export DEBUG="-g -traceback -O0"
 export CFLAGS="-g -traceback -O3 -fPIC"
 export FFLAGS="-g -traceback -O3 -fPIC"
 export FPPCPP="-cpp"
 export FREEFORM="-free"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-g -traceback -O3 -fPIC"
 export MPIFFLAGS="-g -traceback -O3 -fPIC"
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
