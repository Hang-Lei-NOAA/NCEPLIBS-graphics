       BLOCK DATA  CHINDX
C      ... added font44 (for WNDCLDFX)             16-Jan-1997/dss

C                                                  10-Oct-1996/dss
C      ... modified font01; font02
C                                                   3-Jan-1996/dss

       COMMON /CHINDEX/LMTNFONTS,NCDEFSPFONT,KIXALL
       INTEGER        LMTNFONTS
       INTEGER        NCDEFSPFONT(63)

       INTEGER        KIXALL(8,63)
       CHARACTER*64  CHIXALL(63)
       EQUIVALENCE   (KIXALL(1,1),CHIXALL(1))

       INTEGER        KIX_12(8)   		!...(-4x4) line-elements
       EQUIVALENCE   (KIXALL(1,12),KIX_12(1))

       INTEGER        KIX_13(8)			!... horiz lines 
       EQUIVALENCE   (KIXALL(1,13),KIX_13(1))
 
       INTEGER        KIX_14(8)			!... empty
       EQUIVALENCE   (KIXALL(1,14),KIX_14(1))

       INTEGER        KIX_20(8)			!... eraser
       EQUIVALENCE   (KIXALL(1,20),KIX_20(1))

       INTEGER        KIX_39(8)			!... directional arrows
       EQUIVALENCE   (KIXALL(1,39),KIX_39(1))

       DATA           LMTNFONTS / 44 /

C
       DATA           NCDEFSPFONT  / 64,19,51,45,45, 10,15,08,11,20,
     1                               53,26,33,00,13, 01,01,13,42,01,
     2                               53,13,13,42,18, 36,23,11,11,11,
     3                               10,10,43,23,16, 20,02,29,36,36,
     4                               36,10,07,55, 0,  0, 0, 0, 0, 0,
     5                               10*0,
     6                                3*0  /

C     . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
C   LUKSTD OR  CD1=(10X12) 64 CHARACTERS REGULAR SIZE
C                               123 45678901234567890123456789012
       data chixall(1)(1:32)  /' %&''()*+,-./0123456789:;<=>ABCDE' /
       data chixall(1)(33:64) /'FGHIJKLMNOPQRSTUVWXYZ\^abcdefy|}' /
C                               34567890123456789012345678901234
C      ... augmented font01 on 2-Oct-1996/dss

C                                  123 45678901234567890123456789012
C ...     data chixall(1)(1:32)  /' &''()*+,-./0123456789<ABCDEFGHIJ' /
C ...     data chixall(1)(33:64) /'KLMNOPQRSTUVWXYZ\abcdef|}       '  /
C                                  34567890123456789012345678901234

*   LOOK2 OR  CD2=(12X14) 19 CHARACTERS HOLLOW
C                               12345678901234567890123456789012
       data chixall(2)(1:32)  /' *+-.0123456789<FHL             ' /
       data chixall(2)(33:64) /'                                ' /
C                               34567890123456789012345678901234
C      ---------------------------------------------------------------

*   LOOK3 OR  CD3=(12x-10) 51 CHARACTERS SIDEWAYS REGULAR
C                               12 345678901234567890123456789012
       data chixall(3)(1:32)  /' &''()+,-./0123456789<ABCDEFGHIJK' /
       data chixall(3)(33:64) /'LMNOPQRSTUVWXYZ\^|}             ' /
C                               34567890123456789012345678901234

C     LUKTINY OR  CD4=(6X8) 45 CHARACTERS SMALL UPRIGHT
C                               12345678901234567890123456789012
       data chixall(4)(1:32)  /' ()*+,-./0123456789ABCDEFGHIJKLM' /
       data chixall(4)(33:64) /'NOPQRSTUVWXYZ                   ' /

C     LIKTINY OR  CD5=(8X-6) 45 CHARACTERS SMALL SIDEWAYS
C                               12345678901234567890123456789012
       data chixall(5)(1:32)  /' ()*+,-./0123456789ABCDEFGHIJKLM' /
       data chixall(5)(33:64) /'NOPQRSTUVWXYZ                   ' /

