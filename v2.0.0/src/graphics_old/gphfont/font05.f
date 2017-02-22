       BLOCK DATA FONT05
C                                                3-OCT-1995/DSS
C
*          DATA SET PHCHARAC   AT LEVEL 003 AS OF 05/11/93
*$$$  SUBPROGRAM DOCUMENTATION BLOCK
*                .      .    .                                       .
* SUBPROGRAM:    FONT05      SYMBOL DEFS (FONT05) FOR PRTITL
*   PRGMMR: SHIMOMURA        ORG: NMC41       DATE:95-10-03
*
* ABSTRACT: FONT05 -- CHARACTER SET_05 DEFINITION;
*   IN RASTER-GRAPHICS, BIT-MAPPED FORM;
*   LOOK5 OR  CD5=(8X-6) 45 CHARACTERS SMALL SIDEWAYS
*
* PROGRAM HISTORY LOG:
*   ??-??-??  ORIGINAL AUTHOR: GLORIA DENT (BEFORE 1974)
*   93-05-11  LILLY UPDATES DOCBLOCK.
*   93-06-03  HENRICHSEN
*   93-10-26  SHIMOMURA -- CONVERTING FROM IBM-ASM INTO CRAY-FORTRAN
*                          BLOCK DATA;
*                          CHANGED THE ORDER FROM EBCDIC TO ASCII
*                          SORTING SEQ.
*
* USAGE:   linkage-edit the member=PHCHARAC 
*   INPUT ARGUMENT LIST:
*
*     ... THIS MEMBER IS NOT CALLED; THE OBJECT CODE IS LINKAGE-EDITED
*
* REMARKS: 
*     ... THE IBM-ASM VERSION IS LIKE A BLOCK DATA SUBPROGRAM 
*     ...                     WHICH DEFINED COMMON /CHARAC/
*     ... THIS CRAY-FORTRAN MEMBER DEFINES ONLY ONE OF THE 50 FONTS,
*     ...    NAMELY, FONT05 -- THE SMALL SIDEWAYS CHAR SET
*             
*
* ATTRIBUTES:
*   LANGUAGE: CRAY FORTRAN
*   MACHINE:  CRAY4
*
*$$$
*          DATA SET PHCHARAC   AT LEVEL 001 AS OF 04/17/93
*          DATA SET PHCHARAC   AT LEVEL 001 AS OF 06/05/89
*          DATA SET PHCHARAC   AT LEVEL 006 AS OF 10/03/85
C ...         TITLE 'COMMON /CHARAC/DEFSYM -- SYMBOL DEFS FOR PRTITL'
C ...         CHARAC   CSECT
*
*   THIS CHARH SET IS PHCHARAC FOUND ON DPH.PAN.SOURCE.A
*   UPDATED 03 OCT 1985 BY PETER HENRICHSEN TO :
*    ADD NOAA DUCK AND MEDIUM DUCK TO CD10.
*    ADD 24 DOT DUCKLING TO CD1.
*    ADD ALPHABET, ' ', '.' AND '/' TO CD19.
*   MODIFIED BY GLORIA AND PETER TO ADD TROPICAL STORM SYMBOL IN CD10
*   01 OCT 1982.
*
*
*   LOOK5 OR  CD5=(8X-6) 45 CHARACTERS SMALL SIDEWAYS
C
       COMMON /FONS_05/ KHTITLE_05,NUMSET_05,NCHS_05,NWPC_05,
     1                  KIXTB_05,KDF_05
       CHARACTER*8    KHTITLE_05
       INTEGER*8    NUMSET_05
       INTEGER*8    NCHS_05
       INTEGER*8    NWPC_05

       CHARACTER*8    KIXTB_05(8)

       INTEGER*8    KDF_05(1,45)

       INTEGER*8    KDF_05A(1,19)
       INTEGER*8    KDF_05B(1,19)
       INTEGER*8    KDF_05C(1,7)
       EQUIVALENCE (KDF_05(1,1), KDF_05A(1,1))    !...  1+19 = 20 
       EQUIVALENCE (KDF_05(1,20),KDF_05B(1,1))    !... 20+19 = 39
       EQUIVALENCE (KDF_05(1,39),KDF_05C(1,1))    !... 39+ 7 = 46

