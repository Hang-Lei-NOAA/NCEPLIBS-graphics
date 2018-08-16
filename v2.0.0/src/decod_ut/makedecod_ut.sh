#!/bin/sh
###############################################################
#
#   PURPOSE:   This script uses the make utility to update the libdecod_ut 
#              archive library.
#              It first reads a list of source files in the library and
#              then generates a makefile used to update the archive
#              library.  The make command is then executed to build
#              the library.  Compilation flags and other values are
#              passed to the makefile through environment variables.
#
#   REMARKS:   Only source files that have been modified since the last
#              library update are recompiled and replaced in the object
#              archive libraries.  The make utility determines this
#              from the file modification times.
#
#              New source files are also compiled and added to the object 
#              archive libraries.
#
###############################################################

export decod_include=./include

#--------------------------------------------------------------
#     Generate a list of object files that corresponds to the
#     list of Fortran ( .f ) files in the current directory
#--------------------------------------------------------------
for i in `ls *.f`
do
  obj=`basename $i .f`
  OBJS="$OBJS ${obj}.o"
done

#--------------------------------------------------------------
#     Generate a list of object files that corresponds to the
#     list of C ( .c ) files in the current directory
#--------------------------------------------------------------
for i in `ls *.c`
do
  obj=`basename $i .c`
  OBJS="$OBJS ${obj}.o"
done

#--------------------------------------------------------------
#     Remove make file, if it exists.  May need a new make file
#     with an updated object file list.
#--------------------------------------------------------------
if [ -f make.libdecod_ut ] 
then
  rm -f make.libdecod_ut
fi

#--------------------------------------------------------------
#     Generate a new make file ( make.libdecod_ut), with the updated object list,
#     from this HERE file.
#--------------------------------------------------------------
cat > make.libdecod_ut << EOF
SHELL=/bin/sh

\$(LIB):	\$(LIB)( ${OBJS} )

.f.a:
	ifort -c \$(FFLAGS) \$<
	ar -ruv \$(AFLAGS) \$@ \$*.o
	rm -f \$*.o

.c.a:
	icc -c \$(CFLAGS) \$<
	ar -ruv  \$(AFLAGS) \$@ \$*.o
	rm -f \$*.o
EOF

#--------------------------------------------------------------
#     Update libdecod_ut_${version}.a
#--------------------------------------------------------------

export LIB="./libdecod_ut_${version}.a"
export FFLAGS=" -O3 -I${decod_include} -I${GEMINC} -I${OS_INC} "
export CFLAGS=" -O3 -DUNDERSCORE"
export AFLAGS=" "
make -f make.libdecod_ut

#--------------------------------------------------------------
#     Clean up.
#--------------------------------------------------------------
	rm -f *.o
	rm -f make.libdecod_ut
