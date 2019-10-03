# *** for WCOSS IBM phase1/phase2 (intel) ***
#module purge
#module load ics/17.0.3
#module load nemsio/v2.2.3
#new_ver=v2.2.4
#reset_version nemsio $new_ver
#module load nemsiogfs/v2.0.1
#new_ver=v2.2.0
#reset_version nemsiogfs $new_ver
 grep -E "(^|:|/)nemsio/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load nemsio/2.2.4
 grep -E "(^|:|/)nemsiogfs/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load nemsiogfs/2.2.1

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

 export USECC=""
 export USEFC="YES"
 export DEPS="NEMSIO $NEMSIO_VER"
