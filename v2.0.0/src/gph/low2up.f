      SUBROUTINE LOW2UP(NCHAR,INTEXT,IOUTXT,IERR)
C$$$  SUBPROGRAM DOCUMENTATION  BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    LOW2UP      CONVERTS LOWER CASE LETTERS TO UPPER CASE.
C   PRGMMR: KRISHNA KUMAR     ORG: W/NP12     DATE: 1999-07-01
C
C ABSTRACT: CONVERTS ANY LOWER CASE LETTERS TO UPPER CASE LETTERS
C   CHARACTERS. PLACES THE RESULT INTO IOUTXT.
C
C PROGRAM HISTORY LOG:
C   88-03-21  HENRICHSEN
C   95-06-22  SHIMOMURA  MODIFY TO RUN ON CRAY.
C 1999-07-01  KRISHNA KUMAR CONVERTED THIS CODE FROM CRAY 
C             TO IBM RS/6000.
C
C USAGE:    CALL LOW2UP(NCHAR,INTEXT,IOUTXT,IERR)
C   INPUT ARGUMENT LIST:
C     NCHAR    - IS THE NUMBER OF CHARACTERS IN STRING TO BE CONVERTED.
C     INTEXT   - IS THE GIVEN EBCDIC CHATACTER STRING TO CONVERT.
C
C   OUTPUT ARGUMENT LIST:
C     IOUTXT   - IS THE RESULTING CONVERTED TEXT STRING.
C     IERR     - 0 IS NORMAL RETURN
C     IERR     - 1 "NCHAR" CONTAINED VALUE OF ZERO OR WAS NEGATIVE.
C
C
C   OUTPUT FILES:
C     FT06F001 - ERROR PRINTS.
C
C REMARKS: BASE ON DAVIDS SUB UPPER_PH.
C
C ATTRIBUTES:
C   LANGUAGE: F90
C   MACHINE:  IBM
C
C$$$
C
C
      CHARACTER*1  INTEXT(NCHAR)
      CHARACTER*1  IOUTXT(NCHAR)
C
      INTEGER      I
      INTEGER      IDELTA
      INTEGER      IERR
      INTEGER      NCHAR
C
      IERR  = 0
      IDELTA= MOVA2I('A') - MOVA2I('a')
      I     = 1
      IF(NCHAR.LE.0) THEN
        IERR  = 1
      ELSE
        DO WHILE (I .LE. NCHAR)
           IF(LLT(INTEXT(I),'a') .OR. LGT(INTEXT(I),'z')) THEN
             IOUTXT(I) = INTEXT(I)
           ELSE
c           THIS IS A small LETTER. SO CAPITALIZE IT.
             IOUTXT(I) = CHAR(IDELTA + MOVA2I(INTEXT(I)))
           ENDIF
           I = I + 1
        ENDDO
      ENDIF
      RETURN
      END