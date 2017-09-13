       BLOCK DATA FONT18
C                                                3-OCT-1995/DSS
C
C          DATA SET PHCHARAC   AT LEVEL 003 AS OF 05/11/93
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    FONT18      SYMBOL DEFS (FONT18) FOR PRTITL
C   PRGMMR: SHIMOMURA        ORG: NMC41       DATE:95-10-03
C
C ABSTRACT: FONT18 -- CHARACTER SET_18 DEFINITION;
C   IN RASTER-GRAPHICS, BIT-MAPPED FORM;
C     LOOK18 OR  CD18=(12X14) 13 CHARACTERS ITALICS
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
C     ...    NAMELY, FONT18 OR CD18=(12X14) 13 CHARACTERS ITALICS
C     ... COMMON /FONS_18/ KHTITLE_18,NUMSET_18,NCHS_18,NWPC_18,
C     ...1                 KIXTB_18,KDF_18
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
C      LOOK18 OR  CD18=(12X14) 13 CHARACTERS ITALICS
C
       COMMON /FONS_18/ KHTITLE_18,NUMSET_18,NCHS_18,NWPC_18,KIXTB_18,
     1                  KDF_18
       CHARACTER*8    KHTITLE_18
       INTEGER*8    NUMSET_18
       INTEGER*8    NWPC_18
       INTEGER*8    NCHS_18

       CHARACTER*8    KIXTB_18(8)

       INTEGER*8    KDF_18(4,13)

       INTEGER*8    KDF_18A(4,8)
       INTEGER*8    KDF_18B(4,5)
       EQUIVALENCE (KDF_18(1,1), KDF_18A(1,1))    !...  1+8 = 9 
       EQUIVALENCE (KDF_18(1,9),KDF_18B(1,1))     !...  9+5 = 14

C      LOOK18 OR  CD18=(12X14) 13 CHARACTERS ITALICS
C ...  COMMON /FONS_18/ KHTITLE_18,NUMSET_18,NCHS_18,NWPC_18,KIXTB_18,KDF_18
       DATA    KHTITLE_18 / "NUM_ITAL" /
       DATA    NUMSET_18  / 18 /
       DATA    NWPC_18    /  4 /        !... WORDS PER CHARACTER
       DATA    NCHS_18    / 13 /        !... NO. OF CHAR DEFS IN SET_18
C                     ...   COL 12345678
       DATA         KIXTB_18 / " +-01234",
     2                         "56789   ",
     3                         "        ",
     4                         "        ",
     5                         "        ",
     6                         "        ",
     7                         "        ",
     8                         "        " /

C     LOOK18 OR  CD18=(12X14) 13 CHARACTERS ITALICS
      DATA     KDF_18A     /
C ... CD18     DC    CL1' '
     A X'0000000000000000',X'0000000000000000',X'0000000000000000',
     A X'0000000000000000',
C ...          DC    CL1'+'
     A X'0000010001000100',X'020002003FC07F80',X'0400080008001000',
     A X'1000000000000000',
C ...          DC    CL1'-'
     A X'0000000000000000',X'000000003FC07F80',X'0000000000000000',
     A X'0000000000000000',
C ...          DC    CL1'0'
     A X'0000078008401020',X'1020202020404040',X'4040408040802100',
     A X'1E00000000000000',
C ...          DC    CL1'1'
     A X'000007C001000100',X'0200020002000400',X'0400040008000E00',
     A X'0C00000000000000',
C ...          DC    CL1'2'
     A X'00001FE010400080',X'010002000C001000',X'2000400041004200',
     A X'3C00000000000000',
C ...          DC    CL1'3'
     A X'0000078008401020',X'1000100010000C00',X'0800100020004100',
     A X'7F00000000000000',
C ...          DC    CL1'4'
     A X'0000020002000200',X'04003FE004200840',X'0880090012001400',
     A X'1800000000000000' /
      DATA     KDF_18B     /
C ...          DC    CL1'5'
     A X'000007C008601000',X'1000100010000FC0',X'0040008000800100',
     A X'7E00000000000000',
C ...          DC    CL1'6'
     A X'0000078008401020',X'1020106010A00F40',X'0040008001002200',
     A X'1C00000000000000',
C ...          DC    CL1'7'
     A X'0000008000800080',X'0100010002000400',X'0800100020004080',
     A X'7F80000000000000',
C ...          DC    CL1'8'
     A X'00000F8010402020',X'2020204030801F00',X'2080408040804100',
     A X'3E00000000000000',
C ...          DC    CL1'9'
     A X'0000030004000800',X'100020003F806040',X'4040404040802100',
     A X'1E00000000000000'  /

       END