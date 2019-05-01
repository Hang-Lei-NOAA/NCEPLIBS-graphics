       BLOCK DATA FONT40
C                                                 10-Oct-1996/DSS
C
C          DATA SET PHCHARAC   AT LEVEL 003 AS OF 05/11/93
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    FONT40      SYMBOL DEFS (FONT40) FOR PRTITL
C   PRGMMR: SHIMOMURA        ORG: W/NP12        DATE:96-10-10
C
C ABSTRACT: FONT40 -- CHARACTER SET_40 DEFINITION;
C   IN RASTER-GRAPHICS, BIT-MAPPED FORM;
C       LOOKPIPW OR  CD40=(20X20)  36 WARM FRONT PIPS
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
C       LOOKPIPW OR  CD40=(20X20)  36 WARM FRONT PIPS
C     ... COMMON /FONS_40/ KHTITLE, NUMSET,NCHS_40,NWPC_40,KIXTB_40,
C     ...1                 KDF_40
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
C       LOOKPIPW OR  CD40=(20X20)  36 WARM FRONT PIPS
C
       COMMON /FONS_40/ KHTITLE_40,NUMSET_40,NCHS_40,NWPC_40,KIXTB_40,
     1                  KDF_40
       CHARACTER*8    KHTITLE_40
       INTEGER*8    NUMSET_40
       INTEGER*8    NWPC_40
       INTEGER*8    NCHS_40

       CHARACTER*8    KIXTB_40(8)

       INTEGER*8    KDF_40(8,36)
       INTEGER*8    KDF_40A(8,6)
       INTEGER*8    KDF_40B(8,6)
       INTEGER*8    KDF_40C(8,6)
       INTEGER*8    KDF_40D(8,6)
       INTEGER*8    KDF_40E(8,6)
       INTEGER*8    KDF_40F(8,6)
       EQUIVALENCE (KDF_40(1,1),KDF_40A(1,1))  		!... 1+6=7
       EQUIVALENCE (KDF_40(1,7),KDF_40B(1,1))  		!... 7+6=13
       EQUIVALENCE (KDF_40(1,13),KDF_40C(1,1))  	!...13+6=19
       EQUIVALENCE (KDF_40(1,19),KDF_40D(1,1))  	!...19+6=25
       EQUIVALENCE (KDF_40(1,25),KDF_40E(1,1))  	!...25+6=31
       EQUIVALENCE (KDF_40(1,31),KDF_40F(1,1))  	!...31+6=37

C ...  COMMON /FONS_40/ KHTITLE_40,NUMSET_40,NCHS_40,NWPC_40,KIXTB_40,KDF_40
C     LOOKPIPW OR  CD40=(20X20)  36 WARM FRONT PIPS
       DATA    KHTITLE_40 / "FRNTPIPW" /
       DATA    NUMSET_40  / 40 /
       DATA    NWPC_40    /  8 /        !... WORDS PER CHARACTER
       DATA    NCHS_40    / 36 /        !... NO. OF CHAR DEFS IN SET_40
C                     ...   COL 12345678
       DATA         KIXTB_40 / "01234567",
     2                         "89ABCDEF",
     3                         "GHIJKLMN",
     4                         "OPQRSTUV",
     5                         "WXYZ    ",
     6                         "        ",
     7                         "        ",
     8                         "        " /

*     LOOKPIPW OR  CD40=(20X20)  36 WARM FRONT PIPS

      DATA     KDF_40A     /
C ...          DC    CL1'0'                                          CD25F001
     A X'0000000000000000',X'0000E00000F80000',X'FC0000FE0000FF00',
     A X'00FF00007F80007F',X'80007F80007F8000',X'7F80007F00003F00',
     A X'003E00003C000038',X'0000000000000000',
C ...          DC    CL1'1'                                          CD25F101
     A X'000000007000007C',X'00007E00007F0000',X'7F00007F80007F80',
     A X'007F80007F80007F',X'80007F80007F8000',X'7F00007F00007E00',
     A X'007C000060000000',X'0000000000000000',
C ...          DC    CL1'2'                                          CD25F201
     A X'000000003000003C',X'00003E00003F0000',X'3F00007F80007F80',
     A X'007F80007F80007F',X'80007F8000FF0000',X'FF0000FE0000FC00',
     A X'01F0000000000000',X'0000000000000000',
C ...          DC    CL1'3'                                          CD25F301
     A X'0000000000000000',X'00000800000C0000',X'1E00001F00003F00',
     A X'003F00007F80007F',X'8000FF8000FF8001',X'FF0001FF0001FE00',
     A X'03FC0003F0000000',X'0000000000000000',
