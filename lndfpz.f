       SUBROUTINE LNDFPZ(GGROUP,LEVEL,SPECS,VERTIC,STATUS,
     &                   ATTRIS)
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    LNDFPZ      ATTACH A LINE OF TEXT TO A DSIGN FILE.
C   PRGMMR: KRISHNA KUMAR       ORG: W/NP12   DATE: 1999-07-01
C
C ABSTRACT: INSERT A LINE OF TEXT AT THE END OF A DESIGN FILE.
C
C PROGRAM HISTORY LOG:
C   94-03-29 ORIGINAL AUTHOR L LIN
C   94-12-23 LUKE LIN      CONVERT IT TO CFT-77.
C   95-08-15 LUKE LIN      ADD LINE ATTRIBUTE INFORMATION THRU SPECS
C 1999-07-01 KRISHNA KUMAR CONVERTED THIS CODE FROM CRAY TO IBM RS/6000
C
C USAGE:    CALL LNDFPZ(GGROUP,LEVEL,SPECS,VERTIC,STATUS,
C    &                   ATTRIS)
C   INPUT ARGUMENT LIST:
C     GGROUP   - INTEGER*4 TWO WORD ARRAY WHERE:
C              - GGROUP(1) IS THE GRAPHIC GROUP CODE
C              - 0 = NO OPERATION MEANS GRAPHIC GROUP =0
C              - 1 = SET  GRAPHIC GROUP FROM (2)
C              - GGROUP(2) GRAPHIC GROUP NUMBER -
C   LEVEL - INTEGER*4 - BETWEEN 1 - 63. IF IT IS SET LESS THAN 0 OR GREA
C                       THAN 63 THEN IT WILL BE SET TO 1.
C   SPECS(5) - INTEGER*4 .. (1) CLASS FROM 0 TO 6
C                               0 = PRIMARY
C                               1 = PATTERN COMPONENT
C                               2 = CONSTRUCTION ELEMENT
C                               3 = DEMENTSIONING ELEMENT
C                               4 = PRIMARY RULE ELMENT
C                               5 = LINEAR PATTERNED ELEMENT
C                               6 = CONSTRUCTION RULE ELEMENT
C                           (2) NOT USED
C                           (3) STYLE : FROM 0 TO 7 SPECIFYING THE LINE
C                           (4) WEIGHT: FROM 0 TO 31 FOR LINE WEIGHT.
C                           (5) COLOR:  FROM 0 TO 127 FOR THE LINE COLOR
C   VERTIC(4) - INTEGER*4 .. THE VERTIC ARRAY ONLY FOR 2-D.
C   STATUS    - INTEGER*4 .. =0, NORMAL
C             -              =5, NOT ENOUGH BIN SPACE.
C   ATTRIS    - INTEGER*2 .. NOT USED.
C
C
C   OUTPUT ARGUMENT LIST:      (INCLUDING WORK ARRAYS)
C     WRKARG   - GENERIC DESCRIPTION, ETC., AS ABOVE.
C     OUTARG1  - EXPLAIN COMPLETELY IF ERROR RETURN
C     ERRFLAG  - EVEN IF MANY LINES ARE NEEDED
C
C   INPUT FILES:   (DELETE IF NO INPUT FILES IN SUBPROGRAM)
C     DDNAME1  - GENERIC NAME & CONTENT
C
C   OUTPUT FILES:  (DELETE IF NO OUTPUT FILES IN SUBPROGRAM)
C     DDNAME2  - GENERIC NAME & CONTENT AS ABOVE
C     FT06F001 - INCLUDE IF ANY PRINTOUT
C
C REMARKS:
C   THIS VERSION IS FOR THE BATCH JOB NOT FOR INTERACTIVE MICROSTATION
C   ENVIRONMENT.  AND ALSO ITS FORMAT IS THE EXTERNAL VAX FORMAT NOT
C   INTERNAL DGN FORMAT.
C
C ATTRIBUTES:
C   LANGUAGE: F90
C   MACHINE:  IBM
C
C$$$
C
       COMMON     / DGNBIN / VECBIN,MAXBIN,IMDEX,ITOTWD
C
       CHARACTER*1 NULL
C
       INTEGER    ATTRIS
       INTEGER    GG
       INTEGER    GGROUP(2)
       INTEGER    LEVEL
       INTEGER    MAXBUF
       INTEGER    MK00FF
       INTEGER    MSK7F
       INTEGER    MSK80
       INTEGER    PPERTY
       INTEGER    SBLOGY
       INTEGER    SPECS(5)
       INTEGER    STATUS
       INTEGER    TMPHGH
       INTEGER    TMPLOW
       INTEGER    VERTIC(4)
       INTEGER    WORD1
C
       INTEGER    BUFELM(768)
       INTEGER    VECBIN(409800)
C
       DATA       MAXBUF   /768/
       DATA       MK00FF   /Z'0000FFFF'/
       DATA       MSK7F    /Z'00007FFF'/
       DATA       MSK80    /Z'00008000'/
       DATA       PPERTY   /Z'00000000'/
       DATA       WORD1    / Z'00000300' /
C
       ITOT = 28
       STATUS = 0
       NULL = CHAR(0)
C      ... FOR WORD 1
       IF (LEVEL .LT. 1 .OR. LEVEL .GT. 63) LEVEL = 1
       WORD1 = IOR(WORD1,LEVEL)
       BUFELM(1) = WORD1
       BUFELM(2) = ITOT - 2
