       BLOCK DATA FONT38
C                                                10-OCT-1995/DSS
C
C          DATA SET PHCHARAC   AT LEVEL 003 AS OF 05/11/93
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    FONT38      SYMBOL DEFS (FONT38) FOR PRTITL
C   PRGMMR: SHIMOMURA        ORG: NMC41       DATE:96-10-09
C
C ABSTRACT: FONT38 -- CHARACTER SET_38 DEFINITION;
C   IN RASTER-GRAPHICS, BIT-MAPPED FORM;
C      LOOKLIN8 OR  CD38=(-8X8) 29 CHARACTERS VECTOR 8PIXEL LINE ELEMENT
C
C PROGRAM HISTORY LOG:
C   ??-??-??  ORIGINAL AUTHOR: GLORIA DENT (BEFORE 1974)
C   93-05-11  LILLY UPDATES DOCBLOCK.
C   93-06-03  HENRICHSEN
C   93-10-26  SHIMOMURA -- CONVERTING FROM IBM-ASM INTO CRAY-FORTRAN
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
C      LOOKLIN8 OR  CD38=(-8X8) 29 CHARACTERS VECTOR 8PIXEL LINE ELEMENT
C     ... COMMON /FONS_38/ KHTITLE_38,NUMSET_38,NCHS_38,NWPC_38,
C     ...1                 KIXTB_38,KDF_38
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
C      LOOKLIN8 OR  CD38=(-8X8) 29 CHARACTERS VECTOR 8PIXEL LINE ELEMENT
C
       COMMON /FONS_38/ KHTITLE_38,NUMSET_38,NCHS_38,NWPC_38,KIXTB_38,
     1                  KDF_38
       CHARACTER*8    KHTITLE_38
       INTEGER*8    NUMSET_38
       INTEGER*8    NWPC_38
       INTEGER*8    NCHS_38

       CHARACTER*8    KIXTB_38(8)

       INTEGER*8    KDF_38(1,29)

       INTEGER*8    KDF_38A(1,16)
       INTEGER*8    KDF_38B(1,13)
       EQUIVALENCE (KDF_38(1,1), KDF_38A(1,1))    !...  1+16 = 17 
       EQUIVALENCE (KDF_38(1,17),KDF_38B(1,1))    !... 17+13 = 30

C ...  COMMON /FONS_38/ KHTITLE_38,NUMSET_38,NCHS_38,NWPC_38,KIXTB_38,KDF_38
       DATA    KHTITLE_38 / "VEC_8PEL" /
       DATA    NUMSET_38  / 38 /
       DATA    NWPC_38    /  1 /        !... WORDS PER CHARACTER
       DATA    NCHS_38    / 29 /        !... NO. OF CHAR DEFS IN SET_38
C                     ...   COL 12345678
       DATA         KIXTB_38 / "012ABCDE",
     2                         "FGHIJKLM",
     3                         "NOPQRSTU",
     4                         "VWXYZ   ",
     5                         "        ",
     6                         "        ",
     7                         "        ",
     8                         "        " /

C      LOOKLIN8 OR  CD38=(-8X8) 29 CHARACTERS VECTOR 8PIXEL LINE ELEMENT
       DATA     KDF_38A   /
C ...          DC    CL1'0'
     A X'C038070000000000',
C ...          DC    CL1'1'
     A X'F00F000000000000',
C ...          DC    CL1'2'
     A X'FF00000000000000',
C ...          DC    CL1'A'
     A X'FF00000000000000',
C ...          DC    CL1'B'
     A X'0FF0000000000000',
C ...          DC    CL1'C'
     A X'031CE00000000000',
C ...          DC    CL1'D'
     A X'030C30C000000000',
C ...          DC    CL1'E'
     A X'030C106080000000',
C ...          DC    CL1'F'
     A X'0304182040800000',
C ...          DC    CL1'G'
     A X'0102041820408000',
C ...          DC    CL1'H'
     A X'0102040810204080',
C ...          DC    CL1'I'
     A X'0102040808102040',
C ...          DC    CL1'J'
     A X'0101020404081020',
C ...          DC    CL1'K'
     A X'0101020204080810',
C ...          DC    CL1'L'
     A X'0101020204040808',
C ...          DC    CL1'M'
     A X'0101020202040404' /


       DATA     KDF_38B   /
C ...          DC    CL1'N'
     A X'0101010102020202',
C ...          DC    CL1'O'
     A X'0101010101010101',
C ...          DC    CL1'P'
     A X'8080808040404040',
C ...          DC    CL1'Q'
     A X'8080404040202020',
C ...          DC    CL1'R'
     A X'8080404020201010',
C ...          DC    CL1'S'
     A X'8080404020101008',
C ...          DC    CL1'T'
     A X'8080402010100804',
C ...          DC    CL1'U'
     A X'8040201010080402',
C ...          DC    CL1'V'
     A X'8040201008040201',
C ...          DC    CL1'W'
     A X'8040201804020100',
C ...          DC    CL1'X'
     A X'C020100C02010000',
C ...          DC    CL1'Y'
     A X'C030080601000000',
C ...          DC    CL1'Z'
     A X'C0300C0300000000' /
       
       END
