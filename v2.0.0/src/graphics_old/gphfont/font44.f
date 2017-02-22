       BLOCK DATA FONT44
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    FONT44      SYMBOL DEFS (FONT44) FOR PRTITL
C   PRGMMR: SHIMOMURA        ORG: W/NP12        DATE:97-01-16
C
C ABSTRACT: FONT44 -- CHARACTER SET_44 DEFINITION;
C   IN RASTER-GRAPHICS, BIT-MAPPED FORM;
C   LOOK44 OR  CD44=(10X12) 55 WNDCLDFX SPECIAL CHARACTERS STANDARD SIZE
C   PLUS ALPHANUMERICS.  THIS WAS USED IN TDL POPS WIND-CLOUD FAX AS 
C   CHARACTER SET 47 IN THE OLD CODES; THIS HAS BECOME CHAR SET 44 
C
C
C PROGRAM HISTORY LOG:
C   ??-??-??  ORIGINAL AUTHOR UNKNOWN
C   93-05-11  LILLY UPDATES DOCBLOCK.
C   93-06-03  HENRICHSEN
C   97-01-16  SHIMOMURA -- CONVERTING FROM IBM-ASM INTO CRAY-FORTRAN
C                          BLOCK DATA;
C                          CHANGED THE ORDER FROM EBCDIC TO ASCII
C                          SORTING SEQ.
C
C USAGE:   linkage-edit this member 
C   INPUT ARGUMENT LIST:
C
C     ... THIS MEMBER IS NOT CALLED; THE OBJECT CODE IS LINKAGE-EDITED
C
C REMARKS: 
C     ... THE IBM-ASM VERSION IS LIKE A BLOCK DATA SUBPROGRAM 
C     ...                     WHICH DEFINED COMMON /CHARAC/
C     ... THIS CRAY-FORTRAN VERSION DEFINES ONLY ONE OF THE 50 FONTS,
C   LOOK44 OR  CD44=(10X12) 18 WNDCLDFX SPECIAL CHARACTERS STANDARD SIZE
C     ... COMMON /FONS_44/ KHTITLE, NUMSET,NCHS_44,NWPC_44,KIXTB_44,
C     ...1                 KDF_44
C
C ATTRIBUTES:
C   LANGUAGE: CRAY FORTRAN
C   MACHINE:  CRAY4
C
C$$$
C
C
*   LOOK44 OR  CD44=(10X12) 55 WNDCLDFX SPECIAL CHARACTERS STANDARD SIZE
C
       COMMON /FONS_44/ KHTITLE_44,NUMSET_44,NCHS_44,NWPC_44,KIXTB_44,
     1                  KDF_44
       CHARACTER*8    KHTITLE_44
       INTEGER*8    NUMSET_44
       INTEGER*8    NWPC_44
       INTEGER*8    NCHS_44

       CHARACTER*8    KIXTB_44(8)

       INTEGER*8    KDF_44(3,55)

C ...  COMMON /FONS_44/ KHTITLE_44,NUMSET_44,NCHS_44,NWPC_44,KIXTB_44,KDF_44
*   LOOK44 OR  CD44=(10X12) 55 WNDCLDFX SPECIAL CHARACTERS STANDARD SIZE
       DATA    KHTITLE_44 / "WNDCLDFX" /
       DATA    NUMSET_44  / 44 /
       DATA    NWPC_44    /  3 /        !... WORDS PER CHARACTER
       DATA    NCHS_44    / 55 /        !... NO. OF CHAR DEFS IN SET_44
C                     ...   COL 12345678
       DATA         KIXTB_44 / " !&'()*+",
     2                         ",-./0123",
     3                         "456789;<",
     4                         ">ABCDEFG",
     5                         "HIJKLMNO",
     6                         "PQRSTUVW",
     7                         "XYZ\^|} ",
     8                         "        " /


      DATA     KDF_44     /

*   LOOK44 OR  CD44=(10X12) 55 WNDCLDFX SPECIAL CHARACTERS STANDARD SIZE
C ... CD47     DC    CL1' '
     A X'0000000000000000',X'0000000000000000',X'0000000000000000',
C ... CD44     DC    CL1'!'		!... ">"
     A X'030006000C001800',X'3000600060003000',X'18000C0006000300',
C ...          DC    CL1'&&'		!... LITTLE TRAPEZOID
     A X'7F803F001E000000',X'0000000000000000',X'0000000000000000',