C ...       COMMON /FONS_05/ KHTITLE_05,NUMSET_05,NCHS_05,NWPC_05,
C ...     1                  KIXTB_05,KDF_05
       DATA    KHTITLE_05 / "SMALL_SI" /
       DATA    NUMSET_05  /  5 /
       DATA    NCHS_05    / 45 /        !... NO. OF CHAR DEFS IN SET_05
       DATA    NWPC_05    /  1 /        !... WORDS PER CHARACTER
C                     ...   COL 12345678
       DATA         KIXTB_05 / " ()*+,-.",
     2                         "/0123456",
     3                         "789ABCDE",
     4                         "FGHIJKLM",
     5                         "NOPQRSTU",
     6                         "VWXYZ   ",
     7                         "        ",
     8                         "        " /

C     LIKTINY OR  CD5=(8X-6) 45 CHARACTERS SMALL SIDEWAYS
      DATA     KDF_05A     /

C ... CD5      DC    CL1' '
     A X'0000000000000000',
C ...          DC    CL1'('
     A X'1824241800000000',
C ...          DC    CL1')'
     A X'183C3C1800000000',
C ...          DC    CL1'*'
     A X'3C4242423C000000',
C ...          DC    CL1'+'
     A X'10107C1010000000',
C ...          DC    CL1','
     A X'0058380000000000',
C ...          DC    CL1'-'
     A X'1010101010000000',
C ...          DC    CL1'.'
     A X'0060600000000000',
C ...          DC    CL1'/'
     A X'4020100804000000',
C ...          DC    CL1'0'
     A X'3C4242423C000000',
C ...          DC    CL1'1'
     A X'00447E4000000000',
C ...          DC    CL1'2'
     A X'4462524E44000000',
C ...          DC    CL1'3'
     A X'22424A4E32000000',
C ...          DC    CL1'4'
     A X'3028247E20000000',
C ...          DC    CL1'5'
     A X'2E4A4A4A32000000',
C ...          DC    CL1'6'
     A X'38544A4A30000000',
C ...          DC    CL1'7'
     A X'4222120A06000000',
C ...          DC    CL1'8'
     A X'344A4A4A34000000',
C ...          DC    CL1'9'
     A X'0C5252321C000000' /

C     . . . . . . . . . . . . . . . .
      DATA     KDF_05B     /
C ...          DC    CL1'A'
     A X'7814121478000000',
C ...          DC    CL1'B'
     A X'427E4A4A34000000',
C ...          DC    CL1'C'
     A X'3C42424246000000',
C ...          DC    CL1'D'
     A X'427E42423C000000',
C ...          DC    CL1'E'
     A X'7E4A4A4242000000',
C ...          DC    CL1'F'
     A X'7E0A0A0A02000000',
C ...          DC    CL1'G'
     A X'3C42425270000000',
C ...          DC    CL1'H'
     A X'7E0808087E000000',
C ...          DC    CL1'I'
     A X'00427E4200000000',
C ...          DC    CL1'J'
     A X'204040423E000000',
C ...          DC    CL1'K'
     A X'7E08182442000000',
C ...          DC    CL1'L'
     A X'7E40404040000000',
C ...          DC    CL1'M'
     A X'7E0418047E000000',
C ...          DC    CL1'N'
     A X'7E0408107E000000',
C ...          DC    CL1'O'
     A X'7E4242427E000000',
C ...          DC    CL1'P'
     A X'7E1212120C000000',
C ...          DC    CL1'Q'
     A X'3C4252225C000000',
C ...          DC    CL1'R'
     A X'7E1212324C000000',
C ...          DC    CL1'S'
     A X'244A4A4A30000000' /
C      . . . . . . . . . . . . . . . . . 

      DATA     KDF_05C     /
C ...          DC    CL1'T'
     A X'02027E0202000000',
C ...          DC    CL1'U'
     A X'3E4040403E000000',
C ...          DC    CL1'V'
     A X'0618601806000000',
C ...          DC    CL1'W'
     A X'3E4038403E000000',
C ...          DC    CL1'X'
     A X'4224182442000000',
C ...          DC    CL1'Y'
     A X'0204780402000000',
C ...          DC    CL1'Z'
     A X'42725A4E42000000' /

       END