C     LUKFLG1 OR  CD6=(-6X12) 10 WIND FLAG 1
C                               12345678901234567890123456789012
       data chixall(6)(1:32)  /'0123HIJKLZ                      ' /
       data chixall(6)(33:64) /'                                ' /

C     LOOK7 OR  CD7=(-12X6) 15 WIND FLAG 2
C                               12345678901234567890123456789012
       data chixall(7)(1:32)  /'89ABCDEFGHQRSTU                 ' /
       data chixall(7)(33:64) /'                                ' /

C     LOOK8 OR  CD8=(-9X12) 8 WIND FLAG3
C                               12345678901234567890123456789012
       data chixall(8)(1:32)  /'456GMNOY                        ' /
       data chixall(8)(33:64) /'                                ' /

C     LOOK9 OR  CD9=(-12X9) 11 WIND FLAG 4
C                               12345678901234567890123456789012
       data chixall(9)(1:32)  /'7ABCDEFPVWX                     ' /
       data chixall(9)(33:64) /'                                ' /

C     -------------------------------------------------------------------
C     LUKHURR OR CD10=(-30X30) 20 CHARACTERS CIR,BOX,RT BRACKET,HURR,DUCK
C                                12345678901234567890123456789012
       data chixall(10)(1:32)  /'()>BCDEFGIJKLMNOPQRS            ' /
       data chixall(10)(33:64) /'                                ' /
C     ------------------------------------------------------------------


C     LOOK11 OR CD11=(15X20) 53 CHARACTERS GIANT SIZE
C                                123 45678901234567890123456789012
       data chixall(11)(1:32)  /' &''()*+,-./0123456789:;<ABCDEFGH' /
       data chixall(11)(33:64) /'IJKLMNOPQRSTUVWXYZ\^|           ' /

C     LOOK12 OR  CD12=(-4X4) 26 SCAN LINE CONTOUR VECTORS
C                                123 45678901234567890123456789012
       data kix_12  /          X'0807060504030201',
     2                         X'100F0E0D0C0B0A09',
     3                         X'1817161514131211',
     4                         X'0000000000001A19',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000'  /

C     LUKHLNS OR  CD13=(-32X1) 33 HORIZONTAL LINES
       DATA         KIX_13 /   X'0807060504030201',
     2                         X'100F0E0D0C0B0A09',
     3                         X'1817161514131211',
     4                         X'201F1E1D1C1B1A19',
     5                         X'0000000000000021',
     6                         X'2020202020202020',
     7                         X'2020202020202020',
     8                         X'2020202020202020' /

C     LOOK14 OR  CD14=(15x20) 34 CHARACTERS RUSSIAN (ZEROED OUT)
       DATA KIX_14  /  8*0 /

C     LOOK15 OR  CD15=(12X16) 13 WHITE ON BLACK NUMBERS
C                                12345678901234567890123456789012
       data chixall(15)(1:32)  /' +-0123456789                   ' /
       data chixall(15)(33:64) /'                                ' /

C      LOOK16 OR  CD16=(20X6) 1 HORIZONTAL BAR
C                                12345678901234567890123456789012
       data chixall(16)(1:32)  /'A                               ' /
       data chixall(16)(33:64) /'                                ' /

C      LOOK17 OR  CD17=(6X-20) 1 VERTICAL BAR
C                                12345678901234567890123456789012
       data chixall(17)(1:32)  /'A                               ' /
       data chixall(17)(33:64) /'                                ' /

C     LOOK18 OR  CD18=(12X14) 13 CHARACTERS ITALICS
C                                12345678901234567890123456789012
       data chixall(18)(1:32)  /' +-0123456789                   ' /
       data chixall(18)(33:64) /'                                ' /


C     LOOK19 OR  CD19=(7X10) 42 CHARACTERS WIND DIRECTION DIGIT + ALPH
C                                12345678901234567890123456789012
       data chixall(19)(1:32)  /' *+-./0123456789ABCDEFGHIJKLMNOP' /
       data chixall(19)(33:64) /'QRSTUVWXYZ                      ' /


