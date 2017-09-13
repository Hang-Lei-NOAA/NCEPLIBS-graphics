       BLOCK DATA  CHINDXE
C                                                  25-JAN-1996/DSS
C      CHINDXE IS SYMBOL INDEX TABLE FOR GIVEN EBCDIC CHAR
C      FOR THE CASE OF A LABEL-ARRAY TAPE55 FROM THE IBM
C      INSTEAD OF THE EXPECTED ASCII CODE
C
C                                                   3-Jan-1996/dss

       COMMON /CHINDXEB/LMTNFONTE,NCDEFSFONTE,KIXALLE
       INTEGER        LMTNFONTE
       INTEGER        NCDEFSFONTE(63)
       INTEGER        KIXALLE(8,63)

       CHARACTER*64  CHIXALL(63)
       EQUIVALENCE   (KIXALLE(1,1),CHIXALL(1))

       INTEGER        KIX_01(8)
       EQUIVALENCE   (KIXALLE(1,01),KIX_01(1))
       INTEGER        KIX_02(8)
       EQUIVALENCE   (KIXALLE(1,02),KIX_02(1))
       INTEGER        KIX_03(8)
       EQUIVALENCE   (KIXALLE(1,03),KIX_03(1))
       INTEGER        KIX_04(8)
       EQUIVALENCE   (KIXALLE(1,04),KIX_04(1))
       INTEGER        KIX_05(8)
       EQUIVALENCE   (KIXALLE(1,05),KIX_05(1))
       INTEGER        KIX_06(8)
       EQUIVALENCE   (KIXALLE(1,06),KIX_06(1))
       INTEGER        KIX_07(8)
       EQUIVALENCE   (KIXALLE(1,07),KIX_07(1))
       INTEGER        KIX_08(8)
       EQUIVALENCE   (KIXALLE(1,08),KIX_08(1))
       INTEGER        KIX_09(8)
       EQUIVALENCE   (KIXALLE(1,09),KIX_09(1))
       INTEGER        KIX_10(8)
       EQUIVALENCE   (KIXALLE(1,10),KIX_10(1))
       INTEGER        KIX_11(8)
       EQUIVALENCE   (KIXALLE(1,11),KIX_11(1))

       INTEGER        KIX_12(8)
       EQUIVALENCE   (KIXALLE(1,12),KIX_12(1))
       INTEGER        KIX_13(8)
       EQUIVALENCE   (KIXALLE(1,13),KIX_13(1))
       INTEGER        KIX_14(8)
       EQUIVALENCE   (KIXALLE(1,14),KIX_14(1))

       INTEGER        KIX_15(8)
       EQUIVALENCE   (KIXALLE(1,15),KIX_15(1))
       INTEGER        KIX_16(8)
       EQUIVALENCE   (KIXALLE(1,16),KIX_16(1))
       INTEGER        KIX_17(8)
       EQUIVALENCE   (KIXALLE(1,17),KIX_17(1))
       INTEGER        KIX_18(8)
       EQUIVALENCE   (KIXALLE(1,18),KIX_18(1))
       INTEGER        KIX_19(8)
       EQUIVALENCE   (KIXALLE(1,19),KIX_19(1))

       INTEGER        KIX_20(8)
       EQUIVALENCE   (KIXALLE(1,20),KIX_20(1))
       INTEGER        KIX_21(8)
       EQUIVALENCE   (KIXALLE(1,21),KIX_21(1))
       INTEGER        KIX_22(8)
       EQUIVALENCE   (KIXALLE(1,22),KIX_22(1))
       INTEGER        KIX_23(8)
       EQUIVALENCE   (KIXALLE(1,23),KIX_23(1))
       INTEGER        KIX_24(8)
       EQUIVALENCE   (KIXALLE(1,24),KIX_24(1))
       INTEGER        KIX_25(8)
       EQUIVALENCE   (KIXALLE(1,25),KIX_25(1))
       INTEGER        KIX_26(8)
       EQUIVALENCE   (KIXALLE(1,26),KIX_26(1))
       INTEGER        KIX_27(8)
       EQUIVALENCE   (KIXALLE(1,27),KIX_27(1))
       INTEGER        KIX_28(8)
       EQUIVALENCE   (KIXALLE(1,28),KIX_28(1))

       DATA           LMTNFONTE / 28 /

       DATA           NCDEFSFONTE  / 57,18,45,45,45, 10,15,08,11,09,
     1                               53,26,01,00,13, 01,01,13,42,01,
     2                               53,13,13,42,18, 36,07,29, 0, 0,
     3                               10*0,
     4                               10*0,
     5                               10*0,
     6                                3*0  /

