CC = icc
CFLAGS = -std=c99 -O -g -traceback -C 
FC = ifort
#FFLAGS = -O -g -traceback -C
FFLAGS =  -D_LITTLE_ENDIAN -O -g -traceback -C -integer-size 64 -real-size 64 -assume byterecl -convert big_endian -assume nobscc -assume noold_ldout_format

OBJ = dbgprtz.o \
      movbitz.o \
      sbytesccs.o \
      swap_bytes_in_place.o \
      swap_bytes_on_copy.o

all: test_swap test_movbits_simple test_movbits_complex

test_swap: test_driver_swap_routines.f libutil_${version}.a
	$(FC) -o $@ $(FFLAGS) test_driver_swap_routines.f -L./ -lutil_${version}

test_movbits_simple: test_driver_movbitz.f libutil_${version}.a
	$(FC) -o $@ $(FFLAGS) test_driver_movbitz.f -L./ -lutil_${version}

test_movbits_complex: test_driver_movbitz.c libutil_${version}.a
	$(CC) -o $@ $(CFLAGS) test_driver_movbitz.c -L./ -lutil_${version}

libutil_${version}.a: $(OBJ)
	ar -crv $@ $(OBJ)
	ranlib $@

clean:
	/bin/rm -f test_swap \
                   test_movbits_simple \
                   test_movbits_complex \
                   libutil_${version}.a *.o

.c.o:
	$(CC) -c $(CFLAGS) $<