C ...          DC    CL1'4'                                          CD25F401
     A X'0000000000000004',X'00000600000F0000',X'1F80001F80003FC0',
     A X'007FC0007FC000FF',X'C000FF8001FF8001',X'FF0003FF0007FE00',
     A X'07FC0001F0000000',X'0000000000000000',
C ...          DC    CL1'5'                                          CD25F501
     A X'0000000000000000',X'0000000000000000',X'0700000F00001F80',
     A X'003F80007F8000FF',X'8001FF8003FF8007',X'FF000FFF001FFE00',
     A X'0FFC0003F0000000',X'0000000000000000' /



      DATA     KDF_40B     /
C ...          DC    CL1'6'                                          CD25F601
     A X'0000000000000000',X'0000000000000000',X'0700000F00001F80',
     A X'003F80007F8000FF',X'8001FF8003FF8007',X'FF000FFF001FFE00',
     A X'0FFC0003F0000000',X'0000000000000000',
C ...          DC    CL1'7'                                          CD25F701
     A X'0000000000000000',X'0000000000000000',X'00C00003C00007C0',
     A X'001FC0007FC000FF',X'C003FFC00FFFC01F',X'FFC07FFF807FFF00',
     A X'3FFE001FFC000FFC',X'0000000000000000',
C ...          DC    CL1'8'                                          CD25F801
     A X'0000000000000000',X'0000000000000000',X'0000000000000180',
     A X'000F80007FC007FE',X'000FFF803FFF807F',X'FF803FFF001FFE00',
     A X'0FFC0007F8000000',X'0000000000000000',
C ...          DC    CL1'9'                                          CD25F901
     A X'0000000000000000',X'0000000000000000',X'0000000000000000',
     A X'000000003F000FFF',X'00FFFF00FFFE00FF',X'FE007FFC003FF800',
     A X'1FF00007C0000000',X'0000000000000000',
C ... CD40     DC    CL1'A'                                          CD25C101
     A X'0000000000000000',X'0000000000000000',X'0000000000000000',
     A X'0000000000007FFF',X'C07FFFC03FFFC03F',X'FF803FFF801FFF00',
     A X'0FFE0003F8000000',X'0000000000000000',
C ...          DC    CL1'B'                                          CD25C201
     A X'0000000000000000',X'0000000000000000',X'0000000000000000',
     A X'2000003E00003FF8',X'003FFFC03FFFC01F',X'FF801FFF800FFF00',
     A X'07FE0001F8000000',X'0000000000000000' /


      DATA     KDF_40C     /
C ...          DC    CL1'C'                                          CD25C301
     A X'0000000000000000',X'0000000000000000',X'0000000000600000',
     A X'7C00007F00007FC0',X'007FF0007FFC003F',X'FF003FFE001FFC00',
     A X'0FF80003C0000000',X'0000000000000000',
C ...          DC    CL1'D'                                          CD25C401
     A X'0000000000000000',X'0000000000000000',X'0000300000380000',
     A X'7E00007F80007FE0',X'007FF0007FFC003F',X'FE003FFF801FFF00',
     A X'0FFE0003FC000000',X'0000000000000000',
C ...          DC    CL1'E'                                          CD25C501
     A X'0000000000000000',X'0000000010000038',X'00003C00007E0000',
     A X'7F00007F80007FC0',X'007FE0007FF0003F',X'F8003FFC001FFC00',
     A X'0FFC0003F0000000',X'0000000000000000',
C ...          DC    CL1'F'                                          CD25C601
     A X'0000000000000000',X'0000000010000038',X'00003C00007E0000',
     A X'7F00007F80007FC0',X'007FE0007FF0003F',X'F8003FFC001FFC00',
     A X'0FFC0003F0000000',X'0000000000000000',
C ...          DC    CL1'G'                                          CD25C701
     A X'0000000000001800',X'003800007C0000FE',X'0000FE0000FF0000',
     A X'FF0000FF8000FFC0',X'00FFC000FFE000FF',X'E000FFF0003FF800',
     A X'1FF8000FFC0007FC',X'0000000000000000',
C ...          DC    CL1'H'                                          CD25C801
     A X'0000000000000400',X'000E00001E00003E',X'00007F00007F0000',
     A X'7F80007F80007FC0',X'007FC0007FC0007F',X'E0003FE0001FE000',
     A X'0FF00007F00000C0',X'0000000000000000' /


      DATA     KDF_40D     /
C ...          DC    CL1'I'                                          CD25C901
     A X'0000000700000F00',X'001F00003F00003F',X'80007F80007F8000',
     A X'7F80007F80007F80',X'003FC0003FC0001F',X'C0000FC00007C000',
     A X'01C0000000000000',X'0000000000000000',
