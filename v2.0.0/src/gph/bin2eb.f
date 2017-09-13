C          DATA SET BIN2EB     AT LEVEL 001 AS OF 04/16/93
       SUBROUTINE BIN2EB(INTG,CTEXT,NCHAR,CPLMI)
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:  BIN2EB        CONVERT BINARY INTEGER TO CHARACTER STRNG
C   PRGMMR: KRISHNA KUMAR       ORG: NP12     DATE:1999-07-01
C
C ABSTRACT: CONVERTS AN INTEGER (INTEGER*4) INTO A CHARACTER STRING
C   (CHARACTER*8) UNDER FORMAT CONTROL WHICH SPECIFIES THE FILL
C   CHARACTERS, THE SIGN CHARACTERS, AND POSITIONING.
C   A VERSION OF BIN2EB FOR IBM-FORTRAN77.
C   REMARK: THE 2ND ARGUMENT HAS TO BE A CHARACTER STRING.  THIS IS
C           THE ONLY DIFFERENT TO THE FORTRAN66. - LUKE
C
C PROGRAM HISTORY LOG:
C   74-11-09  SHIMOMURA
C   87-05-08  SHIMOMURA     F77 VERSION NAMED "INT2CH" W/ CHGS TO ARG LEN
C   92-08-26  SHIMOMURA     F77 VERSION RESTORED ORIGINAL BIN2EB ARG LEN
C                                     WITH OPTION FOR VARYING LENGTHS
C   95-01-05  LUKE LIN      CONVERT IT TO CFT-77.
C   97-03-13  LUKE LIN      ADD "M" FLAG.
C 1999-07-01  KRISHNA KUMAR CONVERTED FROM CRAY TO IBM RS/6000.
C
C USAGE:    CALL BIN2EB(INTG,CTEXT,NCHAR,CPLMI)
C   INPUT ARGUMENT LIST:
C     INTG     -   THE GIVEN BINARY INTEGER*4
C     NCHAR    -   NUMBER OF EBCDIC CHARS DESIRED IN THE CONVERTED
C              -   AND FORMATTED NUMBER-ZONE.   ACCEPTABLE RANGE
C              -   FOR NCHAR IS 1 TO 16
C              -   WHERE LIMCH=16 IS DEFINED IN PARMETER STATEMENT.
C              -   (NCHAR MUST COUNT SIGN POSITION IF SIGN DESIRED)
C     CPLMI   -   A 3-CHAR STRING  (FOR EXAMPLE,  CPLMI='A+-' )
C              -   FIRST  CHAR IS FORMAT CODE (SEE TABLE BELOW)
C              -   SECOND CHAR IS CHAR DESIRED FOR SIGN OF POSITIVE- OR
C                         ZERO-VALUED NUMBER
C              -   THIRD  CHAR IS CHAR DESIRED FOR SIGN OF NEGATIVE-
C                         VALUED NUMBER
C              -   A '9' IN THE SECOND OR THIRD POSITION WILL BE
C              -     INTERPRETED AS: "OMIT THAT SIGN!"
C
C              -   (AN OPTIONAL 4TH CHAR MAY BE USED TO DESIGNATE THE
C                    CHAR DESIRED FOR SIGN OF ZERO-VALUED NUMBER;
C                    IN WHICH CASE THE SECOND CHAR WILL BE USED FOR
C                    POSITIVE-VALUED NUMBER ONLY.)
C
C   OUTPUT ARGUMENT LIST:      (INCLUDING WORK ARRAYS)
C     CTEXT    -   RESULTING CHARACTER STRING.  THE VALUE OF THE
C              -   GIVEN INTEGER EXPRESSED AS EBCDIC CHARACTERS.
C              -   USER SHOULD DECLARE CTEXT AS CHARACTER*8
C              -   (CHARACTER STRING LENGTH CAN BE VARIED UP TO AN
C              -     UPPER LIMIT OF 16 CHARACTERS.)
C
C              -   ON ERRORS IN ARGS,
C                  IF NCHAR IS .LE. 0  OR
C                  IF FORMAT CODE IN CPLMI IS UNKNOWN TO ME,
C                  THEN THE ERROR IS INDICATED BY RETURNING WITH
C                     CTEXT = '********'
C                         WHERE NO. OF ASTERISKS IN THAT IS
C                         DETERMINED BY LEN(CTEXT)
C
C REMARKS: LIST CAVEATS, OTHER HELPFUL HINTS OR INFORMATION
C     ----------------------------------------------------------------
C              F O R M A T    D E S C R I P T I O N
C
C     FORMAT  JUSTIFIED   LEADING FILL        FILL OUTSIDE        FIXED
C      CODE  W/I 8-CHAR  CHAR ABV HI-        NCHAR-WIDE           OR
C               CTEXT     ORDER DIGIT         FIELD               MOVING
C                         W/I NCHAR-WIDTH                         SIGN**
C
C      'L'      LEFT       ZERO CHAR.     BINARY ZEROS TO RIGHT   FIXED
C      'R'      RIGHT      ZERO CHAR.     BINARY ZEROS TO LEFT    FIXED
C
C      'A'      LEFT       ZERO CHAR.     BLANK CHARS  TO RIGHT   FIXED
C      'B'      RIGHT      ZERO CHAR.     BLANK CHARS  TO LEFT    FIXED
C
C      'I'      LEFT       BLANK CHAR.    BLANK CHARS  TO RIGHT   MOVING
C      'J'      RIGHT      BLANK CHAR.    BLANK CHARS  TO LEFT    MOVING
C
C      'S'      LEFT       ASTERISK       BLANK CHARS  TO RIGHT   FIXED
C      'U'      LEFT       ASTERISK       BLANK CHARS  TO RIGHT   MOVING
C
C      'E'      LEFT       ASTERISK       BLANK CHARS  TO RIGHT   FIXED
C      'F'      LEFT       ASTERISK       BLANK CHARS  TO RIGHT   MOVING
C
C      'W'      LEFT       POUND SIGN'#'  BLANK CHARS  TO RIGHT   FIXED
C      'Y'      LEFT       POUND SIGN'#'  BLANK CHARS  TO RIGHT   MOVING
C
C      'M'      LEFT       POUND SIGN'$'  BLANK CHARS  TO RIGHT   FIXED
C
C     ** WHERE "FIXED" SIGN-POSITION IS THE HI-ORDER CHAR POSITION
C       WITHIN THE NCHAR-WIDE FIELD, WHICH CAN BE LEFT- OR RIGHT-
C       JUSTIFIED WITHIN THE 8-CHAR WIDE CTEXT,
C       WHILE THE "MOVING" SIGN IS POSITIONED ADJACENT TO THE HI-ORDER
C       DIGIT OF THE CONVERTED NUMBER.
C       WHEN SIGN IS REQUESTED, IT HAS PRIORITY OVER A DIGIT OCCUPYING
C       THE SAME CHAR POSITION.
C
C     THE LOGIC OF THE CONVERSION BEGINS WITH THE UNITS DIGIT OF THE
C       GIVEN INTG AND WORKS TOWARD HIGHER-ORDER SIGNIFICANT DIGITS
C       UNTIL NCHAR IS SATISFIED.  SO IF NCHAR IS NOT WIDE ENOUGH
C       FOR THE VALUE IN INTG, THEN THE MOST SIGNIFICANT DIGITS
C       ARE LOST.
C
C     FORMAT CODES 'E' AND 'F' DIFFER FROM SIMILAR 'S' AND 'U' IN
C       THAT 'E' AND 'F' YIELDS A MINIMUM OF 2 CHARACTERS IN THE
C       RESULTING NUMBER.  IF ONLY A UNITS POSITION OF SIGNIFICANCE
C       THEN IT INSERTS A LEADING ZERO-CHARACTER BEFORE SWITCHING
C       TO THE ASTERISK FILL-CHARACTER OR SIGN AS APPROPRIATE.
C
C     -----------------------------------------------------------------
C     *     *     *     *     *     *     *     *     *     *     *
C      CAUTION:
C      ... IF YOU ARE SUBSTITUTING THIS F-77 SUBROUTINE FOR BIN2EB,
C      ...   (THE IBM FORTRAN-66, H EXT)
C      ... THEN, BEWARE OF:  THE RESULTING CTEXT
C      ...   USED TO BE 8-BYTES IN INTEGER*4 IBCD(2) ARRAY
C      ...   NOW IS 8-BYTES IN CHARACTER*8 CTEXT
C
C      ...   AND THE FORMAT SPECIFIER WHICH USED TO BE 3-BYTES
C      ...   LONG "LPLMI" HAS BEEN CHANGED TO CHARACTER*3 CPLMI
C
C      ...   YOU SHOULD DECLARE CHARACTER*8  CTEXT
C      ...   AND                CHARACTER*3  CPLMI
C
C      ...   IF YOU USE THE OPTIONAL 4TH CHAR OF CPLMI FOR THE SIGN
C      ...   OF ZERO-VALUED NUMBERS, THEN YOU MUST DECLARE:
C                   CHARACTER*4  CPLMI
C            IF YOU HAVE DECLARED THAT AS C*4 AND YOU DECIDE TO USE
C            ONLY THE THREE-CHARACTER CPLMI MODE, THEN IN THE CALL TO
C            BIN2EB YOU MUST EXPLICITLY STATE THE LENGTH BY:
C                   CALL BIN2EB(,,,CPLMI(1:3))
C            OTHERWISE, I WILL FIND THE LENGTH TO BE THE COMPILED
C            LENGTH OF 4 BYTES, AND SO I WILL ACCEPT WHATEVER IS THERE
C            AT THE FOURTH BYTE AND STICK IT ON THE ZERO-VALUED NUMBER
C            EVEN THOUGH YOU DEFINED ONLY THREE OF THE FOUR CHARACTERS
C            OF CPLMI.
C
C            IN THE OLD BIN2EB, YOU ALWAYS HAD TO REMEMBER THAT THE
C            RESULT WAS TWO INTEGER*4 WORDS LONG, EVEN THOUGH THE
C            PORTION YOU WANTED FIT INTO ONLY ONE WORD.  FOLLOWING THAT
C            CONVENTION, IF YOU WANT THE LEAST CHANGE TO YOUR EXISTING
C            PROGRAM LOGIC, THEN YOU SHOULD DECLARE, FOR THE RESULTS:
C                   CHARACTER*8 CTEXT
C            WHICH WOULD HAVE THE SAME SIZE IN NUMBER-OF-BYTES AS
C            THE TWO-WORD RESULTS IN THE OLD BIN2EB.
C
C            HOWEVER, THIS NEW VERSION OF BIN2EB HAS A HIDDEN CAPABILITY
C            TO PERMIT YOU TO VARY THE SIZE OF THAT DESTINATION STRING,
C            IF YOU SO DESIRE, UP TO A MAXIMUM OF 16 BYTES.
C            I WILL DETERMINE WHAT SIZE YOU INTEND FROM THE LENGTH OF
C            THE CHARACTER STRING WHICH YOU PRESENT TO ME IN THE
C            SECOND ARGUMENT.  THIS FLEXIBILITY COMES WITH A COST, THAT
C            YOU HAVE TO BE CAREFUL.  IF YOUR COMPILED-IN SIZE IS:
C                   CHARACTER*8 CTEXT
C            AND IF YOU WANT THE RESULTS OVERALL SIZE TO BE FOUR BYTES
C            INSTEAD OF EIGHT BYTES, THEN YOU MUST EXPLICITLY TELL ME
C            THAT RESTRICTED SIZE IN THE CTEXT ARGUMENT BY:
C                   CALL BIN2EB( ,CTEXT(1:4),, )
C
C
C     *     *     *     *     *     *     *     *     *     *     *
C
C ATTRIBUTES:
C   LANGUAGE: F90
C   MACHINE:  IBM
C
C$$$
C
       INTEGER    LIMCH
       PARAMETER (LIMCH = 16)
       INTEGER    LIMI4
       PARAMETER (LIMI4 = LIMCH/8)