C                               123 45678901234567890123456789012
C ...  data chixall(1)(1:32)  /' &''()*+,-./0123456789<ABCDEFGHIJ' /
C ...  data chixall(1)(33:64) /'KLMNOPQRSTUVWXYZ\abcdef|}       '  /
C                               34567890123456789012345678901234
       DATA KIX_01  /          X'40507D4D5D5C4E6B',
     2                         X'604B61F0F1F2F3F4',
     3                         X'F5F6F7F8F94CC1C2',
     4                         X'C3C4C5C6C7C8C9D1',
     5                         X'D2D3D4D5D6D7D8D9',
     6                         X'E2E3E4E5E6E7E8E9',
     7                         X'E08182838485864F',
     8                         X'D000000000000000' /

*   LOOK2 OR  CD2=(12X14) 18 CHARACTERS HOLLOW
C                               12345678901234567890123456789012
C ...  data chixall(2)(1:32)  /' *+-.0123456789FHL              ' /
C ...  data chixall(2)(33:64) /'                                ' /
C                               34567890123456789012345678901234
       DATA KIX_02  /          X'405C4E604BF0F1F2',
     2                         X'F3F4F5F6F7F8F9C6',
     3                         X'C8D3000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /
*   LOOK3 OR  CD3=(-10X12) 45 CHARACTERS SIDEWAYS REGULAR
C                               12345678901234567890123456789012
C ...  data chixall(3)(1:32)  /' ()*+,-./0123456789ABCDEFGHIJKLM' /
C ...  data chixall(3)(33:64) /'NOPQRSTUVWXYZ                   ' /
       DATA KIX_03  /          X'404D5D5C4E6B604B',
     2                         X'61F0F1F2F3F4F5F6',
     3                         X'F7F8F9C1C2C3C4C5',
     4                         X'C6C7C8C9D1D2D3D4',
     5                         X'D5D6D7D8D9E2E3E4',
     6                         X'E5E6E7E8E9000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LUKTINY OR  CD4=(6X8) 45 CHARACTERS SMALL UPRIGHT
C                               12345678901234567890123456789012
C ...  data chixall(4)(1:32)  /' ()*+,-./0123456789ABCDEFGHIJKLM' /
C ...  data chixall(4)(33:64) /'NOPQRSTUVWXYZ                   ' /
       DATA KIX_04  /          X'404D5D5C4E6B604B',
     2                         X'61F0F1F2F3F4F5F6',
     3                         X'F7F8F9C1C2C3C4C5',
     4                         X'C6C7C8C9D1D2D3D4',
     5                         X'D5D6D7D8D9E2E3E4',
     6                         X'E5E6E7E8E9000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LIKTINY OR  CD5=(8X-6) 45 CHARACTERS SMALL SIDEWAYS
C                               12345678901234567890123456789012
C ...  data chixall(5)(1:32)  /' ()*+,-./0123456789ABCDEFGHIJKLM' /
C ...  data chixall(5)(33:64) /'NOPQRSTUVWXYZ                   ' /
       DATA KIX_05  /          X'404D5D5C4E6B604B',
     2                         X'61F0F1F2F3F4F5F6',
     3                         X'F7F8F9C1C2C3C4C5',
     4                         X'C6C7C8C9D1D2D3D4',
     5                         X'D5D6D7D8D9E2E3E4',
     6                         X'E5E6E7E8E9000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LUKFLG1 OR  CD6=(-6X12) 10 WIND FLAG 1
C                               12345678901234567890123456789012
C ...  data chixall(6)(1:32)  /'0123HIJKLZ                      ' /
C ...  data chixall(6)(33:64) /'                                ' /
       DATA KIX_06  /          X'F0F1F2F3C8C9D1D2',
     2                         X'D3E9000000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK7 OR  CD7=(-12X6) 15 WIND FLAG 2
C                               12345678901234567890123456789012
C ...  data chixall(7)(1:32)  /'89ABCDEFGHQRSTU                 ' /
C ...  data chixall(7)(33:64) /'                                ' /
       DATA KIX_07  /          X'F8F9C1C2C3C4C5C6',
     2                         X'C7C8D8D9E2E3E400',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK8 OR  CD8=(-9X12) 8 WIND FLAG3
C                               12345678901234567890123456789012
C ...  data chixall(8)(1:32)  /'456GMNOY                        ' /
C ...  data chixall(8)(33:64) /'                                ' /
       DATA KIX_08  /          X'F4F5F6C7D4D5D6E8',
     2                         X'0000000000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK9 OR  CD9=(-12X9) 11 WIND FLAG 4
