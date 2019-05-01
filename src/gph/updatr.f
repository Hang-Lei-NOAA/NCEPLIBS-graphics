      SUBROUTINE UPDATR
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:  UPDATR        UPDATE OR BACK DATE A DATE/TIME.
C   PRGMMR: KUMAR         ORG: NP12       DATE:1999-08-20
C
C ABSTRACT: UPDATE OR BACKDATE A DATE TIME PASSED IN VIA COMMON
C  PACKRA.
C
C PROGRAM HISTORY LOG:
C   YY-MM-DD  ORIGINAL AUTHOR ????
C   88-10-11  HENRICHSEN  ADD DOC BLOCK AND CONVERT TO MVS FORTRAN 77.
C   95-10-06  LUKE LIN      CONVERT IT CFT-77.
C 1999-08-20  KRISHNA KUMAR CONVERTED THIS CODE FROM CRAY TO IBM RS/6000
C
C USAGE:    CALL UPDATR
C   INPUT ARGUMENT LIST:
C     COMMON   _ /PACKRA/JTIME(2),IVLDHR,IVLDAY,IVLDMO,IVLDYR,
C                        IHOUR,IDAY,IMONTH,IYR
C              - JTIME(1) IS NUMBER OF HOURS TO UPDATE
C              - (IF JTIME IS NEGATIVE IT WILL BACKDATE)
C              - THE ORIGINAL DATE/TIME IS GIVEN IN
C              - IHOUR,IDAY,IMONTH,IYR.
C
C   OUTPUT ARGUMENT LIST:
C     COMMON   _ /PACKRA/JTIME(2),IVLDHR,IVLDAY,IVLDMO,IVLDYR,
C                        IHOUR,IDAY,IMONTH,IYR
C              - THE UPDATED DATE/TIME IS RETURNED IN
C              - IVLDHR,IVLDAY,IVLDMO,IVLDYR.
C
C REMARKS: LIST CAVEATS, OTHER HELPFUL HINTS OR INFORMATION
C
C ATTRIBUTES:
C   LANGUAGE: F90
C   MACHINE:  IBM
C
C$$$
C
      COMMON   /PACKRA/JTIME(2),IVLDHR,IVLDAY,IVLDMO,IVLDYR,
     1                 IHOUR,IDAY,IMONTH,IYR
C
      INTEGER  ITABYR(13)
      INTEGER  LPTB(13)
      INTEGER  NOLPTB(13)
C
      DATA       LPTB      /0,744,1440,2184,2904,3648,4368,5112,
     1                      5856,6576,7320,8040,8784/
      DATA       NOLPTB    /0,744,1416,2160,2880,3624,4344,5088,
     1                      5832,6552,7296,8016,8760/
C
      ASSIGN 211 TO KABUL
      IVLDYR = IYR
      GO TO 500
C     ...WHERE 500 IS SUBROUTINE TO INITIALIZE ITABYR
C     ...AND RETURN THRU KABUL
  211 IHRYR = IHOUR + 24*(IDAY - 1) + ITABYR(IMONTH)
      IHRYR2 = IHRYR + JTIME(1)
C     ...TO TEST FOR BACKDATED INTO PREVIOUS YEAR...
  213 IF(IHRYR2 .LT. 0) GO TO 400
      DO  215  M=2,13
      IF(IHRYR2 .LT. ITABYR(M)) GO TO 222
  215 CONTINUE
C     ...IF IT FALLS THRU LOOP TO HERE, IT IS INTO NEXT YEAR...
      IVLDYR = IVLDYR + 1
      IHRYR2 = IHRYR2 - ITABYR(13)
      ASSIGN 219 TO KABUL
      GO TO 500
  219 GO TO 213
  222 IVLDMO = M - 1
      IHRMO = IHRYR2 - ITABYR(IVLDMO)
      NODAYS = IHRMO/24
      IVLDAY = NODAYS + 1
      IVLDHR = IHRMO - NODAYS*24
      GO TO 666
C     ...ALL FINISHED.  RETURN TO CALLING PROGRAM.......................
C     ...COMES TO 400 IF NEG TOTAL HRS. BACK UP INTO PREVIOUS YEAR
  400 IVLDYR = IVLDYR - 1
      ASSIGN 411 TO KABUL
      GO TO 500
C     ...WHICH IS CALL TO INITIALIZE ITABYR AND RETURN THRU KABUL
  411 IHRYR2 = ITABYR(13) + IHRYR2
      GO TO 213
C
C     ...SUBROUTINE INITYR...
C     ...CALLED BY GO TO 500 AFTER ASSIGNING RETURN NO. TO KABUL...
C     ...ITABYR HAS MONTHLY ACCUMULATING TOTAL HRS REL TO BEGIN OF YR.
C     ...DEPENDS ON WHETHER IVLDYR IS LEAP YEAR OR NOT.
  500 IQUOT = IVLDYR/4
      IRMNDR = IVLDYR - 4*IQUOT
      IF(IRMNDR .NE. 0) GO TO 511
C     ...WAS MODULO 4, SO MOST LIKELY A LEAP YEAR,
      IQUOT = IVLDYR/100
      IRMNDR = IVLDYR - 100*IQUOT
      IF(IRMNDR .NE. 0) GO TO 522
C     ...COMES THIS WAY IF A CENTURY YEAR...
      IQUOT = IVLDYR/400
      IRMNDR = IVLDYR - 400*IQUOT
      IF(IRMNDR .EQ. 0) GO TO 522
C     ...COMES TO 511 IF NOT A LEAP YEAR...
  511 DO  513  I = 1,13
      ITABYR(I) = NOLPTB(I)
  513 CONTINUE
      GO TO 533
C     ...COMES TO 522 IF LEAP YEAR
  522 DO  525  I = 1,13
      ITABYR(I) = LPTB(I)
  525 CONTINUE
  533 GO TO KABUL,(211,219,411)
C     ...WHICH RETURNS TO SECTION FROM WHICH CALLED.....................
  666 CONTINUE
      RETURN
      END