C
       INTEGER       INTG
C      ... WHERE INTG IS GIVEN I*4 BINARY INTEGER TO BE CONVERTED.
       CHARACTER*(*)  CTEXT
C      ... WHERE CTEXT IS RESULTING CHARACTER STRING
C      ... CAUTION: RESULTING CTEXT IS A FIELD OF 8 CHARACTERS
C      ...   WITHIN WHICH NCHAR CHARS ARE CONVERTED DIGITS
C      ...   WITH FILL AS SPECIFIED IN FORMAT CODE CPLMI.
       INTEGER       NCHAR
C      ... WHERE NCHAR IS NUMBER OF CHARS DESIRED CONVERTED
       CHARACTER*(*)   CPLMI
C      ... WHERE CPLMI IS FORMAT CODE FOR RESULTS ...
C      ...   CODE + SIGN-FOR-POS + SIGN-FOR-NEG
C
       CHARACTER*1  CDIGIT(LIMCH)
C      ... WHERE CDIGIT IS WORK AREA FOR RESULTING CHARACTER STRING
       INTEGER      IDIGIT(LIMI4)
       EQUIVALENCE (CDIGIT(1),IDIGIT(1))
C
C      ... LOGICAL SWITCHES ...
       LOGICAL*1  SIGNQ
       LOGICAL*1  LZIP
       LOGICAL*1  SWFIXS
       LOGICAL*1  SIGNIN
       LOGICAL*1  SWZR
       LOGICAL*1  SWTS