C                               12345678901234567890123456789012
C ...  data chixall(9)(1:32)  /'7ABCDEFPVWX                     ' /
C ...  data chixall(9)(33:64) /'                                ' /
       DATA KIX_09  /          X'F7C1C2C3C4C5C6D7',
     2                         X'E5E6E70000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK10 OR  CD10=(-30X30) 9 CHARACTERS CIRCLE,BOX,HURRICANE,
C                                12345678901234567890123456789012
C ...  data chixall(10)(1:32)  /'()CDMNOPQ                       ' /
C ...  data chixall(10)(33:64) /'                                ' /
       DATA KIX_10  /          X'4D5DC3C4D4D5D6D7',
     2                         X'D800000000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK11 OR CD11=(15X20) 53 CHARACTERS GIANT SIZE
C                                123 45678901234567890123456789012
C ...  data chixall(11)(1:32)  /' &''()*+,-./0123456789:;<ABCDEFGH' /
C ...  data chixall(11)(33:64) /'IJKLMNOPQRSTUVWXYZ\^|           ' /
       DATA KIX_11  /          X'40507D4D5D5C4E6B',
     2                         X'604B61F0F1F2F3F4',
     3                         X'F5F6F7F8F97A5E4C',
     4                         X'C1C2C3C4C5C6C7C8',
     5                         X'C9D1D2D3D4D5D6D7',
     6                         X'D8D9E2E3E4E5E6E7',
     7                         X'E8E9E05F4F000000',
     8                         X'0000000000000000' /


C     LOOK12 OR  CD12=(-4X4) 26 SCAN LINE CONTOUR VECTORS
C                                123 45678901234567890123456789012
       data kix_12  /          X'0102030405060708',
     2                         X'090A0B0C0D0E0F10',
     3                         X'1112131415161718',
     4                         X'191A000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000'  /


C     LOOK13 OR  CD13=(-30X1) 1 HORIZONTAL LINE
       DATA KIX_13  /          X'0100000000000000',
     2                         X'0000000000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /


C     LOOK14 OR  CD14=(15x20) 34 CHARACTERS RUSSIAN (ZEROED OUT)
       DATA KIX_14  /  8*0 /

C     LOOK15 OR  CD15=(12X16) 13 WHITE ON BLACK NUMBERS
C                                12345678901234567890123456789012
C ...  data chixall(15)(1:32)  /' +-0123456789                   ' /
C ...  data chixall(15)(33:64) /'                                ' /
       DATA KIX_15  /          X'404E60F0F1F2F3F4',
     2                         X'F5F6F7F8F9000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C      LOOK16 OR  CD16=(20X6) 1 HORIZONTAL BAR
C                                12345678901234567890123456789012
C ...  data chixall(16)(1:32)  /'A                               ' /
C ...  data chixall(16)(33:64) /'                                ' /
       DATA KIX_16  /          X'C100000000000000',
     2                         X'0000000000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C      LOOK17 OR  CD17=(6X-20) 1 VERTICAL BAR
C                                12345678901234567890123456789012
C ...  data chixall(17)(1:32)  /'A                               ' /
C ...  data chixall(17)(33:64) /'                                ' /
       DATA KIX_17  /          X'C100000000000000',
     2                         X'0000000000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK18 OR  CD18=(12X14) 13 CHARACTERS ITALICS
C                                12345678901234567890123456789012
C ...  data chixall(18)(1:32)  /' +-0123456789                   ' /
C ...  data chixall(18)(33:64) /'                                ' /
       DATA KIX_18  /          X'404E60F0F1F2F3F4',
     2                         X'F5F6F7F8F9000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /


C     LOOK19 OR  CD19=(7X10) 42 CHARACTERS WIND DIRECTION DIGIT + ALPH
C                                12345678901234567890123456789012
C ...  data chixall(19)(1:32)  /' *+-./0123456789ABCDEFGHIJKLMNOP' /
C ...  data chixall(19)(33:64) /'QRSTUVWXYZ                      ' /
       DATA KIX_19  /          X'405C4E604B61F0F1',
     2                         X'F2F3F4F5F6F7F8F9',
     3                         X'C1C2C3C4C5C6C7C8',
     4                         X'C9D1D2D3D4D5D6D7',
     5                         X'D8D9E2E3E4E5E6E7',
     6                         X'E8E9000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /


C      LOOK20 OR CD20=(30X30) 1 ZERO ARRAY USED FOR ERASING
       DATA KIX_20  /          X'0100000000000000',
     2                         X'0000000000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK21 OR  CD21=( 20 X -15) 53 CHARACTER GIANT SIZE SIDEWAYS