C      LOOK20 OR CD20=(30X30) 1 ZERO ARRAY USED FOR ERASING
       DATA KIX_20  /          X'0000000000000001',
     2                         X'0000000000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK21 OR  CD21=( 20 X -15) 53 CHARACTER GIANT SIZE SIDEWAYS
C                                123 45678901234567890123456789012
       data chixall(21)(1:32)  /' &''()*+,-./0123456789:;<ABCDEFGH' /
       data chixall(21)(33:64) /'IJKLMNOPQRSTUVWXYZ\^|           ' /

C      LOOK22 OR  CD22=( 16 X -12) 13 NUMBERS WHITE ON BLACK SIDEWAYS
C                                12345678901234567890123456789012
       data chixall(22)(1:32)  /' +-0123456789                   ' /
       data chixall(22)(33:64) /'                                ' /

C     LOOK23 OR CD23=( 14 X -12) 13 NUMBERS ITALICS   SIDEWAYS
C                                12345678901234567890123456789012
       data chixall(23)(1:32)  /' +-0123456789                   ' /
       data chixall(23)(33:64) /'                                ' /

C      LOOK24 OR CD24=(10X-7)  42 WIND DIR DIGIT + ALPHA  SIDEWAYS
C                                12345678901234567890123456789012
       data chixall(24)(1:32)  /' *+-./0123456789ABCDEFGHIJKLMNOP' /
       data chixall(24)(33:64) /'QRSTUVWXYZ                      ' /

C       LOOK25 OR CD25=( 14 X -12)  18 HOLLOW CHARACTERS  SIDEWAYS
C                                12345678901234567890123456789012
       data chixall(25)(1:32)  /' *+-.0123456789FHL              ' /
       data chixall(25)(33:64) /'                                ' /


C     LOOK26 OR CD26=(-16 X 16) 36 DIRECTION ARROWHEADS
C                                12345678901234567890123456789012
       data chixall(26)(1:32)  /'0123456789ABCDEFGHIJKLMNOPQRSTUV' /
       data chixall(26)(33:64) /'WXYZ                            ' /

C      ---------------------------------------------------------------
C*27   LEEKSKYN OR  CD27=(15X-15) 23 MERCATOR SKY COVERAGE SYMBOLS  (N)
C                                12345678901234567890123456789012
       data chixall(27)(1:32)  /'ABCDEFGHIJKLMNOPQRSTUVW         ' /
       data chixall(27)(33:64) /'                                ' /

C*28   LEEKCLDL OR  CD28=(12X-15)  11 SIDEWAYS LOW CLOUD SYMBOLS    (CL)
C                                12345678901234567890123456789012
       data chixall(28)(1:32)  /'ABCDEFGHIJK                     ' /
       data chixall(28)(33:64) /'                                ' /

C*29   LEEKCLDM OR  CD29=(12X-15)  11 MID CLOUD SYMBOLS     (CM)
C                                12345678901234567890123456789012
       data chixall(29)(1:32)  /'ABCDEFGHIJK                     ' /
       data chixall(29)(33:64) /'                                ' /

C*30   LEEKCLDH OR  CD30=(12X-15)  11 HI CLOUD SYMBOLS      (CH)
C                                12345678901234567890123456789012
       data chixall(30)(1:32)  /'ABCDEFGHIJK                     ' /
       data chixall(30)(33:64) /'                                ' /

C*31   LEEKAOFP OR  CD31=(12X-15)  10 PRESSURE TENDENCY SYMBOLS (A)
C                                12345678901234567890123456789012
       data chixall(31)(1:32)  /'ABCDEFGHIJ                      ' /
       data chixall(31)(33:64) /'                                ' /

C     LOOK32 OR  CD32=(15X-15)  10 SIDEWAYS PAST WEATHER SYMBOLS (WW)
C                                12345678901234567890123456789012
       data chixall(32)(1:32)  /'ABCDEFGHIJ                      ' /
       data chixall(32)(33:64) /'                                ' /