C
       INTEGER*8     KLANK
       CHARACTER*8   CKLANK
       EQUIVALENCE  (CKLANK,KLANK)
C
       INTEGER    MAXCH
C
       CHARACTER*1  FILLCH
C
       CHARACTER*1  FMTCOD
       CHARACTER*1  CPLUS
       CHARACTER*1  CMINUS
       CHARACTER*1  CZERO
       CHARACTER*4  CLITS
       EQUIVALENCE  (CLITS(1:1),FMTCOD)
       EQUIVALENCE  (CLITS(2:2),CPLUS)
       EQUIVALENCE  (CLITS(3:3),CMINUS)
       EQUIVALENCE  (CLITS(4:4),CZERO)
C
       CHARACTER*1  SIGNCH
C
       DATA          CKLANK / '        ' /
C
C      . . .   S T A R T   . . .
C
       INUMB = INTG
       MAXCH = LEN(CTEXT)
       IF(MAXCH .LE. 0) THEN
C        ... ERROR.  NEEDS RECOMPILING WITH CTEXT DEFINED AS CHAR STRING
C        ...         I CANNOT SET TO '********' SINCE IT HAS NO LENGTH
         GO TO 999
       ELSE IF (MAXCH .GT. LIMCH) THEN
C        ... WARNING.  I AM RESETTING FOR LIMITING NO. OF CHAR = LIMCH
         MAXCH = LIMCH
       ENDIF
