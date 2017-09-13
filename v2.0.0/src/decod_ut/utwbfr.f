	SUBROUTINE UT_WBFR  ( iunbfo, mbstr, iforce, iret )
C************************************************************************
C* UT_WBFR								*
C*									*
C* Normally, this subroutine writes the BUFR output for a report into	*
C* the current BUFR message within memory, and it then checks whether	*
C* any completed BUFR messages are waiting to be written out and, if so,*
C* flushes them to DBNet.  However, this subroutine can also be called	*
C* in an alternate context where there is no BUFR report output to be	*
C* stored and where the input flag IFORCE is set to a value of 1, in	*
C* which case this is a signal to force a flush (to DBNet) of any	*
C* current BUFR message within memory.					*
C*									*
C* UT_WBFR ( IUNBFO, MBSTR, IFORCE, IRET )				*
C*									*
C* Input parameters:							*
C*	IUNBFO		INTEGER		BUFR output file unit number	*
C*	MBSTR		CHARACTER*10	String of up to 10 characters	*
C*					describing the BUFR data	*
C*	IFORCE		INTEGER		Processing flag:		*
C*					    0 = normal value; BUFR	*
C*						report output is to be	*
C*						stored, and any finished*
C*						BUFR messages will be	*
C*						flushed to DBNet	*
C*					    1 = no BUFR report output	*
C*						is to be stored, but any*
C*						current	BUFR message in	*
C*						memory will be forcibly	*
C*						flushed to DBNet	*
C*									*
C* Output parameters:							*
C*	IRET		INTEGER		Return code:			*
C*					 0 - normal return		*
C*									*
C**									*
C* Log:									*
C* J. Ator/NCEP		06/01						*
C* J. Ator/NCEP		03/09	Added MXBFRMD4 argument to WRITSA call;	*
C*				changed force flag to an integer	*
C************************************************************************
	INCLUDE		'BUFR.CMN'
C*
	CHARACTER*(*)	mbstr
C*
C*	The variable "mbst" must be dimensioned one byte larger than
C*	the length of the maximum-size string that it may contain,
C*	because DBN_BUFR, which is written in C, will append a trailing
C*	null character.
C*
	CHARACTER	mbst*11
C*
C*	The variable "mgbf" must be dimensioned at least as large
C*	as the value of MXBFRM divided by the size (in bytes) of
C*	an integer.  Thus, if the size of an integer is at least
C*	4 bytes, then the following will suffice.
C*
	PARAMETER	( MXBFRMD4 =  MXBFRM / 4 )
C*
	INTEGER		mgbf ( MXBFRMD4 )
C------------------------------------------------------------------------
	iret = 0
C
	IF  ( iforce .eq. 1 )  THEN
C
C*	    Check whether there is a current BUFR message within memory.
C
	    CALL STATUS  ( iunbfo, ist1, ist2, ist3 )
	    IF  ( ist3 .eq. 0 ) THEN
		RETURN
	    END IF
	    iunb = ( iunbfo * (-1) )
	ELSE 
	    iunb = iunbfo
	END IF
C
	CALL WRITSA  ( iunb, MXBFRMD4, mgbf, lmgbf )
	IF  ( lmgbf .gt. 0 )  THEN
C
C*	    Check the length of the input identification string.
C
	    CALL ST_LSTR ( mbstr, lmbstr, ierlst )
	    IF  ( lmbstr .gt. 10 )  THEN
		lmbst = 10
	    ELSE
		lmbst = lmbstr
	    END IF
	    mbst = mbstr ( 1 : lmbst )
C
C*	    Flush the BUFR message to DBNet.
C
	    CALL DBN_BUFR  ( mbst, lmbst, mgbf, lmgbf, ierdbf )
	END IF
C*
	RETURN
	END