C     LOOK33 OR  CD33=(15X-15)  43 SFC SIDEWAYS PRESENT WEA SYMBOLS (WW)
C                                12345678901234567890123456789012
       data chixall(33)(1:32)  /'()+,-./0123456789ABCDEFGHIJKLMNO' /
       data chixall(33)(33:64) /'PQRSTUVWXYZ                     ' /

C     LOOK34 OR  CD34=(20X-15)  23 SFC SIDEWAYS PRESENT WEA SYMBOLS (WW)
C                                12345678901234567890123456789012
       data chixall(34)(1:32)  /'ABCDEFGHIJKLPQRSTUVWXYZ         ' /
       data chixall(34)(33:64) /'                                ' /

C     LOOK35 OR  CD35(15X-20)  16 SFC SIDEWAYS PRESENT WEA SYMBOLS (WW)
C                                12345678901234567890123456789012
       data chixall(35)(1:32)  /'ABCDEFGHIJKLMNOP                ' /
       data chixall(35)(33:64) /'                                ' /

C     LOOK36 OR  CD36=(20X-20)  20 SFC SIDEWAYS PRESENT WEA SYMBOLS (WW)
C                                12345678901234567890123456789012
       data chixall(36)(1:32)  /'ABCDEFGHIJKLMNOPQRST            ' /
       data chixall(36)(33:64) /'                                ' /

C     LOOK37 OR  CD37=(-19X-19)  2 SPECIAL NON-ERASING:CIRCLE, OVAL - SW 
C                                12345678901234567890123456789012
       data chixall(37)(1:32)  /'CD                              ' /
       data chixall(37)(33:64) /'                                ' /

C      LOOK38 OR  CD38=(-8X8) 29 CHARACTERS VECTOR 8PIXEL LINE ELEMENT
C                                12345678901234567890123456789012
       data chixall(38)(1:32)  /'012ABCDEFGHIJKLMNOPQRSTUVWXYZ   ' /
       data chixall(38)(33:64) /'                                ' /

C*39   LOOKAROW OR  CD39=(16X16)  36 DIRECTIONAL ARROWS

       DATA         KIX_39 /   X'0807060504030201',
     2                         X'100F0E0D0C0B0A09',
     3                         X'1817161514131211',
     4                         X'201F1E1D1C1B1A19',
     5                         X'0000000024232221',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /
C*40   LOOKPIPW OR  CD40=(20X20)  36 WARM FRONT PIPS
C                                12345678901234567890123456789012
       data chixall(40)(1:32)  /'0123456789ABCDEFGHIJKLMNOPQRSTUV' /
       data chixall(40)(33:64) /'WXYZ                            ' /

C*41   LOOKPIPC OR  CD41=(20X20)  36 COLD FRONT PIPS
C                                12345678901234567890123456789012
       data chixall(41)(1:32)  /'0123456789ABCDEFGHIJKLMNOPQRSTUV' /
       data chixall(41)(33:64) /'WXYZ                            ' /

C*42   LEEKPARN OR  CD42=(16X-8)  10 SIDEWAYS SPECIAL CHARACTERS
C                                12345678901234567890123456789012
       data chixall(42)(1:32)  /'().ABCDE[]                      ' /
       data chixall(42)(33:64) /'                                ' /

C      LOOK43 OR  CD43=(20X14) 7 PILOT SYMBOLS
C                                12345678901234567890123456789012
       data chixall(43)(1:32)  /'1234567                         ' /
       data chixall(43)(33:64) /'                                ' /

C      . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
C      LOOK44 OR  CD44=(10X12) 55 WNDCLDFX SYMBOLS
C                                123345678901234567890123456789012
       data chixall(44)(1:32)  /' !&''()*+,-./0123456789;<>ABCDEFG' /
       data chixall(44)(33:64) /'HIJKLMNOPQRSTUVWXYZ\^|}         ' /
C                                12345678901234567890123456789012

       end
