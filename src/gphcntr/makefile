FC = ifort
FFLAGS = -D_LITTLE_ENDIAN -O -g -traceback -C -integer-size 64 -real-size 64 -assume byterecl -convert big_endian -assume nobscc -assume noold_ldout_format

OBJ = atoi.o \
      barb2ras.o \
      bcntor.o \
      bgln_cut.o \
      bpdrln.o \
      bpltvec.o \
      bufo1920.o \
      c1eb2as.o \
      cntor.o \
      cntr.o \
      cntri.o \
      consta.o \
      cp8to6.o \
      csort.o \
      cudfpi.o \
      dgnopn.o \
      dgnscn.o \
      fclip.o \
      genanmsk.o \
      get1chdf.o \
      getbgnd.o \
      hsort.o \
      ij2uorv.o \
      img2x6t.o \
      indeff.o \
      indfpi.o \
      inscribe.o \
      irotsymb.o \
      irvr.o \
      isalpha.o \
      isort2d.o \
      lndfpi.o \
      lndfpz.o \
      look_lab.o \
      lsdfpi.o \
      lsdfpz.o \
      merges.o \
      midncdx6.o \
      modec3.o \
      mvtolend.o \
      otrncdx6.o \
      pack8b.o \
      padifid.o \
      pak8to6.o \
      piksor.o \
      pltasym.o \
      pltbarb1.o \
      pltlab1.o \
      pltvec.o \
      prtitle.o \
      pure_x6b.o \
      reblkfx4.o \
      rerota.o \
      segmnt.o \
      shlsor.o \
      strpfnam.o \
      swabyt.o \
      sym2imag.o \
      sym2imge.o \
      wndbarb.o \
      wrborz.o \
      wrtdgn.o \
      x2cntor.o \
      xmodec3.o

libgphcntr_v2.0.0_8.a: $(OBJ)
	ar -crv $@ $(OBJ)
	ranlib $@

clean:
	/bin/rm -f libgphcntr_v2.0.0_8.a *.o

.F.o:
	$(FC) -c $(FFLAGS) $<

.f.o:
	$(FC) -c $(FFLAGS) $<
