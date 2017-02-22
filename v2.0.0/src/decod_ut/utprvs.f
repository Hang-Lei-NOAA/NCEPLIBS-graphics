	SUBROUTINE UT_PRVS  ( dcdstr )
C************************************************************************
C* UT_PRVS								*
C*									*
C* Given a string containing a decoder program name and version number,	*
C* this routine writes the string to the decoder log along with the	*
C* version numbers of the underlying NAWIPS and BUFRLIB software.	*
C*									*
C* UT_PRVS ( DCDSTR )							*
C*									*
C* Input parameter:							*
C*	DCDSTR		CHAR*		String containing decoder name	*
C*					and version number		*
C**									*
C* Log:									*
C* J. Ator/NCEP		02/11						*
C* J. Ator/NCEP		10/12	Update to v2.0.0 of decod_ut library	*
C************************************************************************
	CHARACTER*(*)	dcdstr
C*
	CHARACTER	logmsg*80, cnvstr*20, cbvstr*8
C*-----------------------------------------------------------------------
	logmsg = '================================================'
	CALL DC_WLOG  ( 0, 'DC', 2, logmsg, ierwlg )
C
	logmsg = 'This is ' // dcdstr
	CALL DC_WLOG  ( 0, 'DC', 2, logmsg, ierwlg )
C
	CALL SS_VERS  ( cnvstr, iervrs )
	CALL ST_NULL  ( cnvstr, cnvstr, lens, iernul )
	CALL BVERS  ( cbvstr )
	logmsg = 'running NAWIPS v' // cnvstr (9:lens) //
     +	    ' and DECOD_UT v2.0.0' //
     +	    ' and BUFRLIB v' // cbvstr
	CALL DC_WLOG  ( 0, 'DC', 2, logmsg, ierwlg )
C
	logmsg = '================================================'
	CALL DC_WLOG  ( 0, 'DC', 2, logmsg, ierwlg )
C*
	RETURN
	END
