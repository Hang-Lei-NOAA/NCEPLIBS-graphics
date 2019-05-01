      SUBROUTINE DGNOPN(OUTDGN,STATUS)
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    DGNOPN      OPEN THE INTERMEDIATES DESIGN FILE.
C   PRGMMR: KRISHNA KUMAR     ORG: W/NP12    DATE: 1999-07-01
C
C ABSTRACT: OPEN A DESIGN FILE AND THEN SCAN THROUGH THE FILE,
C   SAVE THE ENTIRE FILE INTO BIN, THEN GET THE POSITION WERE A NEW
C   ELEMENT COULD BE ATTACHED AT THE END OF THE FILE.
C
C PROGRAM HISTORY LOG:
C   94-04-05  ORIGINAL AUTHOR LIN
C   94-12-21  LUKE LIN      CONVERT IT TO CFT-77.
C   95-01-06  LUKE LIN      CHANGE SEQUENTIAL I/O TO UNBLOCKED I/O
C   95-02-10  LUKE LIN      MODIFY SWAPPING BYTES LOGIC.
C 1999-07-01  KRISHNA KUMAR CONVERTED THIS CODE TO IBM RS/6000     
C                           FROM CRAY
C
C USAGE:    CALL DGNOPN(OUTDGN,STATUS)
C   INPUT ARGUMENT LIST:
C     OUTDGN   - INTEGER*4 UNIT NUMBER OF INTERMEDIATE DESIGN FILE.
C
C   OUTPUT ARGUMENT LIST:
C     STATUS   - INTEGER*4 RETURN CODE WHERE:
C              - =0, NORMAL
C              - =1, NOT ENOUGH BIN SPACE FOR INPUT DGN FILE
C              - =2, ERROR OPENING DESIGN FILE
C              - =3, ERROR WHILE SCANING INPUT DGN FILE
C
C   INPUT FILES:
C     FTXXF001 - DESIGN FILE WHERE XX = OUTDGN.
C
C   OUTPUT FILES:
C     FT06F001 - INCLUDE IF ANY PRINTOUT
C
C REMARKS: LIST CAVEATS, OTHER HELPFUL HINTS OR INFORMATION
C
C ATTRIBUTES:
C   LANGUAGE: F90
C   MACHINE:  IBM
C
C$$$
C
C
       COMMON     / DGNBIN / VECBIN,MAXBIN,IMDEX,ITOTWD
C
       INTEGER    OUTDGN
       INTEGER    STATUS
C
       INTEGER    I2BUF(256)
       INTEGER    VECBIN(409800)
C
       INTEGER*8  I8BUF(64)
C
C      ... WHERE 409800 HALFWORDS = 400 VAX BLOCKS
C
C
       NBUF = 0
       ITOT = 0
       STATUS = 0
C
C
C      OPEN (UNIT=OUTDGN,ERR=930,
C    &      FORM='FORMATTED',ACCESS='SEQUENTIAL')
       OPEN (UNIT=OUTDGN,ERR=930,
     &      FORM='UNFORMATTED',ACCESS='SEQUENTIAL')
C
         NBUF = 1
         ITOT = 0
C
C
  200  CONTINUE
C
C???   READ(OUTDGN,FMT='(128A4)',ERR=920,END=300)(I4BUF(M),M=1, 128)
C??    READ(OUTDGN,FMT='(64A8)',ERR=920,END=300)(I8BUF(M),M=1, 64)
       READ(OUTDGN,ERR=920,END=300)I8BUF
C
C      .... SWAP THE BYTE ORDER
C
       CALL SWABYT(256,I8BUF,I2BUF)
C
       NBUF = NBUF + 1
         ISAVE = ITOT + 256
         IF(ISAVE .GT. MAXBIN) THEN
            WRITE(6,FMT='(/,'' DGNOPN: FATAL ERROR, ARRAY TOO'',
     1          '' TOO SMALL, MAXBIN='',I5)')MAXBIN
            STATUS = 1
         ELSE
C
            DO  II = 1, 256
                VECBIN(ITOT+II) = I2BUF(II)
            ENDDO
            ITOT = ITOT + 256
C
            GO TO 200
         ENDIF
C
  300  CONTINUE
          WRITE(6,FMT='('' DGNOPN: END OF THE INPUT FILE FT'',I2,
     1    '' , ITOT='',I6)')OUTDGN,ITOT
          ITOTWD = ITOT
C
       GO TO 999
C
  920  CONTINUE
          WRITE(6,FMT='('' DGNOPN: ERROR STOP. PARITY ERROR '',
     1    ''WHILE READING FT'',I2,'' DESIGN FILE.'')')OUTDGN
       STATUS = 3
       GO TO 999
C
  930  CONTINUE
          WRITE(6,FMT='('' DGNOPN: ERROR STOP. UNABLE TO OPE'',
     1    ''N FT'',I2,'' DESIGN FILE.'')')OUTDGN
       STATUS = 2
C
  999  CONTINUE
       RETURN
       END