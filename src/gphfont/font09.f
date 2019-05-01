       BLOCK DATA FONT09
C                                                3-OCT-1995/DSS
C
C          DATA SET PHCHARAC   AT LEVEL 003 AS OF 05/11/93
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    FONT09      SYMBOL DEFS (FONT09) FOR PRTITL
C   PRGMMR: SHIMOMURA        ORG: NMC41       DATE:95-10-03
C
C ABSTRACT: FONT09 -- CHARACTER SET_09 DEFINITION;
C   IN RASTER-GRAPHICS, BIT-MAPPED FORM;
C     LOOK9 OR  CD9=(-12X9) 11 WIND FLAG 4
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
C     ...    NAMELY, FONT09 -- THE WIND FLAGS 2 CHAR SET
C     ... COMMON /FONS_09/ KHTITLE, NUMSET,NCHS_09,NWPC_09,KIXTB_09,
C     ...1                 KDF_09
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
C     LOOK9 OR  CD9=(-12X9) 11 WIND FLAG 4
C
       COMMON /FONS_09/ KHTITLE_09,NUMSET_09,NCHS_09,NWPC_09,KIXTB_09,
     1                  KDF_09
       CHARACTER*8    KHTITLE_09
       INTEGER*8    NUMSET_09
       INTEGER*8    NWPC_09
       INTEGER*8    NCHS_09

       CHARACTER*8    KIXTB_09(8)

       INTEGER*8    KDF_09(3,11)


C ...  COMMON /FONS_09/ KHTITLE_09,NUMSET_09,NCHS_09,NWPC_09,KIXTB_09,KDF_09
C     LOOK9 OR  CD9=(-12X9) 11 WIND FLAG 4
       DATA    KHTITLE_09 / "WNDFLAG4" /
       DATA    NUMSET_09  /  9 /
       DATA    NWPC_09    /  3 /        !... WORDS PER CHARACTER
       DATA    NCHS_09    / 11 /        !... NO. OF CHAR DEFS IN SET_09
C                     ...   COL 12345678
       DATA         KIXTB_09 / "7ABCDEFP",
     2                         "VWX     ",
     3                         "        ",
     4                         "        ",
     5                         "        ",
     6                         "        ",
     7                         "        ",
     8                         "        " /

C     LOOK9 OR  CD9=(-12X9) 11 WIND FLAG 4
      DATA     KDF_09     /
C ...          DC    CL1'7'
     A X'004000C001C003E0',X'07E00FF01F803C00',X'6000000000000000',
C ... CD9      DC    CL1'A'
     A X'0000020004000800',X'0800100020004000',X'8000000000000000',
C ...          DC    CL1'B'
     A X'0000000001800200',X'0400180020004000',X'8000000000000000',
C ...          DC    CL1'C'
     A X'00000000000000C0',X'0100060018006000',X'8000000000000000',
C ...          DC    CL1'D'
     A X'C00078003F001FF0',X'0FE007C003800100',X'0000000000000000',
C ...          DC    CL1'E'
     A X'0000C00078003F00',X'1FF00FE007C00380',X'0100000000000000',
C ...          DC    CL1'F'
     A X'0000C00070003E00',X'1FC00FF007C00300',X'0000000000000000',
C ...          DC    CL1'P'
     A X'006003C01F80FF00',X'7E007C0038003000',X'2000000000000000',
C ...          DC    CL1'V'
     A X'000008001C003E00',X'7F00FF800FC001E0',X'0030000000000000',
C ...          DC    CL1'W'
     A X'08001C003E007F00',X'FF800FC001E00030',X'0000000000000000',
C ...          DC    CL1'X'
     A X'00000C003E00FF00',X'3F8007C000E00030',X'0000000000000000' /

       END