C ...          DC    CL1''''		!... COLON-LIKE 2-DOT RAIN
     A X'00000C001E001E00',X'0C00000000000C00',X'1E001E000C000000',
C ...          DC    CL1'('		!... OPEN STN CIRCLE
     A X'1E003F0061806180',X'618061803F001E00',X'0000000000000000',
C ...          DC    CL1')'		!... CLOSED STN CIRCLE
     A X'1E003F007F807F80',X'7F807F803F001E00',X'0000000000000000',
C ...          DC    CL1'*'		!... (an asterisk will not show)
     A X'1F001F8019801080',X'1080108010801080',X'108019801F800F00',
C ...          DC    CL1'+'		!... PLUS SIGN
     A X'000000000C000C00',X'0C003F003F000C00',X'0C000C0000000000',
C ...          DC    CL1','		!... PERIOD
     A X'0300078007800300',X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'-'		!... MINUS
     A X'0000000000000000',X'00001F801F800000',X'0000000000000000',
C ...          DC    CL1'.'		!... PERIOD
     A X'0300078007800300',X'0000000000000000',X'0000000000000000',
C ...          DC    CL1'/'		!... SLASH
     A X'0180018003000300',X'060006000C000C00',X'1800180030003000',
C ...          DC    CL1'0'
     A X'1F001F8019801080',X'1080108010801080',X'108019801F800F00',
C ...          DC    CL1'1'
     A X'1F801F8006000600',X'0600060006000600',X'0600078007000600',
C ...          DC    CL1'2'
     A X'3F803F8001800180',X'030006001C003000',X'300031801F800F00',
C ...          DC    CL1'3'
     A X'1F003F8031803000',X'300030001E000E00',X'180030003F803F80',
C ...          DC    CL1'4'
     A X'3000300030003000',X'30003F803F803180',X'3180310031003100',
C ...          DC    CL1'5'
     A X'0F801F8030003000',X'300030001F800F80',X'018001801F801F80',
C ...          DC    CL1'6'
     A X'1F003F8031803180',X'31801F8003800300',X'06000C0018003000',
C ...          DC    CL1'7'
     A X'0300030003000300',X'0300030006000C00',X'180038003F803F80',
C ...          DC    CL1'8'
     A X'1F00318020802080',X'31801F000E001B00',X'3180318011000E00',
C ...          DC    CL1'9'
     A X'06000C0018001000',X'30003F0021802180',X'2180218033801F00',
C ...          DC    CL1';'		!... "<"
     A X'300018000C000600',X'0300018001800300',X'06000C0018003000',
C ...          DC    CL1'<'		!... A SQUARE STN CIRCLE
     A X'7FC07FC060C060C0',X'60C060C07FC07FC0',X'0000000000000000',
C ...          DC    CL1'>'		!... LESS THAN OR EQUAL TO SIGN
     A X'000000007F807F80',X'00007F807F800300',X'06000C0018003000',
C ...          DC    CL1'A'
     A X'3180318031803F80',X'3F80318031803180',X'31801B000E000400',
C ...          DC    CL1'B'
     A X'1F803F8031803180',X'30801F800F801880',X'118018801F800F80',
C ...          DC    CL1'C'
     A X'1F003F8021800180',X'0180018001800180',X'018021803F801F00',
C ...          DC    CL1'D'
     A X'07800F8018801880',X'1980198019801980',X'198018800F800780',
C ...          DC    CL1'E'
     A X'3F803F8001800180',X'01800F800F800180',X'018001803F803F80',
C ...          DC    CL1'F'
     A X'0180018001800180',X'01800F800F800180',X'018001803F803F80',
C ...          DC    CL1'G'
     A X'1F003F8031802180',X'3180388038800180',X'018001803F801F00',
C ...          DC    CL1'H'
     A X'3180318031803180',X'31803F803F803180',X'3180318031803180',
C ...          DC    CL1'I'
     A X'1F801F8006000600',X'0600060006000600',X'060006001F801F80',
C ...          DC    CL1'J'
     A X'1F003F8030803180',X'3180300030003000',X'3000300030003000',
C ...          DC    CL1'K'
     A X'3180318018801880',X'0C8007800F801880',X'1880198031803180',
C ...          DC    CL1'L'
     A X'1F801F8001800180',X'0180018001800180',X'0180018001800180',
C ...          DC    CL1'M'
     A X'3180318031803180',X'3180208020802480',X'2A802A8031802080',
C ...          DC    CL1'N'
     A X'3180318039802980',X'2880248024802280',X'3280338031803180',
C ...          DC    CL1'O'
     A X'1F001F0031803180',X'3180318031803180',X'318031801F001F00',
C ...          DC    CL1'P'
     A X'0180018001800180',X'01803F803F803080',X'318030803F801F80',
C ...          DC    CL1'Q'
     A X'2F00278031801880',X'0C80248030803080',X'318031803F801F00',
C ...          DC    CL1'R'
     A X'3080308030803080',X'18800C801F803080',X'318030801F801F80',
C ...          DC    CL1'S'
     A X'0F00318031803000',X'38001C000E000300',X'0180018031801E00',
C ...          DC    CL1'T'
     A X'0600060006000600',X'0600060006000600',X'060006001F801F80',
C ...          DC    CL1'U'
     A X'1F003F8031803180',X'3180318031803180',X'3180318031803180',
C ...          DC    CL1'V'
     A X'0E000E000E001B00',X'1B001B0011001100',X'3180318031803180',
C ...          DC    CL1'W'
     A X'208031802A802A80',X'2480208031803180',X'3180318031803180',
C ...          DC    CL1'X'
     A X'3180318011001B00',X'0E00040004000A00',X'1B00318031803180',
C ...          DC    CL1'Y'
     A X'0400040004000400',X'04000E001B003180',X'3180318031803180',
C ...          DC    CL1'Z'
     A X'3F803F8003000300',X'060006000C000C00',X'180018003F803F80',
C ...          DC    CL1'\'		!... STAR (5-POINTED)
     A X'208031801F001F00',X'3B807FC00E000400',X'0400000000000000',
C ...          DC    CL1'^'		!... GREATER THAN OR EQUAL TO
     A X'000000007F807F80',X'00007F807F803000',X'18000C0006000300',
C ...          DC    CL1'|'		!... STAR (6-POINTED) SNOW
     A X'0000408021003300',X'1E0073C0F3801E00',X'3300210040800000',
C ...          DC    CL1'}'		!... LWR HALF OF SOLID CIRCLE
     A X'0000000000000000',X'0000000000001E00',X'3F007F807F807F80' /

       END