C      ... NOW MAXCH IN RANGE FROM 1 TO LIMCH ...
C
       NLIT = LEN(CPLMI)
       IF(NLIT .LE. 0) GO TO 900
C         ... ERROR.  NEEDS RECOMPILING WITH CPLMI DEFINED AS CHAR STR
       IF(NLIT .GT. 4)NLIT = 4
C      ... NOW NLIT IN RANGE 1 TO 4 ...
       CLITS = 'A+-*'
C      ... WHICH SETS DEFAULT VALUES ...
       CLITS(1:NLIT) = CPLMI(1:NLIT)
       IF(NLIT .EQ. 3) THEN
         CLITS(4:4) = CPLMI(2:2)
C        ... ABOVE PATCH FOR GOING BACK TO 3 LETTER CODE FOR CPLMI
C        ... THE SIGN FOR ZERO-VALUED WILL BE SAME AS FOR POSITIVE-
C        ... VALUED AS IN ORIGINAL BIN2EB()
       ENDIF
C ...      WRITE(6,121)CLITS(1:4)
C ... 121  FORMAT(1H ,'BIN2EB:CLITS="',A)
C
       MAXI = NCHAR
C      ... TEST FOR ACCEPTABLE RANGE OF NCHAR
       IF(MAXI .LE. 0) GO TO 290
       IF(MAXI .GT. MAXCH) MAXI = MAXCH
