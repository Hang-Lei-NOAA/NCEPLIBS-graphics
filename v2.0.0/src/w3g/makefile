CC = icc
CFLAGS = -D_LITTLE_ENDIAN -O -g -traceback -C
FC = ifort
FFLAGS = -D_LITTLE_ENDIAN -O -g -traceback -C -integer-size 64 -real-size 64 -assume byterecl -assume nobscc -assume noold_ldout_format

OBJ = \
      getgb1.o \
      sbyte.o \
      w3fp12.o \
      w3fp13.o

#     mova2i.o \
#     sbytes.o \
#     w3fi01.o \
#

libw3g_${version}_8.a: $(OBJ)
	ar -crv $@ $(OBJ)
	ranlib $@

clean:
	/bin/rm -f libw3g_${version}_8.a *.o

.c.o:
	$(CC) -c $(CFLAGS) $<

.F.o:
	$(FC) -c $(FFLAGS) $<

.f.o:
	$(FC) -c $(FFLAGS) $<
