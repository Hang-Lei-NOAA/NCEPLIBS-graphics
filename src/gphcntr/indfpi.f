       SUBROUTINE INDFPI(UNUSE1,DGNSED,OPTYPE,CELLIB,FOMAT,UNUSE6,
     &                   STATUS,UNUSE8)
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    INDFPI      OPENS A DESIGN FILE.
C   PRGMMR: KRISHNA KUMAR       ORG: W/NP12    DATE: 1999-07-01
C
C ABSTRACT: OPEN A DGN FILE ONLY (NOT CELL LIBRARY)
C  AND SCAN THROUGH THE DGN FILE, SAVE THE ENTIRE FILE INTO BIN
C  AND GET THE POSITION THAT A NEW ELEMENT COULD BE ATTACHED AT
C  THE END.
C
C PROGRAM HISTORY LOG:
C   94-03-24  ORIGINAL AUTHOR L .LIN
C   94-06-02  HENRICHSEN ADD NEW DOCBLOCK FOR PRODUCTION AND REMOVE
C             LOWER CASE.
C   94-12-22  LUKE LIN       CONVERT IT TO CFT-77.
C   95-01-18  LUKE LIN       CHANGE I/O AND LOGIC
C 1999-07-01  KRISHNA KUMAR  MODIFIED THE CONFLICT OF ARGUMENT TYPES 
C                            AND CONVERTED THIS CODE FROM CRAY TO 
C                            IBM RS/6000 
C
C USAGE:    CALL INDFPI(UNUSE1,DGNSED,OPTYPE,CELLIB,FOMAT,UNUSE6,
C    &                   STATUS,UNUSE8)
C   INPUT ARGUMENT LIST:
C     UNUSE1   - INTEGER    .. UNUSE
C     DGNSED   - INTEGER   SEAD DESIGN FILE UNIT NUMBER.
C     OPTYPE   - INTEGER   ACCEPT 0 TO OPEN DGN FILE AND NOTHING
C              - ELSE.
C     CELLIB   - CELL LIBRARY NAME .. SET IT TO NULL
C              - NOT USED IN THIS VERSION.
C     FOMAT    - INTEGER   .. ONLY ACCEPT 0 AND NOTHING ELSE.
C     UNUSE6   - INTEGER   .. NOT USED
C     UNUSE8   - INTEGER   .. NOT USED
C
C   OUTPUT ARGUMENT LIST:
C     STATUS   - INTEGER   RETURN FLAG WHERE:
C              - =0 NORMAL
C              - =5 NOT ENOUGH BIN SPACE FOR INPUT DGN FILE
C              - =8 ERROR OPENING DESIGN FILE
C              - =9 ERROR WHILE SCANING INPUT DGN FILE
C              - =910 INVALID OPEN TYPE FOR INDFPI
C
C   INPUT FILES:
C     DGNSED   - THE DESIGN FILE.
C
C   OUTPUT FILES:
C     DGNSED   - THE DESIGN FILE.
C     FT06F001 - PRINT FILE.
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
       CHARACTER*(*) CELLIB
C
       INTEGER    DGNSED
       INTEGER    MSK7F
ckumar
       INTEGER    I8BUF(64) 
       CHARACTER*8  CI8BUF(64) 
       EQUIVALENCE (I8BUF,CI8BUF)
ckumar
       INTEGER    FOMAT
       INTEGER    I2BUF(256)
       INTEGER    OPTYPE
       INTEGER    STATUS
       INTEGER    UNUSE1
       INTEGER    UNUSE6
       INTEGER    UNUSE8
       INTEGER    VECBIN(409800)
C
C
       DATA       MSK7F        /Z'0000007F'/
C
C      ... WHERE 409800 HALFWORDS = 400 VAX BLOCKS
C
C
       NBUF = 0
       ITOT = 0
       STATUS = 0
C
       IF (OPTYPE .NE. 0) THEN
           WRITE(6,FMT='(/,'' INDFPI: INVALID OPEN TYPE. OPTYPE='',
     1         I5)')OPTYPE
          STATUS = 910
          RETURN
       ENDIF
C
       REWIND DGNSED
C      OPEN (UNIT=DGNSED,ERR=930,
C    &      FORM='FORMATTED',ACCESS='SEQUENTIAL')
C
       NBUF = 1
       ITOT = 0
  200  CONTINUE
C
C
         READ(DGNSED,ERR=920,END=300)I8BUF
ckumar
         print*,'In indfpi - dgnsed  ',dgnsed
ckumar
c
C        READ(DGNSED,FMT='(64A8)',ERR=920,END=300)
C    1         (I8BUF(M),M=1, 64)
C
C        WRITE(6,FMT='('' INDFPI: NBUF='',I6)')NBUF
C
          NBUF = NBUF + 1
          ISAVE = ITOT + 512
          IF(ISAVE .GT. MAXBIN) THEN
             WRITE(6,FMT='(/,'' INDFPI: FATAL ERROR, ARRAY TOO'',
     1           '' SMALL. MAXBIN='',I5)')MAXBIN
             STATUS = 5
             RETURN
          ENDIF
C
          CALL GBYTES(I8BUF,I2BUF,0,16,0,256)
C
          DO  II = 1, 256
           VECBIN(ITOT+II) = I2BUF(II)
          ENDDO
          ITOT = ITOT + 256
C
          GO TO 200
C
  300     CONTINUE
          WRITE(6,FMT='(/,'' INDFPI: END OF THE INPUT FILE='',I3,
     1        '' ITOT='', I6)')DGNSED,ITOT
          ITOTWD = ITOT
C
C         NOW DECODE THE DESIGN FILE.
C
          IMDEX = 0
  400     CONTINUE
           IMDEX = IMDEX + 1
            IWORD0 = VECBIN(IMDEX)
            IF ( IWORD0 .EQ. -1 .OR. IWORD0 .EQ. 0) THEN
              WRITE(6,FMT='('' INDFPI: HIT END-OF-DGN SEED FILE. '')')
              IMDEX = IMDEX - 1
            ELSE IF (IMDEX .GT. ITOTWD) THEN
              WRITE(6,FMT='('' INDFPI: ERROR'',
     1                      '' WHILE DECODING DGN-SEED FILE.'')')
              STATUS = 9
            ELSE
C
             IWORD0 = ISHFT(IWORD0,-8)
             ITYPE  = IAND(IWORD0,MSK7F)
             NOWORD = VECBIN(IMDEX + 1)
             IMDEX = IMDEX + NOWORD + 1
             GO TO 400
            ENDIF
         GO TO 999
C
C
  920   CONTINUE
         WRITE(6,FMT='(/,'' INDFPI: ERROR WHILE READING SEED'',
     1       '' DESIGN FILE!'')')
         STATUS = 948
         GO TO 999
C
  930    CONTINUE
         WRITE(6,FMT='(/,'' INDFPI: ERROR UNABLE TO OPEN SEED'',
     1       '' DESIGN FILE!'')')
          STATUS = 948
C
  999  CONTINUE
       END