C      ... INITIALIZE WORK BUFFER FOR TRAILING BLANK CHAR FILL ...
       DO  122  I = 1,LIMI4
         IDIGIT(I) = KLANK
  122  CONTINUE
C
       SIGNQ = .FALSE.
       LZIP  = .FALSE.
       IF(INUMB .GT. 0) THEN
C        ... COMES HERE IF INUMB IS POSITIVE-VALUED ...
         IF(CPLUS .NE. '9') THEN
C          ... A SIGN CHARACTER IS DESIRED ON THIS POSITIVE-VALUED INUMB
           SIGNCH = CPLUS
           SIGNQ = .TRUE.
         ENDIF
C
       ELSE IF (INUMB .EQ. 0) THEN
         IF(CZERO .NE. '9') THEN
C          ...  A SIGN CHARACTER IS DESIRED ON THIS ZERO-VALUED INUMB
           SIGNCH = CZERO
           SIGNQ = .TRUE.
         ENDIF
C
       ELSE
C      ... COMES HERE IF INUMB WAS NEGATIVE-VALUED ...
         INUMB = IABS(INUMB)
         IF(CMINUS .NE. '9') THEN
C          ...  A SIGN IS DESIRED ON THIS NEGATIVE INUMB
           SIGNCH = CMINUS
           SIGNQ = .TRUE.
         ENDIF
       ENDIF
C
       IF(FMTCOD .EQ. 'L') GO TO 300
       IF(FMTCOD .EQ. 'I') GO TO 400
       IF(FMTCOD .EQ. 'R') GO TO 330
       IF(FMTCOD .EQ. 'J') GO TO 360
       IF(FMTCOD .EQ. 'A') GO TO 310
       IF(FMTCOD .EQ. 'B') GO TO 340
       IF(FMTCOD .EQ. 'S') GO TO 610
       IF(FMTCOD .EQ. 'W') GO TO 630
       IF(FMTCOD .EQ. 'U') GO TO 620
       IF(FMTCOD .EQ. 'Y') GO TO 640
       IF(FMTCOD .EQ. 'E') GO TO 710
       IF(FMTCOD .EQ. 'F') GO TO 720
       IF(FMTCOD .EQ. 'M') GO TO 810
C      ... OTHERWISE, GIVEN FORMAT CODE IS NOT DEFINED ...
  290  CONTINUE
       DO 297 I = 1,MAXCH
         CDIGIT(I) = '*'
  297  CONTINUE
       GO TO 500
C
  300  CONTINUE
C      ... COMES HERE FOR 'L' FORMAT CODE ...
       FILLCH = '0'
C      ... FOR LEADING ZERO-CHARACTER FILL
       DO  304 I = 1,LIMI4
         IDIGIT(I) = 0
  304  CONTINUE
C      ... FOR TRAILING BINARY-ZERO FILL
       SWFIXS = .TRUE.
C      ... INDICATES SIGN IS IN FIXED POSITION
       GO TO 401
C
  310  CONTINUE
C      ... COMES HERE FOR 'A' FORMAT CODE ...
       FILLCH = '0'
C      ... FOR LEADING ZERO-CHARACTER FILL
C      ... FOR TRAILING BLANK CHAR FILL; ALREADY INITIALIZED.
       SWFIXS = .TRUE.
