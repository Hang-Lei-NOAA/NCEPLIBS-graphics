* parpia@us.ibm.com  2013/02/19

      PROGRAM DRIVER

      IMPLICIT NONE

      INTEGER*8 I, J

      INTEGER*4 I4S(2), I4D(2)
      CHARACTER*1 C1S(8), C1D(8)

      EQUIVALENCE (I4S,C1S)
      EQUIVALENCE (I4D,C1D)

* Move a single bit forwards and backwards

      WRITE (*, '(A)') 'Single bit:'
      WRITE (*, '(A)') 'Forward movement'
      DO I = 1, 10
        I4S(1:2) = 0
        I4S(1) = Z'00000001'
        I4D(1:2) = 0
        WRITE (*, '(A,8B8.8)') 'Source vector: ', C1S
        CALL MOVBITZ (I4S, 7_8, 1_8, I4D, 7_8+I)
        WRITE (*, '(A,8B8.8)') 'Destnn vector: ', C1D
      ENDDO

      WRITE (*, '(A)') 'Backward movement'
      DO I = 1, 10
        I4S(1:2) = 0
        I4S(2) = Z'00000001'
        I4D(1:2) = 0
        WRITE (*, '(A,8B8.8)') 'Source vector: ', C1S
        CALL MOVBITZ (I4S, 39_8, 1_8, I4D, 7_8+I)
        WRITE (*, '(A,8B8.8)') 'Destnn vector: ', C1D
      ENDDO

* Move two bits that straddle a byte boundary forwards and back

      WRITE (*, '(A)') 'Adjacent pair straddling byte boundary:'
      WRITE (*, '(A)') 'Forward movement'
      DO I = 1, 10
        I4S(1:2) = 0
        I4S(1) = Z'00008001'
        I4D(1:2) = 0
        WRITE (*, '(A,8B8.8)') 'Source vector: ', C1S
        CALL MOVBITZ (I4S, 7_8, 2_8, I4D, 7_8+I)
        WRITE (*, '(A,8B8.8)') 'Destnn vector: ', C1D
      ENDDO

      WRITE (*, '(A)') 'Backward movement'
      DO I = 1, 10
        I4S(1:2) = 0
        I4S(2) = Z'00008001'
        I4D(1:2) = 0
        WRITE (*, '(A,8B8.8)') 'Source vector: ', C1S
        CALL MOVBITZ (I4S, 39_8, 2_8, I4D, 7_8+I)
        WRITE (*, '(A,8B8.8)') 'Destnn vector: ', C1D
      ENDDO

* Byte within byte boundaries

      WRITE (*, '(A)') 'Byte within byte boundaries:'
      WRITE (*, '(A)') 'Forward movement'
      DO I = 1, 10
        I4S(1:2) = 0
        I4S(1) = Z'0000FF00'
        I4D(1:2) = 0
        WRITE (*, '(A,8B8.8)') 'Source vector: ', C1S
        CALL MOVBITZ (I4S, 7_8, 8_8, I4D, 7_8+I)
        WRITE (*, '(A,8B8.8)') 'Destnn vector: ', C1D
      ENDDO

      WRITE (*, '(A)') 'Backward movement'
      DO I = 1, 10
        I4S(1:2) = 0
        I4S(2) = Z'0000FF00'
        I4D(1:2) = 0
        WRITE (*, '(A,8B8.8)') 'Source vector: ', C1S
        CALL MOVBITZ (I4S, 39_8, 8_8, I4D, 7_8+I)
        WRITE (*, '(A,8B8.8)') 'Destnn vector: ', C1D
      ENDDO

* Byte straddling byte boundary

      WRITE (*, '(A)') 'Byte straddling byte boundaries:'
      WRITE (*, '(A)') 'Forward movement'
      DO I = 1, 10
        I4S(1:2) = 0
        I4S(1) = Z'00F00F00'
        I4D(1:2) = 0
        WRITE (*, '(A,8B8.8)') 'Source vector: ', C1S
        CALL MOVBITZ (I4S, 12_8, 8_8, I4D, 12_8+I)
        WRITE (*, '(A,8B8.8)') 'Destnn vector: ', C1D
      ENDDO

      WRITE (*, '(A)') 'Backward movement'
      DO I = 1, 10
        I4S(1:2) = 0
        I4S(2) = Z'00F00F00'
        I4D(1:2) = 0
        WRITE (*, '(A,8B8.8)') 'Source vector: ', C1S
        CALL MOVBITZ (I4S, 44_8, 8_8, I4D, 12_8+I)
        WRITE (*, '(A,8B8.8)') 'Destnn vector: ', C1D
      ENDDO

      END
