       SUBROUTINE WRTDGN(OUTDGN,STATUS)
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    WRTDGN      WRITE AND CLOSE & INTERMEDIATE DESIGN FIL
C   PRGMMR: KRISHNA KUMAR      ORG: W/NP12    DATE: 1999-07-01
C
C ABSTRACT: WRITE AND CLOSE THE INTERMEDIATES DESIGN FILE.
C
C PROGRAM HISTORY LOG:
C   94-06-23  ORIGINAL AUTHOR LUKE LIN  
C   95-01-04  LUKE LIN      CONVERT IT CFT-77.
C   95-01-06  LUKE LIN      CHANGE SEQUENTIAL I/O TO UNBLOCKED WRITE.
C   95-01-10  LUKE LIN      MODIFY SWAPPING BYTES.
C   96-01-31  LUKE LIN      MOFIFY THE LAST RECORD.
C 1999-07-01  KRISHNA KUMAR CONVERTED FROM CRAY VERSION TO IBM RS/6000 
C
C USAGE:    CALL WRTDGN(OUTDGN,STATUS)
C   INPUT ARGUMENT LIST:
C     OUTDGN   - INTEGER*4 DESIGN FILE UNIT NUMBER.
C
C   OUTPUT ARGUMENT LIST:
C     STATUS   - INTEGER*2 RETURN FLAG WHERE:
C              - =0 NORMAL
C              - =7 ERROR WHILE WRITING THE DESIGN FILE.
C              - =6 UNABLE TO OPEN THE DESIGN FILE.
C
C   INPUT FILES:
C     OUTDGN   - THE DESIGN FILE.
C
C   OUTPUT FILES:
C     OUTDGN   - THE DESIGN FILE.
C     FT06F001 - PRINT FILE.
C
C ATTRIBUTES:
C   LANGUAGE: F90
C   MACHINE:  IBM
C
C$$$
C
       INTEGER       OUTDGN
       INTEGER       STATUS
C
       COMMON     / DGNBIN / VECBIN,MAXBIN,IMDEX,ITOTWD
       INTEGER    VECBIN(409800)
C
C      ... WHERE 409800 HALFWORDS = 400 VAX BLOCKS
C
       INTEGER*8    I8BUF(64)
C
      INTEGER       ITEMP,IBYTEL,IBYTER
      INTEGER       MSK0F
      INTEGER       MSKF0
C
      DATA          MSK0F   / Z'000000FF' /
      DATA          MSKF0   / Z'0000FF00' /
C
C
C      * * * * * * * * * * * * * * *  S T A R T  * * * * * * * * * * * *
C
       STATUS = 0
C
C
C      OPEN (UNIT=OUTDGN,ERR=930,
C    &      FORM='FORMATTED',ACCESS='SEQUENTIAL')
       OPEN (UNIT=OUTDGN,ERR=930,
     &      FORM='UNFORMATTED',ACCESS='SEQUENTIAL')
C
C         CALCULATE NUMBER RECORDS FOR OUTPUT FILE
C
         IMDEX = IMDEX + 1
C        VECBIN(IMDEX) = - 1
         VECBIN(IMDEX) = 0
         NORECS = IMDEX / 256
         NOREM = IMDEX - 256*NORECS
         ITOTAL = IMDEX
         IF (NOREM .GT. 0) THEN
            NORECS = NORECS + 1
            ITOTAL = NORECS * 256
            DO I=IMDEX+1, ITOTAL
                VECBIN(I)=0
            ENDDO
         ENDIF
C
         PRINT *,' IMDEX, NOREC=', IMDEX, NORECS
C
C          SWAP THE BYTE ORDER ...
C
C      CALL SWABYT(IMDEX,VECBIN,VECBIN)
C
      DO 100 I=1, ITOTAL
         ITEMP = VECBIN(I)
         IBYTEL = IAND(MSK0F,ISHFT(ITEMP,-8))
C        .... THE LEFT BYTE BECOMES RIGHT
         IBYTER = IAND(MSKF0,ISHFT(ITEMP, 8))
C        .... THE RIGHT BYTE BECOMES LEFT
         VECBIN(I) = IOR(IBYTER,IBYTEL)
  100 CONTINUE
C
       ITOT = 0
C
       DO NN = 1, NORECS
           CALL SBYTES(I8BUF,VECBIN(ITOT+1),0,16,0,256)
C          ... PACK 16-BIT WORD INTO 64 I*8 WORD
           ITOT = ITOT + 256
C
C          WRITE(OUTDGN,FMT='(64A8)',ERR=920)(I8BUF(M),M=1,64)
           WRITE(OUTDGN,ERR=920)I8BUF
C
       ENDDO
C
C
           WRITE(6,FMT='('' WRTDGN: WROTE '',I6,'' RECORDS TO '',
     1     '' FT'',I2,''F001.'')')NORECS,OUTDGN
       CLOSE (OUTDGN)
       GO TO 999
C
C
  920  CONTINUE
       WRITE(6,FMT='(/,'' WRTDGN : ERROR STOP, PARITY ERROR WHILE'',
     1   '' WRITING TO DESIGN FILE FT'',I2,''F001.!'')')OUTDGN
       STATUS = 7
       GO TO 999
C
  930  CONTINUE
       WRITE(6,FMT='(/,'' WRTDGN : ERROR STOP, UNABLE TO OPEN '',
     1   '' DESIGN FILE FT'',I2,''F001.!'')')OUTDGN
       STATUS = 6
C
  999  CONTINUE
       END