C ...          DC    CL1'J'                                          CD25D101
     A X'0000000000000180',X'000F80001F80003F',X'80003F80007F8000',
     A X'7F80007F80007F80',X'007F80007F80007F',X'80003F80003F8000',
     A X'1F80000F80000380',X'0000000000000000',
C ...          DC    CL1'K'                                          CD25D201
     A X'0000000000000000',X'0003E0000FC0001F',X'C0003FC0003FC000',
     A X'7F80007F80007F80',X'007F80007F80007F',X'80003F00003F0000',
     A X'1F00000F00000300',X'0000000000000000',
C ...          DC    CL1'L'                                          CD25D301
     A X'00000000000003F0',X'000FF0001FE0003F',X'E0003FE0007FC000',
     A X'7FC0007F80007F80',X'003F00003F00003E',X'00001E00000C0000',
     A X'0400000000000000',X'0000000000000000',
C ...          DC    CL1'M'                                          CD25D401
     A X'00000000000003E0',X'000FF8001FF8003F',X'F0003FE0007FE000',
     A X'7FC000FFC000FF80',X'00FF8000FF00007E',X'00007E00003C0000',
     A X'1800000800000000',X'0000000000000000',
C ...          DC    CL1'N'                                          CD25D501
     A X'00000000000003F0',X'000FFC001FFE003F',X'FC003FF8007FF000',
     A X'7FE0007FC0007F80',X'007F00007E00003C',X'0000380000000000',
     A X'0000000000000000',X'0000000000000000' /


      DATA     KDF_40E     /
C ...          DC    CL1'O'                                          CD25D601
     A X'00000000000003F0',X'000FFC001FFE003F',X'FC003FF8007FF000',
     A X'7FE0007FC0007F80',X'007F00007FC0003C',X'0000380000000000',
     A X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'P'                                          CD25D701
     A X'00000007FC000FFE',X'001FFF003FFF807F',X'FF80FFFE00FFFC00',
     A X'FFF000FFC000FF80',X'00FE0000F80000F0',X'0000C00000000000',
     A X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'Q'                                          CD25D801
     A X'00000000000007F8',X'000FFC001FFE003F',X'FF007FFF807FFF00',
     A X'7FF800FFE000FF80',X'007C000060000000',X'0000000000000000',
     A X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'R'                                          CD25D901
     A X'00000000000003FE',X'0007FF000FFF801F',X'FFC01FFFC03FFFC0',
     A X'3FFC003F00000000',X'0000000000000000',X'0000000000000000',
     A X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'S'                                          CD25E201
     A X'00000000000007F0',X'001FFC003FFE007F',X'FF007FFF00FFFF00',
     A X'FFFF80FFFF800000',X'0000000000000000',X'0000000000000000',
     A X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'T'                                          CD25E301
     A X'00000000000007E0',X'001FF8003FFC007F',X'FE007FFE00FFFF00',
     A X'FFFF0007FF00001F',X'0000010000000000',X'0000000000000000',
     A X'0000000000000000',X'0000000000000000' /



      DATA     KDF_40F     /
C ...          DC    CL1'U'                                          CD25E401
     A X'00000000000000F0',X'0007FC000FFE001F',X'FF003FFF000FFF80',
     A X'03FF8000FF80003F',X'80000F8000018000',X'0000000000000000',
     A X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'V'                                          CD25E501
     A X'00000003C0000FF0',X'001FFC003FFE007F',X'FF001FFF000FFF80',
     A X'03FF8001FF80007F',X'80001F8000070000',X'0300000000000000',
     A X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'W'                                          CD25E601
     A X'00000000000003F0',X'000FFC000FFE000F',X'FF0007FF0003FF80',
     A X'01FF8000FF80007F',X'80003F80001F8000',X'0F00000700000200',
     A X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'X'                                          CD25E701
     A X'00000000000003F0',X'000FFC000FFE000F',X'FF0007FF0003FF80',
     A X'01FF8000FF80007F',X'80003F80001F8000',X'0F00000700000200',
     A X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'Y'                                          CD25E801
     A X'0000000FF8000FFC',X'0007FE0007FF0003',X'FF8001FFC001FFC0',
     A X'00FFC000FFC0007F',X'C0003FC0003FC000',X'1FC0001FC0000F80',
     A X'0007000006000000',X'0000000000000000',
C ...          DC    CL1'Z'                                          CD25E901
     A X'00000000C00003F8',X'0003FC0001FE0001',X'FF0001FF8000FF80',
     A X'00FF8000FF8000DF',X'8000DF80003F8000',X'3F80003F00001E00',
     A X'001C000008000000',X'0000000000000000' /

       END