C      ... INDICATES SIGN IS IN FIXED POSITION
       GO TO 401
C
  610  CONTINUE
C      ... COMES HERE FOR 'S' FORMAT CODE ...
       FILLCH = '*'
C      ... FOR LEADING STAR-CHARACTER FILL
C      ... FOR TRAILING BLANK CHAR FILL; ALREADY INITIALIZED.
       SWFIXS = .TRUE.
C      ... INDICATES SIGN IS IN FIXED POSITION
       GO TO 401
C
  620  CONTINUE
C      ... COMES HERE FOR 'U' FORMAT CODE ...
       FILLCH = '*'
C      ... FOR LEADING STAR-CHARACTER FILL
C      ... FOR TRAILING BLANK CHAR FILL; ALREADY INITIALIZED.
       SWFIXS = .FALSE.
C      ... INDICATES SIGN IS IN FLOATING POSITION
       GO TO 401
C
  710  CONTINUE
C      ... COMES HERE FOR 'E' FORMAT CODE ...
       FILLCH = '*'
C      ... FOR LEADING STAR-CHARACTER FILL
C      ... FOR TRAILING BLANK FILL; ALREADY INITIALIZED.
       SWFIXS = .TRUE.
C      ... INDICATES SIGN IS IN FIXED POSITION
       LZIP = .TRUE.
       GO TO 401
C
  720  CONTINUE
C      ... COMES HERE FOR 'F' FORMAT CODE ...
       FILLCH = '*'
C      ... FOR LEADING STAR-CHARACTER FILL
C      ... FOR TRAILING BLANK FILL; ALREADY INITIALIZED.
       SWFIXS = .FALSE.
C      ... INDICATES SIGN IS IN FLOATING POSITION
       LZIP = .TRUE.
       GO TO 401
C
  810  CONTINUE
C      ... COMES HERE FOR 'M' FORMAT CODE ...
       FILLCH = '$'
C      ... FOR LEADING POUND-SIGN-CHARACTER FILL
C      ... FOR TRAILING BLANK FILL; ALREADY INITIALIZED.
       SWFIXS = .TRUE.
C      ... INDICATES SIGN IS IN FIXED POSITION
       GO TO 401
C
  630  CONTINUE
C      ... COMES HERE FOR 'W' FORMAT CODE ...
       FILLCH = '#'
C      ... FOR LEADING POUND-SIGN-CHARACTER FILL
C      ... FOR TRAILING BLANK FILL; ALREADY INITIALIZED.
       SWFIXS = .TRUE.
C      ... INDICATES SIGN IS IN FIXED POSITION
       GO TO 401
C
  640  CONTINUE
C      ... COMES HERE FOR 'Y' FORMAT CODE ...
       FILLCH = '#'
C      ... FOR LEADING POUND-SIGN-CHARACTER FILL
C      ... FOR TRAILING BLANK FILL; ALREADY INITIALIZED.
       SWFIXS = .FALSE.
C      ... INDICATES SIGN IS IN FLOATING POSITION
       GO TO 401
C
  330  CONTINUE
C      ... COMES HERE FOR 'R' FORMAT CODE ...
       FILLCH = '0'
C      ... FOR LEADING ZERO-CHARACTER FILL
       DO  334 I = 1,LIMI4
         IDIGIT(I) = 0
  334  CONTINUE
C      ... FOR TRAILING BINARY-ZERO FILL
       SWFIXS = .TRUE.
C      ... INDICATES SIGN IS IN FIXED POSITION
       LSHF = 0
       GO TO 402
C
  340  CONTINUE
C      ... COMES HERE FOR 'B' FORMAT CODE ...
       FILLCH = '0'
C      ... FOR LEADING ZERO-CHARACTER FILL
C      ... FOR TRAILING BLANK FILL; ALREADY INITIALIZED.
       SWFIXS = .TRUE.
C      ... INDICATES SIGN IS IN FIXED POSITION
       LSHF = 0
       GO TO 402
C
  360  CONTINUE
