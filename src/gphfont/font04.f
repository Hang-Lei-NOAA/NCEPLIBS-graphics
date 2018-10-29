       BLOCK DATA FONT04
C                                                3-OCT-1995/DSS
C
*          DATA SET PHCHARAC   AT LEVEL 003 AS OF 05/11/93
*$$$  SUBPROGRAM DOCUMENTATION BLOCK
*                .      .    .                                       .
* SUBPROGRAM:    FONT04      SYMBOL DEFS (FONT04) FOR PRTITL
*   PRGMMR: SHIMOMURA        ORG: NMC41       DATE:95-10-03
*
* ABSTRACT: FONT04 -- CHARACTER SET_04 DEFINITION;
*   IN RASTER-GRAPHICS, BIT-MAPPED FORM;
*   LOOK4 OR  CD4=(6X8) 45 CHARACTERS SMALL UPRIGHT
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
*     ... THIS CRAY-FORTRAN VERSION DEFINES ONLY ONE OF THE 50 FONTS,
*     ...    NAMELY, FONT04 -- THE SMALL UPRIGHT CHAR SET
*     ... COMMON /FONS04/ KHTITLE, NUMSET,NCHS04,NWPC04,KIXTB_04,KDF_04
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
*   LOOK4 OR  CD4=(6X8) 45 CHARACTERS SMALL UPRIGHT
C
       COMMON /FONS_04/ KHTITLE_04,NUMSET_04,NCHS_04,NWPC_04,
     1                  KIXTB_04,KDF_04
       CHARACTER*8    KHTITLE_04
       INTEGER*8    NUMSET_04
       INTEGER*8    NCHS_04
       INTEGER*8    NWPC_04

       CHARACTER*8    KIXTB_04(8)

       INTEGER*8    KDF_04(1,45)

       INTEGER*8    KDF_04A(1,19)
       INTEGER*8    KDF_04B(1,19)
       INTEGER*8    KDF_04C(1,7)
       EQUIVALENCE (KDF_04(1,1), KDF_04A(1,1))    !...  1+19 = 20 
       EQUIVALENCE (KDF_04(1,20),KDF_04B(1,1))    !... 20+19 = 39
       EQUIVALENCE (KDF_04(1,39),KDF_04C(1,1))    !... 39+ 7 = 46

C ...  COMMON /FONS04/ KHTITLE04,NUMSET04,NCHS04,NWPC04,KIXTB_04,KDF_04
       DATA    KHTITLE_04 / "SMALL_UP" /
       DATA    NUMSET_04  /  4 /
       DATA    NCHS_04    / 45 /        !... NO. OF CHAR DEFS IN SET_04
       DATA    NWPC_04    /  1 /        !... WORDS PER CHARACTER
C                     ...   COL 12345678
       DATA         KIXTB_04 / " ()*+,-.",
     2                         "/0123456",
     3                         "789ABCDE",
     4                         "FGHIJKLM",
     5                         "NOPQRSTU",
     6                         "VWXYZ   ",
     7                         "        ",
     8                         "        " /

C     LUKTINY OR  CD4=(6X8) 45 CHARACTERS SMALL UPRIGHT
      DATA     KDF_04A     /
C ... CD4      DC    CL1' '
     A X'0000000000000000',
C ...          DC    CL1'('
     A X'0000182424180000',
C ...          DC    CL1')'
     A X'0000183C3C180000',
C ...          DC    CL1'*'
     A X'0038444444443800',
C ...          DC    CL1'+'
     A X'0010107C10100000',
C ...          DC    CL1','
     A X'0008101818000000',
C ...          DC    CL1'-'
     A X'0000007C00000000',
C ...          DC    CL1'.'
     A X'0018180000000000',
C ...          DC    CL1'/'
     A X'0004081020400000',
C ...          DC    CL1'0'
     A X'0038444444443800',
C ...          DC    CL1'1'
     A X'0010101010181000',
C ...          DC    CL1'2'
     A X'007C081020643800',
C ...          DC    CL1'3'
     A X'0038444030207C00',
C ...          DC    CL1'4'
     A X'00207C2428302000',
C ...          DC    CL1'5'
     A X'003844403C047C00',
C ...          DC    CL1'6'
     A X'0038444C34083000',
C ...          DC    CL1'7'
     A X'0004081020407C00',
C ...          DC    CL1'8'
     A X'0038444438443800',
C ...          DC    CL1'9'
     A X'0018207844443800'  /
C      . . . . . . . . . . . . . . . . . . . . . . . . .
      DATA     KDF_04B     /
C ...          DC    CL1'A'
     A X'0044447C44281000',
C ...          DC    CL1'B'
     A X'003C484838483C00',
C ...          DC    CL1'C'
     A X'0078040404447800',
C ...          DC    CL1'D'
     A X'003C484848483C00',
C ...          DC    CL1'E'
     A X'007C04041C047C00',
C ...          DC    CL1'F'
     A X'000404043C047C00',
C ...          DC    CL1'G'
     A X'0078446404043800',
C ...          DC    CL1'H'
     A X'004444447C444400',
C ...          DC    CL1'I'
     A X'0038101010103800',
C ...          DC    CL1'J'
     A X'0038444040406000',
C ...          DC    CL1'K'
     A X'004424141C244400',
C ...          DC    CL1'L'
     A X'007C040404040400',
C ...          DC    CL1'M'
     A X'00444454546C4400',
C ...          DC    CL1'N'
     A X'00444464544C4400',
C ...          DC    CL1'O'
     A X'007C444444447C00',
C ...          DC    CL1'P'
     A X'0004043C44443C00',
C ...          DC    CL1'Q'
     A X'0058245444443800',
C ...          DC    CL1'R'
     A X'0044243C44443C00',
C ...          DC    CL1'S'
     A X'0038444038043800'  /
C      . . . . . . . . . . . . . . . . . . . . . . . . . . 

      DATA     KDF_04C     /
C ...          DC    CL1'T'
     A X'0010101010107C00',
C ...          DC    CL1'U'
     A X'0038444444444400',
C ...          DC    CL1'V'
     A X'0010102828444400',
C ...          DC    CL1'W'
     A X'0028545454444400',
C ...          DC    CL1'X'
     A X'0044281010284400',
C ...          DC    CL1'Y'
     A X'0010101010284400',
C ...          DC    CL1'Z'
     A X'007C081830207C00'  /

       END
