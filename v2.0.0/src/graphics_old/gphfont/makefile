FC = ifort
FFLAGS = -O -g -D_LITTLE_ENDIAN -C -i8 -r8 -assume byterecl -convert big_endian -assume nobscc -assume noold_ldout_format

OBJ = chindx.o \
      chindxe.o \
      font01.o \
      font02.o \
      font03.o \
      font04.o \
      font05.o \
      font06.o \
      font07.o \
      font08.o \
      font09.o \
      font10.o \
      font11.o \
      font12.o \
      font13.o \
      font15.o \
      font16.o \
      font17.o \
      font18.o \
      font19.o \
      font20.o \
      font21.o \
      font22.o \
      font23.o \
      font24.o \
      font25.o \
      font26.o \
      font27.o \
      font28.o \
      font29.o \
      font30.o \
      font31.o \
      font32.o \
      font33.o \
      font34.o \
      font35.o \
      font36.o \
      font37.o \
      font38.o \
      font39.o \
      font40.o \
      font41.o \
      font42.o \
      font43.o \
      font44.o

libgphfont_8.a: $(OBJ)
	ar -crv $@ $(OBJ)
	ranlib $@

clean:
	/bin/rm -f libgphfont_8.a *.o

.f.o:
	$(FC) -c $(FFLAGS) $<