C      ... COMES HERE FOR 'J' FORMAT CODE ...
       FILLCH = ' '
C      ... FOR LEADING BLANK-CHARACTER FILL
C      ... FOR TRAILING BLANK FILL; ALREADY INITIALIZED.
       SWFIXS = .FALSE.
C      ... INDICATES SIGN IS IN FLOATING POSITION
       LSHF = 0
       GO TO 402
C
  400  CONTINUE
C      ... COMES HERE FOR 'I' FORMAT CODE ...
       FILLCH = ' '
C      ... FOR LEADING BLANK-CHARACTER FILL
C      ... FOR TRAILING BLANK FILL; ALREADY INITIALIZED.
       SWFIXS = .FALSE.
C      ... INDICATES SIGN IS IN FLOATING POSITION
       GO TO 401
C
C
  401  CONTINUE
       LSHF = MAXCH - MAXI
  402  CONTINUE
       SIGNIN = .FALSE.
C      ... WHERE SIGNIN IS SET WHEN SIGN IS PUT INTO RESULT
       SWZR = .FALSE.
C      ... WHERE SWZR IS SET WHEN ONLY HI-ORDER ZEROS REMAIN
       SWTS = .FALSE.
C      ... WHERE SWTS IS SET WHEN SWZR IS SET, TO TEST SIGN ON NXT LOOP
C
       DO  422  ICOW = 1,MAXI
         ISS = MAXCH + 1 - ICOW
         ISS = ISS - LSHF
         IF(ICOW .NE. MAXI) GO TO 409
C        ... OTHERWISE, ICOW=MAXI; I AM AT LEFTMOST CHAR W/I DATA FLD
         IF(SIGNIN) GO TO 409
         IF(.NOT. SIGNQ) GO TO 409
C        ... OTHERWISE, PUT SIGN-CHARACTER IN AND JUMP OUT
         CDIGIT(ISS) = SIGNCH
         GO TO 500
C
  409    CONTINUE
         IF(.NOT. SWZR) GO TO 413
C        ... ELSE, SWZR HAD BEEN SET; ONLY HI ORDER ZEROS REMAIN
         IF(SWFIXS) GO TO 411
         IF(.NOT. SWTS) GO TO 411
C        ... ELSE, SWTS HAD BEEN SET ...
         SWTS = .FALSE.
         IF(.NOT. SIGNQ) GO TO 411
C        ... ELSE, THERE IS A SIGN-CHARACTER TO BE INSERTED HERE
         CDIGIT(ISS) = SIGNCH
         SIGNIN = .TRUE.
         GO TO 422
C
  411    CONTINUE
C        ... COMES HERE IF LEADING FILL CHARACTER TO BE PUT HERE
         CDIGIT(ISS) = FILLCH
         GO TO 422
C
  413    CONTINUE
C        ... CONVERT ONE DIGIT HERE ...
         IDEC = MOD(INUMB,10)
         CDIGIT(ISS) = CHAR(IDEC + MOVA2I('0'))
         INUMB = INUMB / 10
C        ... TO REDUCE WORK NUMBER VALUE  BY ONE DECIMAL DIGIT
         IF(INUMB .NE. 0) GO TO 422
         IF(LZIP .AND. (ICOW .EQ. 1)) GO TO 422
C        ... TO PRESERVE AT LEAST TWO CHARACTERS WHEN FORMAT 'E' OR 'F'
C        ... OTHERWISE, NO MORE LEADING SIGNIF DIGITS ...
         SWZR = .TRUE.
         SWTS = .TRUE.
  422  CONTINUE
       GO TO 500
C
  500  CONTINUE
       DO 511 I = 1,MAXCH
         CTEXT(I:I) = CDIGIT(I)
  511  CONTINUE
       GO TO 999
C
  900  CONTINUE
       DO  906 I = 1,MAXCH
         CTEXT(I:I) = '*'
  906  CONTINUE
       GO TO 999
C
  999  CONTINUE
       RETURN
       END