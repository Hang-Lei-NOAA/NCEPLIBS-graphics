CC = icc
CFLAGS = -O -g -traceback
FC = ifort
FFLAGS = -D_LITTLE_ENDIAN -O -g -traceback -integer-size 64 -real-size 64 -convert big_endian -assume byterecl -assume nobscc -assume noold_ldout_format

OBJ = afnaij.o \
      afostx.o \
      asc2cdc.o \
      asc2isp.o \
      bin2ch.o \
      bin2eb.o \
      cdc2asc.o \
      centre.o \
      chr2hex.o \
      clabel.o \
      closec.o \
      closed.o \
      compl.o \
      consol.o \
      dayowk.o \
      duck.o \
      eb2asc.o \
      echbar.o \
      endmap.o \
      format.o \
      gtapil.o \
      gtargs.o \
      hafpakra.o \
      hilo.o \
      ij2uor.o \
      int2ch.o \
      isdigit.o \
      iw3get.o \
      looktlb.o \
      low2up.o \
      mask.o \
      movbitz.o \
      movch.o \
      putl_cs.o \
      putl_fm.o \
      putl_wr.o \
      putlab.o \
      qtrpakra.o \
      savarg.o \
      strmovv.o \
      truij.o \
      trull.o \
      uor2dot.o \
      updatr.o \
      w3fp02.o \
      w3fs23.o \
      wndbrk.o \
      wndcon.o \
      wndirdig.o \
      wndirt.o \
      xasc2asc.o \
      zplot.o

libgph_v2.0.0_8.a: $(OBJ)
	ar -crv $@ $(OBJ)
	ranlib $@

clean:
	/bin/rm -f libgph_v2.0.0_8.a *.o

putlab.o: putlab.F
	$(FC) -c $(FFLAGS)    putlab.F

.c.o:
	$(CC) -c $(CFLAGS) -C $<

.F.o:
	$(FC) -c $(FFLAGS) -C $<

.f.o:
	$(FC) -c $(FFLAGS) -C $<
