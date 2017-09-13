       BLOCK DATA FONT37
C                                                 1-Oct-1996/DSS
C
C          DATA SET PHCHARAC   AT LEVEL 003 AS OF 05/11/93
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    FONT37      SYMBOL DEFS (FONT37) FOR PRTITL
C   PRGMMR: SHIMOMURA        ORG: W/NP12        DATE:96-10-09
C
C ABSTRACT: FONT37 -- CHARACTER SET_37 DEFINITION;
C   IN RASTER-GRAPHICS, BIT-MAPPED FORM;
C     LOOK37 OR  CD37=(-19X-19)  2 SPECIAL NON-ERASING SYMBOLS:
C     A CIRCLE, AND AN OVAL -- SIDEWAYS 
C
C PROGRAM HISTORY LOG:
C   ??-??-??  ORIGINAL AUTHOR: GLORIA DENT (BEFORE 1974)
C   93-05-11  LILLY UPDATES DOCBLOCK.
C   93-06-03  HENRICHSEN
C   96-10-01  SHIMOMURA -- CONVERTING FROM IBM-ASM INTO CRAY-FORTRAN
C                          BLOCK DATA;
C                          CHANGED THE ORDER FROM EBCDIC TO ASCII
C                          SORTING SEQ.
C
C USAGE:   linkage-edit the member=PHCHARAC 
C   INPUT ARGUMENT LIST:
C
C     ... THIS MEMBER IS NOT CALLED; THE OBJECT CODE IS LINKAGE-EDITED
C
C REMARKS: 
C     ... THE IBM-ASM VERSION IS LIKE A BLOCK DATA SUBPROGRAM 
C     ...                     WHICH DEFINED COMMON /CHARAC/
C     ... THIS CRAY-FORTRAN VERSION DEFINES ONLY ONE OF THE 50 FONTS,
C     LOOK37 OR  CD37=(-19X-19)  2 SPECIAL NON-ERASING:CIRCLE, OVAL - SW 
C     ... COMMON /FONS_37/ KHTITLE, NUMSET,NCHS_37,NWPC_37,KIXTB_37,
C     ...1                 KDF_37
C             
C
C ATTRIBUTES:
C   LANGUAGE: CRAY FORTRAN
C   MACHINE:  CRAY4
C
C$$$
C          DATA SET PHCHARAC   AT LEVEL 001 AS OF 04/17/93
C          DATA SET PHCHARAC   AT LEVEL 001 AS OF 06/05/89
C          DATA SET PHCHARAC   AT LEVEL 006 AS OF 10/03/85
C ...         TITLE 'COMMON /CHARAC/DEFSYM -- SYMBOL DEFS FOR PRTITL'
C ...         CHARAC   CSECT
C
C   THIS CHARH SET IS PHCHARAC FOUND ON DPH.PAN.SOURCE.A
C   UPDATED 03 OCT 1985 BY PETER HENRICHSEN TO :
C    ADD NOAA DUCK AND MEDIUM DUCK TO CD10.
C    ADD 24 DOT DUCKLING TO CD1.
C    ADD ALPHABET, ' ', '.' AND '/' TO CD19.
C   MODIFIED BY GLORIA AND PETER TO ADD TROPICAL STORM SYMBOL IN CD10
C   01 OCT 1982.
C
C
C     LOOK37 OR  CD37=(-19X-19)  2 SPECIAL NON-ERASING:CIRCLE, OVAL - SW 
C
       COMMON /FONS_37/ KHTITLE_37,NUMSET_37,NCHS_37,NWPC_37,KIXTB_37,
     1                  KDF_37
       CHARACTER*8    KHTITLE_37
       INTEGER*8    NUMSET_37
       INTEGER*8    NWPC_37
       INTEGER*8    NCHS_37

       CHARACTER*8    KIXTB_37(8)

       INTEGER*8    KDF_37(8,2)

C ...  COMMON /FONS_37/ KHTITLE_37,NUMSET_37,NCHS_37,NWPC_37,KIXTB_37,KDF_37
C     LOOK37 OR  CD37=(-19X-19)  2 SPECIAL NON-ERASING:CIRCLE, OVAL - SW 
       DATA    KHTITLE_37 / "CIR_OVAL" /
       DATA    NUMSET_37  / 37 /
       DATA    NWPC_37    /  8 /        !... WORDS PER CHARACTER
       DATA    NCHS_37    /  2 /        !... NO. OF CHAR DEFS IN SET_37
C                     ...   COL 12345678
       DATA         KIXTB_37 / "CD      ",
     2                         "        ",
     3                         "        ",
     4                         "        ",
     5                         "        ",
     6                         "        ",
     7                         "        ",
     8                         "        " /

*     LOOK37 OR  CD37=(-19X-19)  2 SPECIAL NON-ERASING:CIRCLE, OVAL - SW 

      DATA     KDF_37     /
C ... CD37     DC    CL1'C'       ... CIRCLE
     A X'01F000060C001803',X'0020008020008040',X'0040400040800020',
     A X'8000208000208000',X'2080002040004040',X'0040200080200080',
     A X'180300060C0001F0',X'0000000000000000',
C ...          DC    CL1'D'       ... OVAL
     A X'0000000000000000',X'0000000002940008',X'0100000000200080',
     A X'0000004000400000',X'0020008000000008',X'0100029400000000',
     A X'0000000000000000',X'0000000000000000' /

       END