C
       TMPLOW = VERTIC(1)
       TMPLOW = MIN(TMPLOW,VERTIC(3))
       ITEMP = ISHFT(TMPLOW,-16)
       IF (TMPLOW .LT. 0) THEN
           BUFELM(3) = IAND(ITEMP,MSK7F)
       ELSE
           BUFELM(3) = IOR(ITEMP,MSK80)
       ENDIF
       BUFELM(4) = IAND(TMPLOW,MK00FF)
C      PRINT *,' XLOW=',TMPLOW,BUFELM(3),BUFELM(4)
C      ... FOR XLOW
       TMPLOW = VERTIC(2)
       TMPLOW = MIN(TMPLOW,VERTIC(4))
       ITEMP = ISHFT(TMPLOW,-16)
       IF (TMPLOW .LT. 0) THEN
           BUFELM(5) = IAND(ITEMP,MSK7F)
       ELSE
           BUFELM(5) = IOR(ITEMP,MSK80)
       ENDIF
       BUFELM(6) = IAND(TMPLOW,MK00FF)
C      PRINT *,' YLOW=',TMPLOW,BUFELM(5),BUFELM(6)
C      ... FOR YLOW
       BUFELM(7) = 0
       BUFELM(8) = 0
C      ... ZLOW
       TMPHGH = VERTIC(1)
       TMPHGH = MAX(TMPHGH,VERTIC(3))
       ITEMP = ISHFT(TMPHGH,-16)
       IF (TMPHGH .LT. 0) THEN
           BUFELM(9) = IAND(ITEMP,MSK7F)
       ELSE
           BUFELM(9) = IOR(ITEMP,MSK80)
       ENDIF
       BUFELM(10) = IAND(TMPHGH,MK00FF)
C      PRINT *,' XHGH=',TMPHGH,BUFELM(9),BUFELM(10)
C      ... FOR XHGH
       TMPHGH = VERTIC(2)
       TMPHGH = MAX(TMPHGH,VERTIC(4))
       ITEMP = ISHFT(TMPHGH,-16)
       BUFELM(11) = IAND(ITEMP,MSK7F)
       IF (TMPHGH .LT. 0) THEN
           BUFELM(11) = IAND(ITEMP,MSK7F)
       ELSE
           BUFELM(11) = IOR(ITEMP,MSK80)
       ENDIF
       BUFELM(12) = IAND(TMPHGH,MK00FF)
C      PRINT *,' YHGH=',TMPHGH,BUFELM(11),BUFELM(12)
C      ... FOR YHGH
       BUFELM(13) = -1
       BUFELM(14) = -1
C      ... ZHGH
       GG = 0
       IF (GGROUP(1) .EQ. 1) GG = GGROUP(2)
       BUFELM(15) = GG
C      ... FOR GRAPHICS GROUPS
       BUFELM(16) = ITOT - 16
C      ... FOR INDEX TO ATTRUBITES
       IF (SPECS(1).LT.0 .OR. SPECS(1).GT. 6) SPECS(1) = 0
       PPERTY = IOR(PPERTY,SPECS(1))
       BUFELM(17) = PPERTY
C      ... FOR PROPERTIES INDICATOR
       IF (SPECS(3).LT.0 .OR. SPECS(3).GT. 7) SPECS(3)=MOD(SPECS(3),8)
       IF (SPECS(4).LT.0 .OR. SPECS(4).GT. 31)
     &              SPECS(4)=MOD(SPECS(4),32)
       IF (SPECS(5).LT.0 .OR. SPECS(5).GT. 127)
     &               SPECS(5)=MOD(SPECS(5),128)
C      PRINT *,' in ln, SPEC3/5', SPECS(3), ' ', SPECS(5)
       ITEMP = ISHFT(SPECS(5),8)
       ITEMP = IOR(ITEMP,ISHFT(SPECS(4),3))
       ITEMP = IOR(ITEMP,SPECS(3))
       SBLOGY = ITEMP
       BUFELM(18) = 0
C      ... UNUSED
       BUFELM(19) = SBLOGY
C      ... FOR DISPLAY SYMBOLOGY
       BUFELM(20) = 0
C      ... UNUSED
       ITOT = 20
       DO I=1, 2
          BUFELM(ITOT +1) = ISHFT(VERTIC(I),-16)
          BUFELM(ITOT +2) = IAND(VERTIC(I),MK00FF)
          ITOT = ITOT + 2
       ENDDO
C         BUFELM(ITOT +1) = 0
C         BUFELM(ITOT +2) = 0
C         ITOT = ITOT + 2
       DO I=3, 4
          BUFELM(ITOT +1) = ISHFT(VERTIC(I),-16)
          BUFELM(ITOT +2) = IAND(VERTIC(I),MK00FF)
          ITOT = ITOT + 2
       ENDDO
C         BUFELM(ITOT +1) = 0
C         BUFELM(ITOT +2) = 0
C         ITOT = ITOT + 2
C      ... INSERT X/Y VERTICES
       ISAVE = ITOT + IMDEX
C      PRINT *,' BEFORE INSERT A LINE :',ITOT,IMDEX
       IF (ISAVE .GT. MAXBIN) THEN
          WRITE(6,FMT='('' LNDFPZ: NOT ENOUGH BIN SPACE!'')')
          STATUS = 5
       ELSE
        DO I= 1, ITOT
           VECBIN(IMDEX + I) = BUFELM(I)
        ENDDO
        IMDEX = ISAVE
C      PRINT *,' AFTER  INSERT A LINE :',IMDEX
C      ...STORE A LINE ELEMENT INTO BIN
C
       ENDIF
       END