C                                123 45678901234567890123456789012
C ...  data chixall(21)(1:32)  /' &''()*+,-./0123456789:;<ABCDEFGH' /
C ...  data chixall(21)(33:64) /'IJKLMNOPQRSTUVWXYZ\^|           ' /
       DATA KIX_21  /          X'40507D4D5D5C4E6B',
     2                         X'604B61F0F1F2F3F4',
     3                         X'F5F6F7F8F97A5E4C',
     4                         X'C1C2C3C4C5C6C7C8',
     5                         X'C9D1D2D3D4D5D6D7',
     6                         X'D8D9E2E3E4E5E6E7',
     7                         X'E8E9E05F4F000000',
     8                         X'0000000000000000' /

C      LOOK22 OR  CD22=( 16 X -12) 13 NUMBERS WHITE ON BLACK SIDEWAYS
C                                12345678901234567890123456789012
C ...  data chixall(22)(1:32)  /' +-0123456789                   ' /
C ...  data chixall(22)(33:64) /'                                ' /
       DATA KIX_22  /          X'404E60F0F1F2F3F4',
     2                         X'F5F6F7F8F9000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK23 OR CD23=( 14 X -12) 13 NUMBERS ITALICS   SIDEWAYS
C                                12345678901234567890123456789012
C ...  data chixall(23)(1:32)  /' +-0123456789                   ' /
C ...  data chixall(23)(33:64) /'                                ' /
       DATA KIX_23  /          X'404E60F0F1F2F3F4',
     2                         X'F5F6F7F8F9000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK24 OR CD24=( 10 X -7) 42 WIND-DIR DIGITS + ALPHA  SIDEWAYS
C                                12345678901234567890123456789012
C ...  data chixall(24)(1:32)  /' *+-./0123456789ABCDEFGHIJKLMNOP' /
C ...  data chixall(24)(33:64) /'QRSTUVWXYZ                      ' /
       DATA KIX_24  /          X'405C4E604B61F0F1',
     2                         X'F2F3F4F5F6F7F8F9',
     3                         X'C1C2C3C4C5C6C7C8',
     4                         X'C9D1D2D3D4D5D6D7',
     5                         X'D8D9E2E3E4E5E6E7',
     6                         X'E8E9000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /


C       LOOK25 OR CD25=( 14 X -12)  18 HOLLOW CHARACTERS  SIDEWAYS
C                                12345678901234567890123456789012
C ...  data chixall(25)(1:32)  /' *+-.0123456789FHL              ' /
C ...  data chixall(25)(33:64) /'                                ' /
C                               34567890123456789012345678901234
       DATA KIX_25  /          X'405C4E604BF0F1F2',
     2                         X'F3F4F5F6F7F8F9C6',
     3                         X'C8D3000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /



C     LOOK26 OR CD26=(-16 X 16) 36 DIRECTION ARROWHEADS
C                                12345678901234567890123456789012
C ...  data chixall(26)(1:32)  /'0123456789ABCDEFGHIJKLMNOPQRSTUV' /
C ...  data chixall(26)(33:64) /'WXYZ                            ' /
       DATA KIX_26  /          X'F0F1F2F3F4F5F6F7',
     2                         X'F8F9C1C2C3C4C5C6',
     3                         X'C7C8C9D1D2D3D4D5',
     4                         X'D6D7D8D9E2E3E4E5',
     5                         X'E6E7E8E900000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C     LOOK27 OR  CD27=(20X14) 7 PILOT SYMBOLS
C                                12345678901234567890123456789012
C ...  data chixall(27)(1:32)  /'1234567                         ' /
C ...  data chixall(27)(33:64) /'                                ' /
       DATA KIX_27  /          X'F1F2F3F4F5F6F700',
     2                         X'0000000000000000',
     3                         X'0000000000000000',
     4                         X'0000000000000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /

C      LOOK28 OR  CD28=(-8X8) 29 CHARACTERS VECTOR 8PIXEL LINE ELEMENT
C                                12345678901234567890123456789012
C ...  data chixall(28)(1:32)  /'012ABCDEFGHIJKLMNOPQRSTUVWXYZ   ' /
C ...  data chixall(28)(33:64) /'                                ' /
       DATA KIX_28  /          X'F0F1F2C1C2C3C4C5',
     2                         X'C6C7C8C9D1D2D3D4',
     3                         X'D5D6D7D8D9E2E3E4',
     4                         X'E5E6E7E8E9000000',
     5                         X'0000000000000000',
     6                         X'0000000000000000',
     7                         X'0000000000000000',
     8                         X'0000000000000000' /


       end
